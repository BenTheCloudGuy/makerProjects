# Astromech Personality Chip

Personality chips are available from Droid Depot. They make your droid sound different and control your droid's affiliation with one of three factions: Scoundrels, the Resistance, or the First Order.

## Chip Colors and Affiliations

| Chip Color | Affiliation | Demo |
|---|---|---|
| Blue | Resistance | [YouTube](https://www.youtube.com/watch?v=X0sXQ2hA4Ss) |
| Gray | Scoundrel | |
| Red | First Order | [YouTube](https://www.youtube.com/watch?v=vU3g5itIlog) |
| Orange | Resistance | |
| Purple | Scoundrel | [YouTube](https://www.youtube.com/watch?v=RPJzqe2OsTQ) |
| Black | First Order | R2D2 (blue), CB23 (red), and Chopper (yellow) |
| Cyan (CB-23) | Scoundrel | [YouTube](https://www.youtube.com/watch?v=z9FjlEn29PM) |
| Yellow | Resistance | |
| Red 2 | Resistance | Same as CB-23 personality chip |
| Blue 2 | Scoundrel | |

---

## Technical Overview

The personality chip contains an SPI flash memory chip which contains encoded audio clips and identification as to which personality and faction it contains.

Audio data is organized into 12 groups. When using the remote to trigger droid sounds, the sound played will be randomly selected from one of the first 7 audio groups. When a droid is reacting to a Bluetooth beacon, the beacon's data will dictate from which of those first 7 groups to play an audio clip.

Different areas of Galaxy's Edge have different beacons. For example, a First Order area will have beacons identifying that audio from group 7 should be played, whereas Resistance area beacons identify that group 3 audio should be played. Organizing audio clips that contain similar "emotion" along with how droids react to beacons creates the droid's "personality" -- such as a Resistance personality chip causing the droid to play concerned noises when in a First Order area.

### Main Microcontroller

**Nordic Semiconductor nRF51822** -- Handles Bluetooth communications, tells the audio controller what clips to play, and controls the motors.

### Audio Controller

**General Plus GPCD9TP340A** -- Handles reading the personality chip and audio output; also responsible for controlling the LEDs on the droid. Identified in a Reddit thread.

### SPI Flash Memory Chip

**PUYA P25Q80H** -- Found in the personality chips; contains audio data.
- [LCSC product page](https://lcsc.com/product-detail/FLASH_PUYA-P25Q80H-SSH-IT_C194872.html)

### Audio Data Encoding

| Property | Value |
|---|---|
| Algorithm | A3400Pro 5Bit (proprietary to GeneralPlus) |
| Bit Rate | 42,000 bps |
| Sample Rate | 12,000 Hz |

---

## Audio Grouping Notes

When encountering a BLE beacon in the park, the droid will play a clip from a given group based on the beacon. Specifically, the **third byte** of the beacon's data refers to which audio group to play from. Valid values for that third byte are 1-7; the droid does not react when a higher value is in that position.

Sounds in groups 8-12 are shared across all personality chips, **except** the activation noise for the black personality chip is different.

### Audio Group by Location Within Galaxy's Edge

| Group | Sounds | GE Location | Notes |
|---|---|---|---|
| 1 | Droid | General | |
| 2 | Droid | Droid Depot | |
| 3 | Droid | Resistance | |
| 4 | Droid | Unknown | Only 1 sound; haven't seen an `0x04` beacon in the parks |
| 5 | Droid | Oga's Cantina (?) | Only 1 sound; droid detectors outside the cantina -- is this an "alarm" noise? |
| 6 | Droid | Dok-Ondar's | |
| 7 | Droid | First Order | Noise when droid goes to sleep comes from this group |
| 8 | Initial Activation | N/A | Only 1 sound; played during activation at Droid Depot. Black chip has BB-Series activation noise; all others have R-Series |
| 9 | Motor (?) | N/A | Only 1 sound; uncertain what it's used for |
| 10 | - | N/A | Empty group |
| 11 | Blaster | N/A | Triggered with a 10k resistance [1] |
| 12 | Thrusters | N/A | Triggered with a 4.7k resistance [1] |

> **[1]** Droid accessory hack: https://www.reddit.com/r/GalaxysEdge/comments/d6g9sx/droid_depot_runit_extracontroller_button_hack/

### Audio Clip Counts by Personality Chip

| Group | R-Series | BB-Series | Blue | Gray | Red | Orange | Purple | Black | CB-23 | C1-10P | D-O | Yellow | Blue 2 | BD-1 | Drum Kit |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 4 | 5 | 5 | 4 | 5 | 5 | 4 | 3 | 5 | 6 | - | 4 | 4 | 5 | 4 |
| 2 | 4 | 3 | 5 | 5 | 5 | 5 | 4 | 6 | 5 | 13 | - | 5 | 4 | 6 | 5 |
| 3 | 3 | 3 | 5 | 5 | 5 | 5 | 5 | 5 | 5 | 5 | - | 5 | 4 | 6 | 4 |
| 4 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | - | 1 | 1 | 1 | 1 |
| 5 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | - | 1 | 1 | 1 | 1 |
| 6 | 4 | 5 | 5 | 3 | 3 | 3 | 4 | 5 | 5 | 6 | - | 5 | 4 | 5 | 4 |
| 7 | 5 | 5 | 3 | 5 | 3 | 3 | 5 | 3 | 5 | 6 | - | 5 | 5 | 5 | 5 |
| 8 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | - | 1 | 1 | 1 | 1 |
| 9 | 1 | 0 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | - | 1 | 1 | 0 | 0 |
| 10 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | - | 0 | 0 | 0 | 0 |
| 11 | 2 | 0 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | - | 2 | 2 | 0 | 2 |
| 12 | 2 | 0 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | - | 2 | 2 | 0 | 2 |
| **Total** | **28** | **24** | **31** | **30** | **29** | **29** | **30** | **30** | **33** | **44** | - | **32** | **29** | **30** | **29** |

---

## Creating a Custom Personality Chip

Personality chips contain a single SPI Flash memory chip. The memory chip contains encoded audio clips organized into twelve groups, encoded as A3400Pro 5Bit with a bit rate of 42 kbps and a sample rate of 12 KHz. The audio format is proprietary to GeneralPlus, a company which manufactures the microcontroller that plays the audio clips.

### Audio Encoding Software

GeneralPlus offers two pieces of software from their website (http://www.generalplus.com/) for producing personality chips:

- **G+ Gadget** -- Contains several utilities needed to encode audio and prepare it for writing to the memory chip
- **G+ Eventor** -- Add event data to audio clips which control the behavior of the LEDs in a droid's head and accessories

> For a walk-through on creating audio clips and writing them to a personality chip, see the YouTube playlist covering the whole process.

### G+ Audio Batch Converter

Part of G+ Gadget. Used to encode audio files (WAV and other formats) into SP5 files playable by the droids.

- Audio clips need to already have a sample rate of **12 KHz** before processing
- Audio clips encoded with event data from G+ Eventor are then encoded into SP5 files
- Select encoding algorithm **A3400Pro 5Bit**; the bitrate option should be greyed out, but if not, set to 42000
- Under the "IO Event" tab, enable pins **1-5** and **17-21**, otherwise event data from G+ Eventor will not be included

### G+ File Merger

Part of G+ Gadget. Used to organize audio clips into groups and produce a single BIN file for writing to the memory chip.

- Personality chips have **12 groups**, each should be of type **Speech (0x00)**
- Audio groups can be named whatever you want (recommend simply naming them 1-12)
- Under **Merge Option**: check "Version 2", check "8 Bytes Head", select "GPCD9T" for body series
- The **Option Panel** section displays the memory chip's contents between address `0x20` and `0x40` and is used to specify the chip's ID and affiliation

### Option Panel: Bytes 0x20-0x40

| Byte (Offset) | Value | Notes |
|---|---|---|
| `0x20` | `0x01` or `0x02` | Black and CB-23 have `0x02`, all others have `0x01`. Possibly a version number. |
| `0x24` | Chip ID | |
| `0x26` | Chip ID | See table below; appears as the last byte of the droid's Bluetooth beacon data |
| `0x28` | Affiliation ID | See table below; a representation appears as the second-to-last byte of the beacon data. Formula: `0x80 + (Affiliation_ID * 2)` |

### Chip ID and Affiliation Table

| Chip ID | Chip | Affiliation | Shutdown Track | Notes |
|---|---|---|---|---|
| 1 | none (R2) | Scoundrel | 7-2 | |
| 2 | none (BB) | Scoundrel | 7-3 | |
| 3 | Blue | Resistance | 7-2 | |
| 4 | Gray | Scoundrel | 7-4 | |
| 5 | Red | First Order | 7-2 | |
| 6 | Orange | Resistance | 7-3 | |
| 7 | Purple | Scoundrel | 7-1 | |
| 8 | Black | First Order | 7-1 | |
| 9 | CB-23 / Red 2 | Scoundrel | 7-1 | Red 2 personality chip is same as CB-23 |
| 10 | Yellow | Resistance | | Possibly CH-33P |
| 11 | none (C1-10P) | Resistance | | |
| 12 | none (D-O) | Resistance | | |
| 13 | Blue 2 | Scoundrel | | R2-D2 |
| 14 | none (BD-1) | Resistance | | |
| 15 | ? | | | |
| 16 | Drum Kit | Scoundrel | | |
| 1* | Orange (SPOOK-E) | Resistance | | Bundled with purple R-Series panels (2025); copy of R2 embedded chip with extra "spooky" sounds |
| 1* | Green (R2-H15) | Resistance | | Bundled with R2-H15 Holiday Droid (2025), limited to ~5000 |

> Shutdown Track = `<group>-<track #>` played when droid goes to sleep. Any chip with ID > 8 defaults to 7-1.

### Affiliation IDs

| Affiliation ID | Binary | Affiliation |
|---|---|---|
| 1 | `0001` | Scoundrel |
| 5 | `0101` | Resistance |
| 9 | `1001` | First Order |

> It seems like the left two bits indicate affiliation and the right two bits (`01`) are fixed.

---

## G+ Eventor (LED Event Data)

G+ Eventor adds event metadata to audio clips. Files with event data have the extension `.GEA` or `.GEAX`.

The LEDs in a droid's head have a default behavior of blinking in sync with the audio clip being played (probably based on volume). Event data within an audio clip may override this default behavior.

Stock personality chips only contain event data for audio clips that play with R-Series accessories and a single track (group 5, track 1) which makes the head LED blink in a steady pattern.

### Event Types

There are two types of events: **User Events** and **I/O Events**.

- **I/O Events** are controlled via the "Edit Event" section of the G+ Eventor GUI (numbered 1-112). Several built-in functions let you set the event's value throughout the audio clip.
- **User Events** are inserted manually. Press `Ctrl+I` in the GUI to add one. "Index" is the event ID; "SubIndex" is the value given to that event.

### LED Event Mapping

| LED | "Mode" User Event | "Brightness" I/O Event | "Blink Speed" I/O Event |
|---|---|---|---|
| Head 1 | 80 | 1 | 17 |
| Head 2 | 81 | 2 | 18 |
| Head 3 | 82 | 3 | 19 |
| Left Accessory | 83 | 4 | 20 |
| Right Accessory | 84 | 5 | 21 |

There are 5 LEDs in an R-Series droid (3 head, 1 left accessory, 1 right accessory). BB-Series droids have multiple head LEDs treated as a single LED.

- **Mode** -- set at the beginning of the audio file; controls how the LED syncs with the audio track
- **Brightness** -- controls LED brightness (0 = off, 255 = full). Stock chips only use this to ramp down during blaster/thruster clips
- **Blink Speed** -- only matters if the mode is one that blinks (0 = no blinking; rate increases with value)

### User Event SubIndex Effects

| SubIndex | Effect |
|---|---|
| 0 | Nothing |
| 1 | Blink 0.5s on, 0.5s off, repeat |
| 2 | Rapid blinking |
| 3 | Rapid blinking |
| 4 | Rapid blinking |
| 5 | Rapid blinking |
| 6 | Rapid blinking (decreasing?) |
| 7 | Solid, rapid blinking, solid |
| 8 | Solid |
| 9-12 | Blinking |
| 13 | Stock (wavy?) |
| 14-15 | Solid |

> It's likely only the lower nibble (0-15) is considered by the audio controller, and the sequence repeats. Thus why SubIndex 16 is off, 17 is slow blinking, etc.

### Event Data From Stock Personality Chips

| Track(s) | Event Type | Parameters | Purpose |
|---|---|---|---|
| 5-1 | User Event | Index 80, SubIndex 4, Position 0 | Enable and set behavior of head LED |
| 5-1 | I/O Event | Event 17, Level Control 100 samples to clip length - 100 samples, level 9 | Set blink speed of head LED |
| 11-1, 11-2 | User Event | Index 83, SubIndex 3, Position 0 | Enable left accessory LED |
| 11-1, 11-2 | User Event | Index 84, SubIndex 3, Position 0 | Enable right accessory LED |
| 11-1, 11-2 | I/O Event | Event 4, Ramp down start to end: 255 → 0 | Fade out left accessory LED |
| 11-1, 11-2 | I/O Event | Event 5, Ramp down start to end: 255 → 0 | Fade out right accessory LED |
| 12-1, 12-2 | User Event | Index 83, SubIndex 13, Position 0 | Enable left accessory LED |
| 12-1, 12-2 | User Event | Index 84, SubIndex 13, Position 0 | Enable right accessory LED |
| 12-1, 12-2 | I/O Event | Event 4, Ramp down start to end: 255 → 0 | Fade out left accessory LED |
| 12-1, 12-2 | I/O Event | Event 5, Ramp down start to end: 255 → 0 | Fade out right accessory LED |
| 12-1, 12-2 | I/O Event | Event 20, Level Control start to end: level 96 | Set blink speed of left accessory LED |
| 12-1, 12-2 | I/O Event | Event 21, Level Control start to end: level 96 | Set blink speed of right accessory LED |

### Example GEAX Files

A ZIP file containing 5 GEAX files is available: two blaster noises (group 11), two thruster noises (group 12), and one emergency noise (group 5, track 1). These files are released into the public domain.

- https://drive.google.com/open?id=1x9H_aVuFWL4TmU65qPdc4pNt5Wlcx-YU

---

## Custom Personality Chip ROMs

Custom personality chips available for download. Use them to program your custom personality chip (or make your own!).

> "Unknown" affiliation means the affiliation ID has been set to 3, which is not used by the stock personality chips.

| Name | Chip ID | Affiliation | Download |
|---|---|---|---|
| "Buzz" | 9 (0x09) | Scoundrel* (0x03) | [Google Drive](https://drive.google.com/file/d/1BUZe3nxGrU47zWsIzxWGqt2qdRQa4QI2/view) |
| "Bubbles" | 10 (0x0A) | Scoundrel* (0x03) | [Google Drive](https://drive.google.com/file/d/1Hpyr-tAgmYxXDr4LESq1TVHVuAozYS-r/view) |
| "Little Mouse" | 11 (0x0B) | Scoundrel* (0x03) | [Google Drive](https://drive.google.com/file/d/1ZHd5pPgQVZe8PNejVCNqUINVCXkxGzh1/view) |
| "Big Mouse" | 12 (0x0B) | Scoundrel* (0x03) | [Google Drive](https://drive.google.com/file/d/1Gyb_Zz9q8IZin4LMoqXSdHT_Mz9Niti0/view) |

> \* Behaves like Scoundrel, but affiliation ID (0x03) is not used by any stock personality chips.

---

## Resources for Creating a Custom Personality Chip

> **WARNING:** These instructions are presented as-is and without warranty. You take responsibility for what you do with this information. If you break your droid it is your responsibility.

### Build Instructions (Video Playlists)

- https://www.youtube.com/playlist?list=PL1LWtA1iy9htxbn6YRiQPNZSwZlszt2Kj
- https://www.youtube.com/playlist?list=PL1LWtA1iy9hv2R1a-inW9WY91VEcFrai0

### Custom PCBs (OSH Park)

| Version | Link |
|---|---|
| SMD & DIP-8 | https://oshpark.com/shared_projects/pKGHswCw |
| SMD Only | https://oshpark.com/shared_projects/h6gIuBDP |
| Through-Hole Only | https://oshpark.com/shared_projects/BQLBpICr |

### Custom Personality Chip PCB BOM

| Component | Spec | Link |
|---|---|---|
| Memory Chip | SPI Flash, DIP-8 or SOIC-8 (use only one!) | [Mouser W25Q16](https://www.mouser.com/ProductDetail/454-W25Q16JVSNIQ) or [Mouser W25Q32](https://www.mouser.com/ProductDetail/454-W25Q32JVDAIQ) |
| R33, R99 | 0805, 10k Ohm resistor | [Mouser](https://www.mouser.com/ProductDetail/71-CRCW080510K0FKEAC) |
| C42 | 0805, 0.1uF (100nF) capacitor | [Mouser](https://www.mouser.com/ProductDetail/80-C0805C104J5R) |
| C44 | 0805, 2pF capacitor (anything under ~20pF works) | [Mouser](https://www.mouser.com/ProductDetail/80-C0805C209D3HACTU) |
| DIP-8 Socket | OPTIONAL (for DIP-8 SPI Flash only) | [Mouser](https://www.mouser.com/ProductDetail/4808-3004-CP) |

### SPI Flash Memory Chip Programmer

A programmer is needed to write the custom ROM to the flash memory chip.

| Programmer | Price | Link | Notes |
|---|---|---|---|
| TL866II Plus | ~$60 | [eBay](https://www.ebay.com/itm/192899365703) | Supports wide variety of chips; software from manufacturer. Can be found cheaper from China. |
| CH341A | ~$10 | [Amazon](https://www.amazon.com/dp/B07R5LPTYM/) | Designed only for 8-pin Flash chips. Windows software: https://forum.laboneinside.com/viewtopic.php?f=35&t=76 |

> The TL866II Plus is better value if you need a programmer for other projects. For just personality chips on a budget, the CH341A works fine.

### Using flashrom

[flashrom](https://www.flashrom.org/Flashrom) is an open source project for reading and writing personality chips. It can be used with the CH341A programmer.

#### Installing flashrom on WSL 2 (Windows 10+)

See: https://docs.microsoft.com/en-us/windows/wsl/connect-usb

```bash
# From Windows terminal (admin):
wsl --update

# From within WSL:
sudo apt update
sudo apt upgrade

# Install USB/IP tools:
sudo apt install linux-tools-5.4.0-77-generic hwdata
sudo update-alternatives --install /usr/local/bin/usbip usbip \
  /usr/lib/linux-tools/5.4.0-77-generic/usbip 20

# Install flashrom:
sudo apt-get install flashrom
sudo cp /lib/udev/rules.d/60-flashrom.rules /etc/udev/rules.d/
```

See also: https://github.com/dorssel/usbipd-win/wiki/WSL-support

#### Attaching CH341A to WSL 2

1. Plug in CH341A programmer
2. Start WSL
3. Open Windows command terminal as admin:
   ```
   usbipd wsl list
   ```
4. Note the BUSID for the CH341A, then:
   ```
   usbipd wsl attach --busid <BUSID>
   ```
5. Confirm in WSL:
   ```bash
   lsusb
   ```
6. Verify access:
   ```bash
   flashrom --programmer ch341a_spi
   ```

#### Using flashrom with CH341A

```bash
# Read personality chip to file:
flashrom --programmer ch341a_spi -r ROM.bin

# Get flash chip size:
flashrom --programmer ch341a_spi --flash-size

# Pad ROM to chip size:
truncate -s <ROM_SIZE> ROM.bin

# Write ROM to personality chip:
flashrom --programmer ch341a_spi -w ROM.bin
```

### Personality Chip to DIP-8 Adapter

https://oshpark.com/shared_projects/chbCtdq9

Useful for programming your personality chip without removing the chip or hooking a clip to it. The project description on OSH Park has links for the socket and pins needed.

> If using a TL866 or TL866II Plus, disable the "Pin Detect" option in the lower-left of the programming software window when using this adapter.

### Custom Personality Chip Case

Designed by Spudinator on Thingiverse, with versions for both DIP and SOIC-8 package memory chips:
https://www.thingiverse.com/thing:4161884

---

## Bluetooth Beacons and Audio Playback

When the droid encounters an appropriate Bluetooth beacon, it will play an audio clip from the group specified by the beacon.

- The droid reacts to a beacon about every **2 minutes**
- Clips are played **sequentially** as stored within the group on the memory chip
- If a droid leaves a beacon area then returns (without power cycling), it picks up where it left off

### BB-Series Motor Response to Beacons

Motor drive responses when reacting to a beacon appear to be specific to the audio group. These motor pulses spin the head of the BB unit.

| Motor Pulse Time | Classification |
|---|---|
| 0.5s | Short |
| 1s | Medium |
| 2s | Long |

| Beacon Group | Motor Pulse Pattern |
|---|---|
| 1 | short, short, short, short |
| 2 | long, long, long, long |
| 3 | med, long, med |
| 4 | short, short, long |
| 5 | med, med, med, med |
| 6 | med, short, short, med, short |
| 7 | med, med, med |

---

## Factory Reset and Pairing

**Video guide:** https://www.youtube.com/watch?v=gKocbzvLSUg

### Factory Reset

With the droid powered off, hold down the pairing button and then turn the droid on. Keep the button down until the pairing LED turns on (about 10 seconds). The droid is now in a "factory" state.

### Pairing

1. Hold down the pairing button on the droid until the LED turns on (~2 seconds)
2. With the remote off, hold down the **up** and **accessory** buttons, then turn the remote on
3. The droid will pair and play the activation noise (since it's in factory state)

The manual that came with your droid also contains pairing instructions.

---

## Analyzing Personality Chip Flash Memory Contents

Information below comes from analyzing the raw data on the flash memory.

### Group Index Table

- Offset `0x40` contains a 4-byte value of how many groups there are (always `0x0C` = 12)
- The group index table begins at offset `0x44`
- Each entry is 4 bytes long: an offset to the location containing a list of audio clip locations for that group
- Table size = `4 * <value at 0x40>` = 48 bytes (`0x30`)
- The audio-by-group index table begins at `0x44 + 0x30 = 0x74`

### Audio by Group Index Table

- Has as many records as there are groups
- Each record contains a list of offsets to each audio clip in that group
- First 4 bytes = number of audio clips in the bank
- Extra 4-byte value at end of record (appears related to end of audio data)
- Different banks can point to the same audio clip

### Audio Data

- The microcontroller skips the first 4 bytes of the audio data block (always `0x650d2100`)
- Next 4-byte value is always `0xe02e0000`; microcontroller reads first 2 bytes (`0xe02e`) = 12,000 in little-endian = sample rate
- Searching for `0x650d2100e02e0000` is a quick way to locate audio data blocks

### Shutdown Tracks

| Chip ID | Personality | Shutdown Track |
|---|---|---|
| 0 | none | none |
| 1 | R2 | Group 7, Track 2 |
| 2 | BB | Group 7, Track 3 |
| 3 | Blue | Group 7, Track 2 |
| 4 | Gray | Group 7, Track 4 |
| 5 | Red | Group 7, Track 2 |
| 6 | Orange | Group 7, Track 3 |
| 7 | Purple | Group 7, Track 1 |
| 8 | Black | Group 7, Track 1 |
| >8 | any | Group 7, Track 1 |

> From decompiled firmware: 9 bytes starting at offset `0x22C18` identify the shutdown track in group 7 for each personality: `00 01 02 01 03 01 02 00 00`

### Beacon-to-Audio-Group Mapping by Affiliation

The affiliation on the personality chip defines how beacon bytes map to audio groups. Upon power-up, droids wait 1 minute before responding to a beacon. Droids will not respond to other droid beacons for 2 hours after last seeing a location beacon (to prevent constant reactions in the parks).

| Affiliation ID | Binary | Name | Beacon → Audio Group Mapping |
|---|---|---|---|
| 0 (0x00) | `0000 0000` | | 4, 5, 3, 1, 7, 6, 2 |
| 1 (0x01) | `0000 0001` | Scoundrel | 1, 2, 3, 4, 5, 6, 7 |
| 2-3 | | | 1, 2, 3, 4, 5, 6, 7 |
| 4-7 | | Resistance (5) | 4, 5, 3, 1, 7, 6, 2 |
| 8-11 | | First Order (9) | 5, 4, 3, 7, 1, 2, 6 |
| 12-17 | | | 5, 4, 3, 1, 2, 7, 6 |

> Unchipped droids default to Scoundrel affiliation (1:1 direct mapping).
