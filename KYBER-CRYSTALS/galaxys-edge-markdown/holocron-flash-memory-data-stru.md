# Holocron Flash Memory Data Structure

Holocrons contain a flash memory chip where audio data is stored. This document focuses on understanding its structure.

## Holocron PCBs

Images below show the PCBs for Series 1 Jedi and Sith holocrons, respectively. The SPI flash memory chip is highlighted in yellow.

*(Series 1 PCB images - Jedi and Sith)*

Images below show the PCBs for Series 2 Jedi and Sith holocrons, respectively. The SPI flash memory chip is highlighted in yellow.

*(Series 2 PCB images - Jedi and Sith)*

## SPI Flash Memory Chips

| Holocron | IC | Capacity |
|---|---|---|
| Series 1 - Jedi | N25Q016AS8 | 4MB |
| Series 1 - Sith | N25Q032AS8 | 2MB |
| Series 2 - Jedi | XT25F64B | 8MB |
| Series 2 - Sith | XT25F64B | 8MB |

## Obtaining the Memory Chip's Contents

The chip must be desoldered from the PCB and dumped using a device capable of reading SOP-8 SPI flash memory chips. A CH341A, TL866II Plus, or Bus Pirate with flashrom are some of the many options available.

> **Note:** As the memory chips contain copyrighted audio, dumps of their contents cannot be shared.

## Basic Data Structure

- The first two bytes identify the number of audio tracks stored on the chip.
- The next three bytes identify the location (memory offset) of the lookup table.
- The lookup table contains a 5-byte record for each audio track, identifying the starting location and its bitrate(?).
- Audio track data begins with a 32-byte header, optionally followed by mark and silence headers (indicated by the main header).
- Mark and silence headers begin with a 2-byte count followed by that many 2-byte records.
- Encoded audio data begins after the last header. The total length (including all headers) is indicated in the main header.

## Audio Format / Codec

The microcontroller used in Holocrons and Wayfinders is manufactured by **SONIX**. The audio is encoded in a proprietary SONIX codec.

There is some information online about a SONIX codec called "Audio32", likely based on the G.722.1 codec (according to [this GitHub repo](https://github.com/GMMan/aud32-decoder-host)). The header for Audio32 appears to align with headers seen in Holocron and Wayfinder audio tracks. However, attempts to decode the audio have so far been unsuccessful.

### SONIX Audio32 Codec Resources

- [DEFCON 26 - Dissecting Teddy Ruxpin (PDF)](https://media.defcon.org/DEF%20CON%2026/DEF%20CON%2026%20presentations/DEFCON-26-Amir-Etemadieh-Zenofex-Dissecting-Teddy-Ruxpin-Reverse-Engineering-the-Smart%20Bear.pdf) - appears to use the same audio format
- [DEFCON 26 Video](https://www.youtube.com/watch?v=C7SIL_JNSto)
- [G.722.1 Reference Implementation](https://www.itu.int/rec/T-REC-G.722.1)

### Relevant GitHub Repositories

| Repository | Notes |
|---|---|
| [aud32-decoder-host](https://github.com/GMMan/aud32-decoder-host) | |
| [aud32-decoder-client](https://github.com/GMMan/aud32-decoder-client/) | |
| [adafruit/snxrom](https://github.com/adafruit/snxrom) | |
| [adafruit/g722_1_mod](https://github.com/adafruit/g722_1_mod) | The Adafruit G.722.1 mod repository uses the reference implementation with Audio32 modifications (encoder only). Can we craft a decoder using this as an example? |
| [msmarks/python_g726](https://github.com/msmarks/python_g726) | |

- [Blog article](https://context1273.rssing.com/chan-54011996/article158.html) suggesting extracting libraries from an Android app for encode/decode

### Is It REALLY Audio32?

The sample rate and bitrate fields do not align with descriptions in Audio32 resources:

- Sample rate has values (hex) of `0x1ff`, `0x17f`, or `0x265` - none are large enough or divisible by common sample rates (8,000, 16,000, 32,000)
- Bitrate values don't quite align with expected values either
- The bitrate value does seem to align with the number of bits in a single "frame" of audio (`0x0200` = 512 bits = 64 bytes)

Perhaps the header format is shared among several SONIX audio codecs?

### Microcontroller Identification

An attempt at manually decapping the COB (epoxy blob covering the microcontroller die) of a Holocron identified the die as **"SLC88KF"** with a date of **"2017-SEP"**.

- No SONIX chips listed online match "SLC88KF"
- There is a range of SNC88 chips from the mid-2000s (a "24-channel MIDI/Speech Controller")
- Given the 2017 date, this may be a revision or a different chip

Looking through various SONIX datasheets for MCUs produced around 2017 (SNC86, SNC32), other possible codecs include:

- 4-bit HQDPCM
- 5-bit HQDPCM
- 5-bit ADPCM
- 5-bit ASDPCM
- 6-bit ASDPCM
- 8-bit ASDPCM
- 12-bit ASDPCM

ASDPCM appears to be for hardware-based decoding, while HQDPCM is for software-based decoding.

### Maybe It IS Audio32?!

Some rough calculations seem to indicate a 24Kbps bitrate for audio data, which would align with Audio32 at 12K sample rate.

Whichever encoding it is, the audio is broken into 64-byte "frames". Mark and silence tables likely identify frames where events and silence occur.

## Header Structure In Detail

### Root Header

| Offset | Description |
|---|---|
| `[00:01]` | Number of data blocks |
| `[02:04]` | Offset of index/lookup table |

### Lookup Table (per entry)

| Offset | Description |
|---|---|
| `[00:01]` | Sample rate (?) |
| `[02:04]` | Location where audio data begins |

### Audio Data Header - Main

| Offset | Description |
|---|---|
| `[00:01]` | `"UA"` (little-endian, read as `"AU"`) - marker for Audio32 codec |
| `[02:03]` | Sample rate (?) |
| `[04:05]` | Bitrate (?) |
