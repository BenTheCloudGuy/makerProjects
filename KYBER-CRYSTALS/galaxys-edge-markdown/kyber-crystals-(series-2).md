# Kyber Crystals (Series 2)

| Series 2 Kyber Crystals |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Series 2 kyber crystals were released on May 4, 2024. They were released at the same time as series 2 holocrons. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Series 2 kyber crystals are backwards compatible with series 1 holocrons, however the voice in a series 1 holocron will be different from the voice produced by a series 2 holocron. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Series 1 kyber crystals will work with series 2 holocrons, however the voices from the series 1 holocrons will play. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Series 2 kyber crystals are compatible with original Savi's Workshop lightsaber hilts. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | Series 2 Holocron Quirks |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | Address 9 Data Format | Behavior |
|  | NOTICE: kyber crystals modified with a handheld writer will not function with "series 2 aware" devices |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | xx0D0000 | assumes valid series 2 kyber crystal, but if xx is an invalid value, the holocron goes dark then fades back up. |
|  | What's a "series 2 aware" device? Currently it is series 2 holocrons and wayfinders. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | xxyD0000 | reverts to data in address 6 (series 1) |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | xxyDnnnn | if nnnn is anything other than all zeroes, the crystal is ignored entirely by the holocron |
| Series 2 Kyber Crystal RFID Data Breakdown |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | Any "unlisted" crystals? |  |
|  | EM4100 | EM4305 | EM4305 | Crystal | Holcron | Holocron | Wayfinder |  |  |  |  |  |  |  |  |  |  | Currently, no. Know good values all respond, anything outside of those values is treated as an invalid value. |  |
|  | ID | Address 6 | Address 9 | Color | Series 1 Voice | Series 2 Voice | Location |  |  |  |  |  |  |  |  |  |  | But more testing is needed. |  |
|  | 3073 | 5E003000 | 010D0000 | Black | Darth Vader | Darth Sidious | Exegol |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 3078 | 29803000 | 020D0000 | Blue w/Red Core | Old Ben Kenobi | Ben Solo | Kef Bir |  |  |  |  |  |  |  |  |  |  | Unused Series 1 Yoda "danger" Quotes |  |
|  | 3078 | 29803000 | 030D0000 | Blue | Old Ben Kenobi | Cal Kestis | Bracca |  |  |  |  |  |  |  |  |  |  | Series 1 Jedi holocron has 2 yoda quotes warning you're in grave danger. |  |
|  | 3078 | 29803000 | 040D0000 | Blue | Old Ben Kenobi | Plo Koon | Florrum |  |  |  |  |  |  |  |  |  |  | These quotes are not used, but the audio data exists. |  |
|  | 3076 | 0C803000 | 050D0000 | Green | Qui-Gon Jinn | Luke Skywalker | Tatooine |  |  |  |  |  |  |  |  |  |  | Those quotes are not used in series 2 holocrons, which contain series 1 holocron audio data on top of new audio clips. |  |
|  | 3079 | 6F803000 | 060D0000 | Purple | Mace Windu | General Grievous | Vassek 3 |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 3079 | 6F803000 | 070D0000 | Purple | Mace Windu | Mace Windu | Bardotta |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 3073 | 5E003000 | 080D0000 | Red | Darth Vader | Asajj Ventress | Dathomir |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 3073 | 5E003000 | 090D0000 | Red w/Blue Core | Darth Vader | Kylo Ren | Crait |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 3073 | 5E003000 | 100D0000 | Red | Darth Vader | Darth Bane | Moraband |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 3073 | 5E003000 | 110D0000 | Red | Darth Vader | Maul | Mandalore |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 3073 | 5E003000 | 120D0000 | Red | Darth Vader | Second Sister | Nur |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 3073 | 5E003000 | 130D0000 | Red | Darth Vader | Grand Inquisitor | Stygeon Prime |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 3072 | 18003000 | 140D0000 | White | Ahsoka Tano | Krin Dagbard | Batuu |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 3072 | 18003000 | 150D0000 | White | Ahsoka Tano | Orla Jareni | Umbara |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 3075 | 7B003000 | 160D0000 | Yellow | Temple Guard | Indeera Stokes | Elphrona |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 3075 | 7B003000 | 170D0000 | Yellow | Temple Guard | Rey Skywalker | Tatooine |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 3076 | 0C803000 | 180D0000 | Green | Qui-Gon Jinn | Luminara Unduli | Naboo |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| EM4x05 RFID Chip Data Dump |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| This table contains a dump of all the data stored in the EM4305 RFID chip for these crystals. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Color | Green (s2) | Green (s2) | Blue (s2) | Blue (s2) | Blue (s2) | Blue (s2, cracked) | Purple (s2) | Purple (s2) | Yellow (s2) | Yellow (s2) | Yellow (s2) | White (s2) | White (s2) | Red (s2) | Red (s2) | Red (s2) | Red (s2) | Black (s2) |
|  | S1 Voice | Qui-Gon Jinn | Qui-Gon Jinn | Old Ben Kenobi | Old Ben Kenobi | Old Ben Kenobi | Old Ben Kenobi | Mace Windu | Mace Windu | Temple Guard | Temple Guard | Temple Guard | Ahsoka Tano | Ahsoka Tano | Darth Vader | Darth Vader | Darth Vader | Darth Vader | Darth Vader |
|  | S2 Voice | Luke Skywalker | Luminara Unduli | Plo Koon | Plo Koon | Plo Koon | Ben Solo | Mace Windu | General Grievous | Rey Skywalker | Rey Skywalker | Rey Skywalker | Krin Dagbard | Krin Dagbard | Grand Inquisitor | Maul | Grand Inquisitor | Asajj Ventress | Darth Sidious |
|  | Wayfinder | Tatooine | Naboo | Florrum | Florrum | Florrum | Kef Bir | Bardotta | Vassek 3 | Tatooine | Tatooine | Tatooine | Batuu | Batuu | Stygeon Prime | Mandalore | Stygeon Prime | Dathomir | Exegol |
|  | EM TAG ID | 1111000C04 | 1111000C04 | 1111000C06 | 1111000C06 | 1111000C06 | 1111000C06 | 1111000C07 | 1111000C07 | 1111000C03 | 1111000C03 | 1111000C03 | 1111000C00 | 1111000C00 | 1111000C01 | 1111000C01 | 1111000C01 | 1111000C01 | 1111000C01 |
|  | Address 00 | 00040072 | 00040072 | 00040072 | 00040072 | 00040072 | 00040072 | 00040072 | 00040072 | 00040072 | 00040072 | 00040072 | 00040072 | 00040072 | 00040072 | 00040072 | 00040072 | 00040072 | 00040072 |
|  | Address 01 | 804B08F0 | 7B83C85A | 7B8998F3 | 7B8413EA | 7B84222B | 7B808C60 | 7B8936EA | 7B896284 | 7B88F3F4 | 7B892A59 | 7B841039 | 7B894F46 | 7B841797 | 7B841185 | 7B895525 | 804B091A | 7A1C1F46 | 7B80811F |
|  | Address 02 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 |
|  | Address 03 | 00006BF1 | 000052CE | 00007703 | 0000D8F3 | 000023E3 | 00008DED | 0000520D | 00008529 | 00001511 | 0000366A | 0000EA22 | 00007BC2 | 00006A58 | 00004656 | 00003104 | 00005909 | 00008E4D | 00009A2E |
|  | Address 04 | 0001805F | 0001805F | 0001805F | 0001805F | 0001805F | 0001805F | 0001805F | 0001805F | 0001805F | 0001805F | 0001805F | 0001805F | 0001805F | 0001805F | 0001805F | 0001805F | 0001805F | 0001805F |
|  | Address 05 | 18C631FF | 18C631FF | 18C631FF | 18C631FF | 18C631FF | 18C631FF | 18C631FF | 18C631FF | 18C631FF | 18C631FF | 18C631FF | 18C631FF | 18C631FF | 18C631FF | 18C631FF | 18C631FF | 18C631FF | 18C631FF |
|  | Address 06 | 0C803000 | 0C803000 | 29803000 | 29803000 | 29803000 | 29803000 | 6F803000 | 6F803000 | 7B003000 | 7B003000 | 7B003000 | 18003000 | 18003000 | 5E003000 | 5E003000 | 5E003000 | 5E003000 | 5E003000 |
|  | Address 07 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 |
|  | Address 08 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 |
|  | Address 09 | 050D0000 | 180D0000 | 040D0000 | 040D0000 | 040D0000 | 020D0000 | 070D0000 | 060D0000 | 170D0000 | 170D0000 | 170D0000 | 140D0000 | 140D0000 | 130D0000 | 110D0000 | 130D0000 | 080D0000 | 010D0000 |
|  | Address 10 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 |
|  | Address 11 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 |
|  | Address 12 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 |
|  | Address 13 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 |
|  | Address 14 | 00008002 | 00008002 | 00008002 | 00008002 | 00008002 | 00008002 | 00008002 | 00008002 | 00008002 | 00008002 | 00008002 | 00008002 | 00008002 | 00008002 | 00008002 | 00008002 | 00008002 | 00008002 |
|  | Address 15 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 | 00000000 |
|  | Crystal Cut | Medium 1 | Large | Small | Small | Medium 1 | Medium 1 | Medium 2 | Medium 1 | Small | Small | Medium 1 | Small | Small | Medium 2 | Small | Medium 2 | Medium 1 | Medium 2 |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| About the RFID Tags in Kyber Crystals |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Kyber Crystals have an EM4305 RFID tag embedded within them. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| These RFID tags contains 16 4-byte values (words). Each word is accessed via an address (0-15). |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The EM4305 RFID tags in kyber crystals are configured to, by default, transmit the data in addresses 05 and 06 repeatedly when within the presence of an RFID reader. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The data in addresses 5 and 6 emulate the EM4100 protocol. The value returned by the EM4100 protocol is represented in the table above under the "EM4100 ID" column. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Address 5 is not included in the table above because it is the same for every crystal; 000001FF. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Differences Between Series 1 and 2 Crystals |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The data in the EM4305 RFID tag used in series 2 crystals looks exactly the same as series 1 crystals, except address 9 contains a value where series 1 crystals do not. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The value in address 9 is used by devices that are "series 2 aware" to identify the crystal. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| If a crystal does not have data in address 9 (the series 1 crystals), "series 2 aware" devices fall back to the data in address 6 (the EM4100 ID). |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Series 1, version 2 kyber crystals included a value in address 8 that could also be used to identify it. Address 8 in series 2 kybers appears to be empty. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Modifying Series 2 Kyber Crystals With RFID Writers |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The handheld writers popular with modifying series 1 kyber crystals WILL NOT WORK with series 2 kyber crystals. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| This is because those handheld writers are only modifying the RFID tags for EM4100 protocol data. They do not touch address 9 where the series 2 crystal data is stored. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Most of those handheld writers will also reconfigure the RFID tag that will prevent address 9 from being readable. As a result, kyber crystals modified with a handheld scanner will not function with "series 2 aware" devices. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| To modify a kyber crystal to work with "series 2 aware" devices will require something that speaks EM4305 and allows editing individual addresses. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The most popular, and least expensive, option at this time is a device called a "Proxmark 3 Easy". These devices are available from eBay and online retailers. They will cost around US$50. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| There are several resources on youtube and other web sites that will provide instructions how to setup and use the Proxmark3 Easy. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| If you are a member of the Galaxy's Edge Discord server there is a thread covering using the PM3 with kyber crystals. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Membership of the SWGE discord is free, go to www.swgediscord.com. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Crystal Cut to Voice Correlation |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The same (or very similar) cuts seen in series 1 crystals exist with series 2 crystals. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Whether or not there is a correlation between cut and voice has not yet been determined. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Cut | Color | Voice | Address 9 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Small | White | Krin Dagbard | 140D0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Medium 1 | White | Krin Dagbard | 140D0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Medium 2 | White | Orla Jareni | 150D0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Large | White | Orla Jareni | 150D0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Small | Red | Darth Bane | 100D0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Small | Red | Maul | 110D0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Medium 1 | Red | Asajj Ventress | 080D0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Medium 1 | Red | Kylo Ren | 090D0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Medium 2 | Red | Grand Inquisitor | 130D0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Large | Red | Second Sister | 120D0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Small | Yellow | Rey Skywalker | 170D0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Medium 1 | Yellow | Rey Skywalker | 170D0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Medium 2 | Yellow | Indeera Stokes | 160D0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Large | Yellow | Indeera Stokes | 160D0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Small | Green | Luke Skywalker | 050D0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Medium 1 | Green | Luke Skywalker | 050D0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Medium 2 | Green | Luminara Unduli | 180D0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Large | Green | Luminara Unduli | 180D0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Small | Blue | Plo Koon | 040D0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Medium 1 | Blue | Plo Koon | 040D0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Medium 1 | Blue | Ben Solo | 020D0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Medium 2 | Blue | Cal Kestis | 030D0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Large | Blue | Cal Kestis | 030D0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Small | Purple | General Grievous | 060D0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Medium 1 | Purple | General Grievous | 060D0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Medium 2 | Purple | Mace Windu | 070D0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Large | Purple | Mace Windu | 070D0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Medium 2 | Black | Darth Sidious | 010D0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Paper Insert Text |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| All series 2 kyber crystals come with a piece of paper identifying the voice of the crystal along with some information about the character. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| This is a list of the content of those paper inserts, both front and back, for all series 2 crystals. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Darth Sidious | Intended for use with new series 2 Jedi and Sith holocrons. The Force works in mysterious ways. If you place this kyber crystal inside a series 1 Sith holocron you will unlock Darth Vader |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | Today, you have encountered an uncommon spectacle. In this vial lies a rare black kyber crystal, imbued with the power of the dark side. Darth Sidious, who lived within a cloned vessel, has moved to establish the final order to end the Jedi once and for all. When placed inside a lightsaber or holocron, the power of this black kyber crystal will connect through the Force and illuminate. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Ben Solo | Intended for use with new series 2 Jedi and Sith holocrons. The Force works in mysterious ways. If you place this kyber crystal inside a series 1 Jedi holocron you will unlock Old Ben Kenobi. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | Today, you have encountered an uncommon spectacle. In this vial lies a rare cracked blue kyber crystal, imbued with the power of the light side. Ben Solo was a promising Jedi, however his ambition made him susceptible to the influence of the dark side. When placed inside a lightsaber or holocron, the power of this cracked blue kyber crystal will connect through the force and illuminate. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Cal Kestis | Intended for use with new series 2 Jedi and Sith holocrons. The Force works in mysterious ways. If you place this kyber crystal inside a series 1 Jedi holocron you will unlock Old Ben Kenobi. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | In this vial lies a blue kyber crystal, imbued with the power of the light side. Cal Kestis survived the Empire's Jedi purge and formed into a fierce Jedi warrior. With his friends Cal lead a crusade against the Empire. When placed inside a lightsaber or holocron, the power of this blue kyber crystal will connect through the force and illuminate. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Plo Koon | Intended for use with new series 2 Jedi and Sith holocrons. The Force works in mysterious ways. If you place this kyber crystal inside a series 1 Jedi holocron you will unlock Old Ben Kenobi. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | In this vial lies a blue kyber crystal, imbued with the power of the light side. Plo Koon, a Kel Dor, was a highly regarded Jedi known for his calm presence and empathy. When placed inside a lightsaber or holocron, the power of this kyber crystal will connect through the Force and illuminate. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Luke Skywalker | Intended for use with new series 2 Jedi and Sith holocrons. The Force works in mysterious ways. If you place this kyber crystal inside a series 1 Jedi holocron you will unlock Qui-Gon Jinn. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | In this vial lies a green kyber crystal, imbued with the power of the light side. Luke Skywalker was a wise Jedi with humble beginnings, who built his own Jedi temple to train new students. When placed inside a lightsaber or holocron, the power of this green kyber crystal will connect through the Force and illuminate. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | General Grievous | Intended for use with new series 2 Jedi and Sith holocrons. The Force works in mysterious ways. If you place this kyber crystal inside a series 1 Jedi holocron you will unlock Mace Windu. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | In this vial lies a purple kyber crystal, imbued with the power of the dark side. General Grievous was a ruthless Jedi  hunter whose cybernetic modifications turned him into a loyal weapon for Count Dooku. When placed inside a lightsaber or holocron, the power of this purple kyber crystal will connect through the Force and illuminate. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Mace Windu | Intended for use with new series 2 Jedi and Sith holocrons. The Force works in mysterious ways. If you place this kyber crystal inside a series 1 Jedi holocron you will unlock Mace Windu. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | In this vial lies a purple kyber crystal, imbued with the power of the light side. Mace Windu, revered as the champion of the Jedi Order, was not inclined towards the political disorder of the Clone Wars. When placed inside a lightsaber or holocron, the power of this purple kyber crystal will connect through the Force and illuminate. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Asajj Ventress | Intended for use with new series 2 Jedi and Sith holocrons. The Force works in mysterious ways. If you place this kyber crystal inside a series 1 Sith holocron you will unlock Darth Vader. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | In this vial lies a red kyber crystal, imbued with the power of the dark side. Asajj Ventress was a skilled assassin who wielded twin red-bladed lightsabers. Her loyalty to the Sith was tested and shifted her destiny unexpectedly. When placed inside a lightsaber or holocron, the power of this red kyber crystal will connect through the force and illuminate. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Kylo Ren | Intended for use with new series 2 Jedi and Sith holocrons. The Force works in mysterious ways. If you place this kyber crystal inside a series 1 Sith holocron you will unlock Darth Vader. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | Today, you have encountered an uncommon spectacle. In this vial lies a rare cracked red kyber crystal, imbued with the power of the dark side. Kylo Ren was a champion of the First Order and led the Knights of Ren. While he worked to destroy his past, he was plagued by a pull from the light side. When placed inside a lightsaber or holocron, the power of this cracked red kyber crystal will connect through the force and illuminate. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Darth Bane | Intended for use with new series 2 Jedi and Sith holocrons. The Force works in mysterious ways. If you place this kyber crystal inside a series 1 Sith holocron you will unlock Darth Vader. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | In this vial lies a red kyber crystal, imbued with the power of the dark side. Darth Bane, the sole reformer of a once powerful Sith order, led a villainous charge against the Jedi. When placed inside a lightsaber or holocron, the power of this red kyber crystal will connect through the force and illuminate. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Maul | Intended for use with new series 2 Jedi and Sith holocrons. The Force works in mysterious ways. If you place this kyber crystal inside a series 1 Sith holocron you will unlock Darth Vader. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | In this vial lies a red kyber crystal imbued with the power of the dark side. Maul was a deadly warrior who often schemed new ways to obtain power within the Sith. He has since returned to Dathomir to lead the Crimson Dawn criminal syndicate. When placed inside a lightsaber or holocron, the power of this red kyber crystal will connect through the force and illuminate. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Second Sister | Intended for use with new series 2 Jedi and Sith holocrons. The Force works in mysterious ways. If you place this kyber crystal inside a series 1 Sith holocron you will unlock Darth Vader. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | In this vial lies a red kyber crystal, imbued with the power of the dark side. The Second Sister was a cruelly ambitious member of the Imperial Inquisition, and though she was adept with a lightsaber, her strongest weapon was her mind. When placed inside a lightsaber or holocron, the power of this red kyber crystal will connect through the Force and illuminate. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Grand Inquisitor | Intended for use with new series 2 Jedi and Sith holocrons. The Force works in mysterious ways. If you place this kyber crystal inside a series 1 Sith holocron you will unlock Darth Vader |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | In this vial lies a red kyber crystal imbued with the power of the dark side. The Grand Inquisitor was the enigmatic leader of Force-wielding assassins tasked with tracking down surviving Jedi. When placed inside a lightsaber or holocron, the power of this red kyber crystal will connect through the Force and illuminate. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Krin Dagbard | Intended for use with new series 2 Jedi and Sith holocrons. The Force works in mysterious ways. If you place this kyber crystal inside a series 1 Jedi holocron you will unlock Ahsoka |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | In this vial lies a white kyber crystal, imbued with the power of the light side. Krin Dagbard survived the Nihil Campaigns of the High Republic Era and then returned to his homeworld of Batuu to contemplate the Force. When placed inside a lightsaber or holocron, the power of this white kyber crystal will connect through the force and illuminate. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Orla Jareni | Intended for use with new series 2 Jedi and Sith holocrons. The Force works in mysterious ways. If you place this kyber crystal inside a series 1 Jedi holocron you will unlock Ahsoka |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | In this vial lies a white kyber crystal, imbued with the power of the Light side. Orla Jareni was a Wayseeker Jedi who followed her own path and wielded a hinged double bladed lightsaber. When placed inside a lightsaber or holocron the power of this white kyber crystal will connect through the force and illuminate. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Indeera Stokes | Intended for use with new series 2 Jedi and Sith holocrons. The Force works in mysterious ways. If you place this kyber crystal inside a series 1 Jedi holocron you will unlock Jedi Temple Guard. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | In this vial lies a yellow kyber crystal, imbued with the power of the Light side. Indeera Stokes was a highly skilled Jedi knight during the era of the High Republic. Her particular set of mechanical skills and combat ability made her an asset to the Jedi order. When placed inside a lightsaber or holocron the power of this yellow kyber crystal will connect through the force and illuminate. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Rey Skywalker | Intended for use with new series 2 Jedi and Sith holocrons. The Force works in mysterious ways. If you place this kyber crystal inside a series 1 Jedi holocron you will unlock Jedi Temple Guard. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | In this vial lies a yellow kyber crystal, imbued with the power of the light side. Rey Skywalker, once a scavenger on Jakku and a recruited fighter with the Resistance, has discovered her own power as a Jedi through the Force. When placed inside a lightsaber or holocron, the power of this yellow kyber crystal will connect through the Force and illuminate. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Luminara Unduli | Intended for use with new series 2 Jedi and Sith holocrons. The Force works in mysterious ways. If you place this kyber crystal inside a series 1 Jedi holocron you will unlock Qui-Gon Jinn. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | In this vial lies a green kyber crystal, imbued with the power of the light side. Luminara Unduli was a battle-hardened Jedi master who fought in the Clone Wars and trained Padawan Barriss Offee. When placed inside a lightsaber or holocron, the power of this green kyber crystal will connect through the Force and illuminate. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |