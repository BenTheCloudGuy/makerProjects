# Bluetooth Beacons

Throughout Galaxy's Edge there are Bluetooth Low Energy (BLE) beacons. Droids from Galaxy's Edge can detect the presence of these beacons and react to them.

This page documents these beacons and ways to create them yourself to interact with your droids after leaving Galaxy's Edge.

## Beacon Types

There are two types of beacons: **personality beacons** and **location beacons**.

- **Personality beacons** are emitted by the droids themselves. They identify the personality chip currently installed in the droid.
- **Location beacons** identify locations within Galaxy's Edge.

## Droid & Beacon Facts

Information from a decompile of a BB unit's firmware:

- Droids have an internal counter measured in ticks. Each tick lasts **5ms**.
- A droid will wait **2 minutes** between reactions to another droid's beacon.
- If a droid encounters a location beacon, it will not react to a droid beacon for **2 hours**.
- If a droid encounters a location beacon, it will not go to sleep for **6 hours**. Otherwise it goes to sleep 5 minutes after the last command or droid beacon encounter.
- Droids will not react to droid beacons if the affiliation value is between `0x0C` and `0x0F`. However, they will record the interaction and reset their shutdown counter.
  - This means it's possible to craft a droid beacon that is silent but keeps your droid awake indefinitely.
- Location beacons contain a value that sets the minimum reaction frequency. Droids (except BD) have a minimum wait time of 1 minute even if the beacon specifies less.

---

## Emulating Beacons

### nRF Connect (Android)

One of the more accessible ways to emulate beacons is using an Android phone with [nRF Connect](https://play.google.com/store/apps/details?id=no.nordicsemi.android.mcp). Video demo by VProFX: https://www.youtube.com/watch?v=liKQ0LrN9q0

> The iOS version of nRF Connect does **not** allow simulating beacons.

### C4-DDU

C4-DDU is a Windows application for interacting with your droid. It includes beacon emulation, but that barely scratches the surface of what this tool can do.

### Droid Toolbox

Droid Toolbox is an Arduino IDE based application that runs on ESP32-based systems, mainly LILYGO TTGO T-Display and LILYGO T-Display-S3 devices. It includes beacon emulation and personality chip audio playback.

- Demo: https://www.youtube.com/watch?v=0sHTIEbTevk

### BBC Micro:bit V1

Dedicated hardware such as a BBC Micro:bit can also be used, as demonstrated by the Burbank Makerspace: https://www.youtube.com/watch?v=lnBzoScwhm0

**pxt-swge-beacon** is a MakeCode extension for the micro:bit that allows it to emulate droid and location beacons.

---

## Personality Beacons

Astromech droids built at Droid Depot emit a Bluetooth beacon while active to identify the currently installed personality chip. Other droids will react to those beacons.

**Manufacturer ID:** `0x0183`
**Data format:** `0x03044481yyzz`

- `yy` = `0x80 + (Affiliation ID * 2)`
- `zz` = Personality Chip ID

### Affiliation IDs

| Affiliation | ID |
|---|---|
| Scoundrel | 1 |
| Resistance | 5 |
| First Order | 9 |

### Personality Beacon Values

| Personality Chip | Affiliation | yy | zz | Full Beacon Data |
|---|---|---|---|---|
| None (R-Series) | Scoundrel | `82` | `01` | `03 04 44 81 82 01` |
| None (BB-Series) | Scoundrel | `82` | `02` | `03 04 44 81 82 02` |
| Blue | Resistance | `8A` | `03` | `03 04 44 81 8A 03` |
| Gray | Scoundrel | `82` | `04` | `03 04 44 81 82 04` |
| Red | First Order | `92` | `05` | `03 04 44 81 92 05` |
| Orange | Resistance | `8A` | `06` | `03 04 44 81 8A 06` |
| Purple | Scoundrel | `82` | `07` | `03 04 44 81 82 07` |
| Black | First Order | `92` | `08` | `03 04 44 81 92 08` |
| CB-23 / Red 2 | Scoundrel | `82` | `09` | `03 04 44 81 82 09` |
| Yellow | Resistance | `8A` | `0A` | `03 04 44 81 8A 0A` |
| None (C1-Series) | Resistance | `8A` | `0B` | `03 04 44 81 8A 0B` |
| None (D-O) | Resistance | `8A` | `0C` | `03 04 44 81 8A 0C` |
| Blue 2 | Scoundrel | `82` | `0D` | `03 04 44 81 82 0D` |
| None (BD Units) | Resistance | `8A` | `0E` | `03 04 44 81 8A 0E` |
| None (A-LT Units) | Scoundrel | `82` | `0F` | `03 04 44 81 82 0F` |
| None (Drum Kit) | Scoundrel | `82` | `10` | `03 04 44 81 82 10` |

---

## Location Beacons

Location beacons are positioned throughout Galaxy's Edge. This list represents beacons found using Bluetooth scanning tools.

**Manufacturer ID:** `0x0183`

| Data | Land | Location | Notes |
|---|---|---|---|
| `0x0A040102A601` | DL, WDW | Marketplace, Outdoor Areas | |
| `0x0A040202A601` | DL, WDW | Behind Droid Depot | |
| `0x0A040302A601` | DL, WDW | Resistance | |
| `0x0A040402A601` | | | Not seen in any scan data |
| `0x0A040502A601` | DL, WDW | Oga's? | Only seen at Oga's entrance and a couple other locations; could be an alarm beacon |
| `0x0A040602A601` | WDW | Dok-Ondar's | |
| `0x0A040702A601` | DL, WDW | First Order | |
| `0x0A040318BA01` | DL | Droid Depot | |
| `0x0A040618BA01` | WDW | Marketplace | |
| `0x0A0405FFA601` | DL, WDW | In front of Oga's | Possibly the droid detector |
| `0x0A0407FFA601` | WDW | In front of Oga's | |

---

## Beacon Format

Beacons emitted and consumed by droids use data stored in the "Manufacturer Specific Data" section of a Bluetooth beacon. The manufacturer ID is `0x0183` (Disney's ID number).

The data contains one or more sub-sections. Each sub-section begins with two bytes: the first specifies the **type of data**, the second specifies the **length**. The data for that sub-section follows.

### Personality Beacon Breakdown

Example: `0x030444818201`

| Byte | Value | Meaning |
|---|---|---|
| 1 | `03` | Data type (droid identifier) |
| 2 | `04` | Length of data |
| 3 | `44` | `0x40` + number of data bytes (including this byte) |
| 4 | `81` | `0x01` + (if paired with remote: `0x80`) |
| 5 | `82` | `0x80` + (Affiliation ID * 2) |
| 6 | `01` | Personality chip ID |

### Location Beacon Breakdown

Example: `0x0A040102A601`

| Byte | Value | Meaning |
|---|---|---|
| 1 | `0A` | Data type (location beacon) |
| 2 | `04` | Length of data |
| 3 | `01` | Location ID |
| 4 | `02` | Minimum interval between reactions; value * 5 = seconds. Minimum is 1 minute, so values < `0x0C` all result in 1 minute intervals |
| 5 | `A6` | Expected RSSI in dBm (if weaker, beacon is ignored). `0xA6` = -38 dBm, `0xBA` = -58 dBm, ~-28 dBm is the highest usable value (~1 foot from droid). `0x80` = 0 dBm, `0x81` = -1 dBm, `0x7F` = 1 dBm |
| 6 | `01` | Uncertain; must be 0 or 1, otherwise the beacon is ignored |

> Beacon format information from Russ on the [Galaxy's Edge Discord Server](http://swgediscord.com).

---

## Datapad App Beacons

The Datapad app utilizes Bluetooth beacons to identify locations and items to interact with. Emulating these beacons allows you to use the Datapad app as if you were in the park (some features require additional beacons not listed here).

| Location | Company ID | Data |
|---|---|---|
| Galaxy's Edge - Walt Disney World | `0x004C` | `0x0215bc85ceaae2e2435db0499b70d5151c3ba0290026ba` |
| Galaxy's Edge - Disneyland | `0x004C` | `0x0215be5202c7401744899cb2d73d62cd529da08e0071c0` |

---

## Further Resources

- **SWGE Discord Server** -- bashNinja shared Bluetooth scan data in the #makerspace channel; http://swgediscord.com
- **Beacon location map** by VProFX -- http://galaxysedgetech.epizy.com/
- **Beacon spreadsheet** by Cowkitty -- https://docs.google.com/spreadsheets/d/1zIZb7uUxUe7ewypnTGrzrX1FA85U5mn2XtULZbcXqI8/edit#gid=0
- **Burbank Makerspace beacon emulation video** -- https://www.youtube.com/watch?v=lnBzoScwhm0
