# Holocron Infrared (IR) Protocol

The Sith and Jedi holocrons pair with each other via infrared communications. This is an attempt at explaining the protocol being used.

## Protocol Overview

- Holocron messages are transmitted one message at a time.
- Each message is either 8 or 12 bits depending on the holocron series.
- A bit is transmitted as a length of time "off" followed by a length of time "on".
- A "period" is the time it takes to transmit a single bit.
- If time on > time off, the bit value is **1**.
- If time off > time on, the bit value is **0**.
- Each message begins with a "preamble" where the signal is ON for about 2x the length of a period, indicating a new message is starting.

### Bit Interpretation

It's possible to interpret values as having reversed bit order (LSB transmitted first). For example, `11110000` (0xF0) could be read as 0x0F. For the purposes of this document, **MSB is transmitted first**. Consistency in bit order interpretation is what matters when writing code.

## Protocol Differences Between Series 1 and Series 2

Series 2 holocrons use a slightly different protocol, likely so Series 2 holocrons can identify each other when pairing.

> **Note:** Timings were determined through use of a logic analyzer and may not be perfect, but are good enough to work.

### Series 1 Protocol

- **Preamble:** 4ms
- **Bit period:** 2ms (2000 uS)
- **Transmit 1:** 500 uS off, 1500 uS on
- **Transmit 0:** 1500 uS off, 500 uS on
- **Message length:** 8 bits

#### Series 1 Messages

| Byte Value | Direction | Message | Description |
|---|---|---|---|
| `0xF0` | JEDI | Beacon 1 | When not connected, the Jedi holocron transmits this every 30ms looking for a Sith holocron response |
| `0x3C` | SITH -> JEDI | Hello | Initiate connection, sent in response to a Jedi's beacon |
| `0x69` | SITH -> JEDI | Button Press | Jedi holocron starts playing a Bendu message |
| `0x78` | SITH -> JEDI | Acknowledge | Sith responds to let Jedi know it's still alive |
| `0x87` | JEDI -> SITH | Breathe | Tells Sith to perform a breathing animation (dim -> bright -> dim). Must be re-sent every 6000ms to keep breathing |
| `0x96` | JEDI -> SITH | Bright | Tells Sith to brighten its lights (used for dark/light animation during audio playback) |
| `0xA5` | JEDI -> SITH | Dark | Tells Sith to dim its lights (used for dark/light animation during audio playback) |
| `0xB4` | JEDI -> SITH | Ping | Sent every ~30ms when not sending other commands, to verify Sith is still present |
| `0xC3` | JEDI -> SITH | Breathe | Appears same as `0x87`; further investigation needed |
| `0xD2` | JEDI -> SITH | Flash | Causes the Sith holocron to momentarily flash its lights |
| `0xE1` | JEDI -> SITH | Lights Off | Tells Sith to turn off lights (doesn't always work, more investigation needed) |

> When sent an unknown command, the Sith holocron will disconnect. All 256 command values were tested to identify the valid commands listed above.

### Series 2 Protocol

- **Preamble:** 4.4ms (compatible with Series 1)
- **Bit period:** 1125 uS
- **Transmit 1:** 350 uS off, 775 uS on
- **Transmit 0:** 775 uS off, 350 uS on
- **Message length:** 12 bits (with one exception)

#### Series 2 Messages

| Value | Direction | Message | Description |
|---|---|---|---|
| `0x00` | JEDI | Beacon 2 | Series 2 Jedi holocrons transmit a 2-message beacon (`0x00` then `0xF0`). Series 2 Sith respond to `0x00`, Series 1 Sith respond to `0xF0` |
| `0x044` | JEDI -> SITH | Ping | Sent at idle to maintain connection |
| `0x055` | JEDI -> SITH | Dark | Dim lights for dark/light animation |
| `0x066` | JEDI -> SITH | Bright | Brighten lights for dark/light animation |
| `0x077` | JEDI -> SITH | Breathe | Breathing animation; repeated to keep breathing |
| `0x880` | SITH -> JEDI | Acknowledge | Confirms receipt of last message |
| `0x891` | SITH -> JEDI | Button Press | Indicates Sith button has been pressed |

## Technical Details: Transmitting and Receiving IR Data

Holocrons transmit IR data using a **38kHz carrier frequency** (similar to TV remote controls). The "on" portion of a signal is actually a 38kHz square wave. The carrier wave helps prevent interference from the environment.

### Hardware Setup

For my setup, I use a **KY-032 module** - a cheap, Arduino-friendly distance/avoidance detection module with both an IR transmitter and receiver.

- Examples: [eBay](https://www.ebay.com/itm/404512411038), [Amazon](https://www.amazon.com/dp/B0969B3FWN/)
- The module includes a 555 timer that drives the IR transmitter at kHz frequencies, tunable to 38kHz
- The enable pin (after removing the on-board jumper) can control the transmitter via an Arduino
- The IR receiver removes the 38kHz carrier frequency, producing clean output

### Data Capture Setup

- **Software:** [PulseView](https://sigrok.org/wiki/PulseView)
- **Hardware:** Cheap ~$6 logic analyzer from eBay ([example](https://www.ebay.com/itm/145184521106))
- **Components:** Arduino Nano, KY-032 IR Module, Mini Logic Analyzer

Attach the logic analyzer to the OUT pin of the KY-032 module (with power applied) to capture signals from the holocron.

## Code

I have written code to interface with holocrons. See the GitHub repository: [holocron-toolbox](https://github.com/ruthsarian/holocron-toolbox)
