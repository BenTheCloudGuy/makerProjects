# Holocron Hardware

## Jedi Holocron

### ICs and Components

| Ref | Marking | Package | Chip | Responsibilities | Notes |
|---|---|---|---|---|---|
| U1 | n/a | chip-on-board | SONIX SLC88KF | Main MCU: LEDs, audio playback | |
| U2 | SONIX SN8P2501D | SOP14 | SONiX 8-bit Microcontroller | Infrared communications | |
| U3 | N25Q032AS8 | SOP8 | Nyquest N25Q Series Serial Flash | 32Mb (4MB) flash memory | Contains most of the audio data |
| U4 | EM4095 | SO16 | EM Microelectronic RFID Front End | RFID communications | |
| U5 | NY9T004AS8-009a | SOP8 | Nyquest NY9T 4-bit Microcontroller | Capacitive touch buttons | |
| U6 | NM5VA | SOT23-6 | | | Probably a DC-DC boost/buck converter based on proximity to a 2.2uH inductor |
| U7 | 5803J | SOT23-5 | GMT Single Cell Li-Ion Battery Charger | Charges the battery off 5V USB supply | |
| U8 | 6210A | SOT89-3 | MicrOne ME6210 3.3V LDO Regulator | Produces the 3.3V rail for the system | |

### LED PCB to Logic PCB Interconnect Cable

The interconnect cable is a 60mm, 10-pin, 0.5mm pitch flat flex cable (FFC). Replacements are readily available on eBay. Search for: `0.5mm 60mm 10-pin ffc`

| Pin | Use |
|---|---|
| 1 | 3.3V |
| 2 | 3.3V |
| 3 | Red LED signal |
| 4 | Green LED signal |
| 5 | Blue LED signal |
| 6 | IR receiver (power?) |
| 7 | Ground |
| 8 | RX; IR receive |
| 9 | TX; IR send |
| 10 | 1.0 |

## Sith Holocron

### ICs and Components

| Ref | Marking | Package | Chip | Responsibilities |
|---|---|---|---|---|
| U1 | n/a | chip-on-board | SONIX SLC88KF | Main MCU: LEDs, audio playback |
| U2 | SONIX SN8P2501D | SOP14 | SONiX 8-bit Microcontroller | Infrared communications |
| U3 | N25Q016AS8 | SOP8 | Nyquest N25Q Series Serial Flash | 16Mb (2MB) flash memory |
| U4 | EM4095 | SO16 | EM Microelectronic RFID Front End | RFID communications |
| U5 | NY9T004AS8-009a | SOP8 | Nyquest NY9T 4-bit Microcontroller | Capacitive touch buttons |
| U6 | NM5VA | SOT23-6 | | |
| U7 | 5803J | SOT23-5 | GMT Single Cell Li-Ion Battery Charger | Charges the battery off 5V USB supply |
| U8 | 6210A | SOT89-3 | MicrOne ME6210 3.3V LDO Regulator | Produces the 3.3V rail for the system |
