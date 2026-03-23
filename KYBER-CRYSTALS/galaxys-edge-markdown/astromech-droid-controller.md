# Astromech Droid Controller

The stock droid controller is driven by a **Nordic Semiconductor nRF31512** and thought to use a protocol unique to Nordic Semiconductor called "Enhanced Shock Burst" (ESB) to control droids.

However, the droids also have a Bluetooth interface that can be used to control them, such as the official droid controller app from Disney.

This page documents both the stock controller hardware and the Bluetooth interface to control droids.

## Droid Controller Apps

- Official Droid Depot app on [Google Play](https://play.google.com/store) / [Apple Store](https://apps.apple.com)
- Droid Controller App by Jamie Adkins on Google Play
- Droid Depot Control by BAP (requires a web browser that supports Web Bluetooth)
- C4-DDU by TitaNets

## Bluetooth Commands

Droids can be controlled by sending commands via Bluetooth Low Energy services. Connections can be made through various methods, from Arduino to Web Bluetooth to command-line tools.

- **Programmatic example:** See Droid Toolbox, an Arduino sketch using an ESP32-based device to connect to and control a droid
- **Command-line example:** See the "Using hcitool and gatttool" section below

> **Important:** The droid remote must be **OFF** to connect via Bluetooth, otherwise the connection will fail.

## Service and Characteristics

| Name | Value Handle | UUID |
|---|---|---|
| Droid Service | | `09b600a0-3e42-41fc-b474-e9c0c8f0c801` |
| Command Characteristic | `0x000e` | `09b600b1-3e42-41fc-b474-e9c0c8f0c801` |
| Notify Characteristic | `0x000b` | `09b600b0-3e42-41fc-b474-e9c0c8f0c801` |

## Login Command: `0x222001`

Upon connecting, send `0x222001` **twice** to the command characteristic within a short time window, or the client will be disconnected.

If listening on the notify characteristic, each login command returns:

```
2F 32 81 45 4B 10 01 44 44 11 11 01 00 00 00 00
```

This data appears to be hard-coded in firmware (not generated on-the-fly). Perhaps a firmware version?

## Command Structure

Commands are sent via the command characteristic. The first four bytes describe the command and data length:

| Byte | Description |
|---|---|
| 1 | `0x1f` + total bytes in the command |
| 2 | `0x42` if command ID is `0x0f`, otherwise `0x00` |
| 3 | Command ID |
| 4 | Data length + `0x40` |
| 5...n | Command data |

> Data length can never exceed `0x1f` (31) bytes.

## Command IDs

The command ID identifies the command being sent to the droid's Bluetooth controller (nRF 51822), which handles motor functions and the pairing LED. The audio controller is a separate device inside the droid that handles sound and LEDs.

| Command ID | Purpose | Notes |
|---|---|---|
| `0x01` | Return robot/firmware ID in a GATT notify event | |
| `0x02` | Set pairing LED on/off | Only LED controlled directly by nRF chip |
| `0x03` | Set RGB LED on/off (no RGB LEDs exist; included for completeness) | |
| `0x04` | Flash pairing LED | |
| `0x05` | Control motor speed | |
| `0x06` | Script command: write data to currently open script | |
| `0x0c` | Script command: execute pre-programmed scripts | |
| `0x0d` | Delay (used in command scripts) | |
| `0x0f` | Multi-purpose: send command to audio controller or control motors | |

> Gaps in the list are command IDs that do nothing (confirmed from firmware analysis).

### Command `0x0f` Sub-Commands (Byte 6)

| Byte 6 | Purpose | Example | Notes |
|---|---|---|---|
| `0x00` | Command audio controller | `27 42 0f 44 44 00 CC PP` | CC = command, PP = parameter |
| `0x01` | Center R2 head | `27 42 0f 44 44 01 XX YY` | XX = speed; if YY == 0, stop at center; R-Series only |
| `0x02` | Rotate R2 head | `2B 42 0f 48 44 02 XX YY AA AA BB BB` | XX = direction (00=right, FF=left), YY = speed, AAAA = ramp-up time (ms), BBBB = delay after command (ms) |
| `0x03` | Rotate R2 head | `27 42 0f 44 44 03 XX YY` | XX = direction, YY = delay |
| `0x04` | Rotate BB | `2B 42 0f 48 44 04 XX YY AA AA BB BB` | Same format as 0x02 |
| `0x05` | Drive BB | `2B 42 0f 48 44 05 XX YY AA AA BB BB` | XX = direction, YY = speed (if LSB of direction is 0) |

> Times are in milliseconds (e.g., `03E8` = 1 second).

## Audio Controller Commands

1-byte commands are sent to the audio controller using command ID `0x0f`:

```
27 42 0f 44 44 00 CC PP
```

Where CC = command, PP = parameter.

| Command | Values | Purpose |
|---|---|---|
| `0x01` * | | Return droid type |
| `0x08` * | | Return personality chip |
| `0x0a` * | | Return affiliation |
| `0x0e` | `0x00`-`0x1f` | Set volume |
| `0x0f` | | ?? (serial hold) |
| `0x10` | `0x00`-`0x0B` | Play audio clip from specified group (sequential, with LEDs) |
| `0x11` | `0x00`-`0x0B` | Play audio clip from specified group (sequential, no LEDs) |
| `0x18` | `0x00`-`0xff` | Play clip from currently selected sound group (set by `0x1f`) |
| `0x1c` | n/a | Play all clips from all groups in order |
| `0x1f` | `0x00`-`0x0B` | Set sound group |
| `0x21` | | ?? audio loop |
| `0x42` * | | ?? (used during droid initialization) |
| `0x44` | | |
| `0x45` | | ?? LED flash |
| `0x48` | LED identifier | Set LEDs on |
| `0x49` | LED identifier | Set LEDs off |
| `0x4a` | LED identifier | Disable head LEDs |
| `0x4b` | LED identifier | Enable head LEDs |
| `0x5n` | `0x00`-`0x1f` | Set LED display pattern (blink, fade, off, on); n = LED being controlled |
| `0x6n` | `0x00`-`0xff` | Set LED pattern repeat count; `00` = continuous; n = LED being controlled |
| `0x7n` | | ?? |
| `0x8n` | | Set LED brightness; n = LED being controlled |
| `0x9n` | | Set pattern speed; n = LED being controlled |
| `0xAn`-`0xFn` | | Set speed for all LEDs; value of n does not seem to matter |

> \* These commands are used internally, but returned values are not accessible via Bluetooth (as far as known).

### LED Identifiers

| Value | R-Series | BB-Series | BD Units | Notes |
|---|---|---|---|---|
| `0x00` | | | LED0, blue | BD head: LED0 is farthest right, LED3 is farthest left (viewing from back) |
| `0x01` | Left Head LED | Head LEDs | LED0, green | |
| `0x02` | Middle Head LED | | LED0, red | |
| `0x03` | | | LED1, blue | |
| `0x04` | Right Head LED | | LED1, green | |
| `0x05` | | | LED1, red | |
| `0x06` | | | LED2, blue | |
| `0x07` | | | LED2, green | |
| `0x08` | Left Accessory | | LED2, red | |
| `0x09` | | | LED3, blue | |
| `0x0A` | | | LED3, green | |
| `0x0B` | | | LED3, blue | |
| `0x0C` | | | Left eye | |
| `0x0D` | | | Right eye | |
| `0x10` | Right Accessory | | | |

## Pre-Programmed Scripts

Droids contain scripted actions executed via command ID `0x0c`. The command accepts a 1-byte parameter identifying the script. These rotate the head while playing audio from the specified group.

**Command format:** `25 00 0C 42 II AA`

### Script Index (II)

| Index | Purpose |
|---|---|
| `0x01`-`0x08` | R-Series scripted actions |
| `0x09`-`0x10` | BB unit scripted actions (can be used by R-Series but will cause rapid spinning!) |
| `0x11`-`0x12` | Delay followed by pairing noise |
| `0x13` | **WARNING!** Will leave motors running; must cycle power to stop |

### II to Audio Group Translation

| R | BB | Audio Group |
|---|---|---|
| 01 | 0C | 1 |
| 02 | 0D | 2 |
| 03 | 0B | 3 |
| 04 | 0A | 4 |
| 05 | 09 | 5 |
| 06 | 0F | 6 |
| 07 | 0E | 7 |
| 08 | 10 | 8 (Activation Noise) |

### Action (AA)

| Action | Purpose |
|---|---|
| `0x00` | Open script II for writing (II must be `0x14` or greater) |
| `0x01` | Close any currently open script |
| `0x02` | Execute script specified by II |

### Example: Drive BB Unit Forward Then Backwards

```
25000C421400                # open script 0x14 for writing
2B420f48440500FF01F403E8    # move forward 1 second, 500ms ramp-up
2B420f484405F0FF03E807D0    # move backwards 2 seconds, 1s ramp-up
2B420f484405000000000000    # stop moving
25000C421401                # close script 0x14
25000C421402                # execute script 0x14
```

## Motor Control

Motors are controlled via command ID `0x05`:

**Command format:** `27 00 05 44 DM SS RR RR`

| Field | Description |
|---|---|
| D | Direction (0 = forward/left, 8 = backwards/right) |
| M | Motor (0 = left, 1 = right, 2 = head) |
| SS | Speed; high nibble is the real value; minimum `0x60` to move; `0xA0` is common |
| RRRR | Ramp-up time in milliseconds; `0x012C` is common |

> **WARNING:** Motors, when turned on, **will NOT stop** until you send a stop command or power off the droid. **Be ready to stop your droid!** R-Series heads are the exception - they can detect when they've turned as far as possible and stop.

## Example Commands

### Pairing LED Control

```
25 00 02 42 00 ff              # Turn pairing LED on
25 00 02 42 00 00              # Turn pairing LED off
2C 00 04 49 02 00 01 ff 01 ff 0a ff 00  # Blink 10 times
```

### Head LED Control

```
27 42 0f 44 44 00 48 1f       # Turn on specific LEDs
27 42 0f 44 44 00 49 00       # Turn off specific LEDs
27 42 0f 44 44 00 4a 00       # Disable head LEDs reacting to sounds
27 42 0f 44 44 00 4b 1f       # Enable head LEDs reacting to sounds
```

### Sound Control

```
27 42 0f 44 44 00 0e 1f       # Set volume
27 42 0f 44 44 00 10 00       # Play clip from specified audio group
27 42 0f 44 44 00 11 00       # Play clip from specified group (no LEDs)
27 42 0f 44 44 00 18 00       # Play first sound from current group
26 42 0f 43 44 00 1c          # Play next clip; cycle through groups 1-7
27 42 0f 44 44 00 1f 00       # Select audio group 1
```

### Pre-Programmed Scripts

```
25 00 0c 42 01 02             # Execute script 0x01 (R-Series)
25 00 0c 42 10 02             # Execute script 0x10 (BB-Series)
```

### Motor Control

```
29 42 05 46 02 a0 01 2c 00 00    # Rotate head left
29 42 05 46 82 a0 01 2c 00 00    # Rotate head right
29 42 05 46 02 00 01 2c 00 00    # Stop head rotation
27 42 0f 44 44 01 ff 00          # Center head (R-Series only)
```

## Using hcitool and gatttool To Control Your Droid

`hcitool` and `gatttool` are Linux utilities (including Raspberry Pi OS) for sending Bluetooth commands. See also [BAP's article on the droid protocol](https://github.com/bap).

### Step 1: Turn On Your Droid (NOT Your Controller)

The controller will claim the Bluetooth connection, so leave it off.

### Step 2: Find Your Droid's Bluetooth Address

```bash
sudo hcitool lescan | grep -i droid
```

Note the address from the output.

### Step 3: Start gatttool in Interactive Mode

```bash
sudo gatttool -t random -i hci0 -b XX:XX:XX:XX:XX:XX -I
```

Replace `XX:XX:XX:XX:XX:XX` with your droid's Bluetooth address.

### Step 4: Connect and Authenticate

Issue `connect`, then quickly send the login command twice:

```
> connect
> char-write-cmd 0x000e 222001
> char-write-cmd 0x000e 222001
```

Have the command on your clipboard to paste quickly. If you aren't disconnected after a few seconds, the connection is established.

### Step 5: Make the Droid Do Something

Select a sound bank, then play a sound:

```
> char-write-cmd 0x000e 27420f4444001f00    # Select sound bank 0
> char-write-cmd 0x000e 27420f4444001800    # Play first sound
```

There are 12 sound banks. Every bank except the 10th has at least one sound. BB droids without a personality chip have no sounds beyond bank 8.

### Step 6: Experiment CAREFULLY

See BAP's article for motor control documentation.

> **WARNING:** If you tell the droid to move at full speed, **IT WILL NOT STOP** until you command it to stop or power off. Running motors at max speed for more than tens of seconds risks damage. Be ready to power off your droid!

## Stock Droid Controller Hardware

The controller uses a **Nordic Semiconductor nRF31512C** in a QFN32 package. No datasheet is available for this specific chip, but similar nRF chips provide pinout guidance. A similar chip is used in Disney's Magic Bands.

### nRF31512C Pinout

| Pin | Name | PCB Contact | Test Point | Connected To |
|---|---|---|---|---|
| 1 | DEC1 | | | C81 to BAT- |
| 2 | DEC2 | | | C82 to BAT- |
| 3 | P1.1 | P1.1 | 9 | |
| 4 | P0.0 | P0.0 | | SFC Button |
| 5 | P0.1 | P0.1 | | SFX Button |
| 6 | P0.2 | P0.2 | | HR Button |
| 7 | P0.3 | P0.3 | 4 | HL Button |
| 8 | GND | GND | 1 | BAT- |
| 9 | GND | GND | 1 | BAT- |
| 10 | VDD | V | 2 | BAT+ |
| 11 | GND | GND | 1 | BAT- |
| 12 | P0.4 | P0.4 | 5 | FW Button |
| 13 | P0.5 | P0.5 | 6 | BW Button |
| 14 | P0.6 | P0.6 | 7 | TL Button |
| 15 | P0.7 | P0.7 | | TR Button |
| 16 | P1.0 | P1.0 | 8 | Transmit (Red) LED |
| 17 | | | | |
| 18 | PROG/VPP | PR | 3 | |
| 19 | GND | GND | 1 | BAT- |
| 20 | VDD_PA | | | Antenna |
| 21 | ANT1 | | | Antenna |
| 22 | ANT2 | | | Antenna |
| 23 | VSS | GND | 1 | BAT- |
| 24 | VDD | V | 2 | BAT+ |
| 25 | IREF | | | R101 (22k) to BAT- |
| 26 | GND | GND | 1 | BAT- |
| 27 | RESET | Re | 10 | D11 to BAT+ |
| 28 | VDD | V | 2 | BAT+ |
| 29 | XC2 | | | Xtal (16MHz) |
| 30 | XC1 | | | Xtal (16MHz) |
| 31 | VSS | GND | 1 | BAT- |
| 32 | VSS | GND | 1 | BAT- |
