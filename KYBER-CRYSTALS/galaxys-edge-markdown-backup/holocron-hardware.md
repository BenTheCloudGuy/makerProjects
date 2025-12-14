# Holocron Hardware

| Jedi Holocron |  |  |  |  |  |
|---|---|---|---|---|---|
|  |  |  |  |  |  |
| Reference Designator | Marking | Package | Chip | Responsibilities | Comments |
| U1 | n/a | chip-on-board | SONIX SLC88KF | main mcu: LEDs, audio playback |  |
| U2 | SONIX SN8P2501D | SOP14 | SONiX 8-bit Microcontroller | infrared communications |  |
| U3 | N25Q032AS8 | SOP8 | Nyquest N25Q Series Serial Flash | 32Mb (4MB) flash memory | Contains most of the audio data |
| U4 | EM4095 | SO16 | EM Microelectronic RFID Front End | RFID communications |  |
| U5 | NY9T004AS8-009a | SOP8 | Nyquest NY9T 4-bit Microcontroller | capacitive touch buttons |  |
| U6 | NM5VA | SOT23-6 |  |  | Probably a DC-DC boost/buck converter based on proximity to a 2.2uH inductor. |
| U7 | 5803J | SOT23-5 | GMT Single Cell Li-Ion Battery Charger | charges the battery off 5v USB supply |  |
| U8 | 6210A | SOT89-3 | MicrOne ME6210 3.3V LDO Regulator | produces the 3.3V rail for the system |  |
|  |  |  |  |  |  |
| Jedi Holocron LED PCB to logic PCB Interconnect Cable |  |  |  |  |  |
| Pin | Use |  | Interconnect cable is a 60mm, 10-pin, 0.5mm pitch flat flex cable (FFC). |  |  |
| 1.0 | 3.3V |  | Replacements are readily available on eBay. Search for something like: 0.5mm 60mm 10-pin ffc |  |  |
| 2.0 | 3.3V |  |  |  |  |
| 3.0 | red LED signal |  |  |  |  |
| 4.0 | green LED signal |  |  |  |  |
| 5.0 | blue LED signal |  |  |  |  |
| 6.0 | IR receiver (power?) |  |  |  |  |
| 7.0 | ground |  |  |  |  |
| 8.0 | RX; IR receive |  |  |  |  |
| 9.0 | TX; IR send |  |  |  |  |
| 10.0 | 1.0 |  |  |  |  |
|  |  |  |  |  |  |
|  |  |  |  |  |  |
| Sith Holocron |  |  |  |  |  |
|  |  |  |  |  |  |
| Reference Designator | Marking | Package | Chip | Responsibilities |  |
| U1 | n/a | chip-on-board | SONIX SLC88KF | main mcu: LEDs, audio playback |  |
| U2 | SONIX SN8P2501D | SOP14 | SONiX 8-bit Microcontroller | infrared communications |  |
| U3 | N25Q016AS8 | SOP8 | Nyquest N25Q Series Serial Flash | 16Mb (2MB) flash memory |  |
| U4 | EM4095 | SO16 | EM Microelectronic RFID Front End | RFID communications |  |
| U5 | NY9T004AS8-009a | SOP8 | Nyquest NY9T 4-bit Microcontroller | capacitive touch buttons |  |
| U6 | NM5VA | SOT23-6 |  |  |  |
| U7 | 5803J | SOT23-5 | GMT Single Cell Li-Ion Battery Charger | charges the battery off 5v USB supply |  |
| U8 | 6210A | SOT89-3 | MicrOne ME6210 3.3V LDO Regulator | produces the 3.3V rail for the system |  |