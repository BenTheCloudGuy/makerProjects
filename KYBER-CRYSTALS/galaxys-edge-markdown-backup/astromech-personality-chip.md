# Astromech Personality Chip

| Astromech Personality Chip |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Personality chips are available from Droid Depot. They make your droid sound different and control your droid's affiliation with one of three factions: Scoundrels, the Resistance, or the First Order. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Chip Color | Affiliation | Demos |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Blue | Resistance | https://www.youtube.com/watch?v=X0sXQ2hA4Ss |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Gray | Scoundrel |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Red | First Order | https://www.youtube.com/watch?v=vU3g5itIlog |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Orange | Resistance |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Purple | Scoundrel | https://www.youtube.com/watch?v=RPJzqe2OsTQ |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Black | First Order |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | R2D2 (blue), CB23 (red), and Chopper (yellow) |  |  |
|  | Cyan (CB-23) | Scoundrel | https://www.youtube.com/watch?v=z9FjlEn29PM |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Yellow | Resistance |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Red 2 | Resistance | same as CB-23 personality chip |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Blue 2 | Scoundrel |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Technical Overview |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The personality chip contains an SPI flash memory chip which contains encoded audio clips and identification as to which personality and faction it contains. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Audio data is organized into 12 groups. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| When using the remote to trigger droid sounds the sound played will be (randomly) selected from one of the first 7 audio groups. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| When a droid is reacting to a bluetooth beacon, the beacon's data will dictate from which of those first 7 groups to play an audio clip. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Different areas of Galaxy's Edge have different beacons. For example a First Order area will have beacons identifying audio from group 7 should be played, whereas Resistance area beacons identify group 3 audio should be played. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Organizing audio clips that contain similar "emotion" along with how droids react to beacons will create the droid's "personality". Such as a Resistance personality chip causing the droid to play concerned noises when in a First Order area. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Main Microcontroller for GE Droids |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| A Nordic Semiconductor nRF51822 |  |  | Handles bluetooth communications, tells the audio controller what clips to play, and controls the motors. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Audio Controller for GE Droids |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| General Plus GPCD9TP340A |  |  | This chip handles reading the personality chip and audio output; also responsible for reading the personality chip and controlling the LEDs on the droid |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Identified in this Reddit thread |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| SPI Flash Memory Chip for Personality Chips |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| PUYA P25Q80H |  |  | Found in the personality chips; contains audio data |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  | https://lcsc.com/product-detail/FLASH_PUYA-P25Q80H-SSH-IT_C194872.html |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Audio Data Encoding used for GE Droid Personalities |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Algorithm: | A3400Pro 5Bit |  | This audio format is proprietary to GeneralPlus |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Bit Rate: | 42,000 bps |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Sample Rate: | 12,000 Hz |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Audio Grouping Notes |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| When encountering a BLE beacon in the park, the droid will play a clip from a given group based off the beacon. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Specifically the THIRD byte of the beacon's data refers to which audio group to play from. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Valid values for that third byte are 1-7. Droid does not react when a higher value is in that position. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Sounds in groups 8 - 12 are shared across all personality chips. EXCEPT the activation noise for the black personality chip is different. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Audio Group By Location Within Galaxy's Edge |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Group | Sounds | GE Location[2] | Notes |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 1 | Droid | General |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 2 | Droid | Droid Depot |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 3 | Droid | Resistance |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 4 | Droid | Unknown | only 1 sound; what bluetooth beacons use the value 0x04 in the third byte position? -- haven't seen an '04' beacon in the parks |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 5 | Droid | Oga's Cantina (?) | only 1 sound; what bluetooth beacons use the value 0x05 in the third byte position? -- droid detectors outside the cantina. is this an 'alarm' noise? |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 6 | Droid | Dok-Ondar's |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 7 | Droid | First Order | noise when droid goes to sleep comes from this group |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 8 | Initial Activation | N/A | only 1 sound; played during activation at the droid depot. black personality chip has BB-Series activation noise, all other stock personality chips have the R-Series activation noise. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 9 | Motor ? | N/A | only 1 sound; uncertain what it's used for |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 10 | - | N/A | empty group |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 11 | Blaster | N/A | triggered with a 10k resistance[1] |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 12 | Thrusters | N/A | triggered with a 4.7k resistance[1] |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  | 1. Droid accessory hack: https://www.reddit.com/r/GalaxysEdge/comments/d6g9sx/droid_depot_runit_extracontroller_button_hack/ |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  | 2. Location with Galaxy's Edge where beacons triggering this group of audio is most commonly found. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Counts of Audio Clips by Group for Each Personality Chip |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | R-Series | BB-Series | Blue | Gray | Red | Orange | Purple | Black | CB-23 / Red 2 | C1-10P | D-O | Yellow | Blue 2 | BD-1 | ? | Drum Kit |  |  |  |  |  |
|  | 1 | 4 | 5 | 5 | 4 | 5 | 5 | 4 | 3 | 5.0 | 6 |  | 4 | 4 | 5 |  | 4 |  |  |  |  |  |
|  | 2 | 4 | 3 | 5 | 5 | 5 | 5 | 4 | 6 | 5.0 | 13 |  | 5 | 4 | 6 |  | 5 |  |  |  |  |  |
|  | 3 | 3 | 3 | 5 | 5 | 5 | 5 | 5 | 5 | 5.0 | 5 |  | 5 | 4 | 6 |  | 4 |  |  |  |  |  |
|  | 4 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1.0 | 1 |  | 1 | 1 | 1 |  | 1 |  |  |  |  |  |
|  | 5 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1.0 | 1 |  | 1 | 1 | 1 |  | 1 |  |  |  |  |  |
|  | 6 | 4 | 5 | 5 | 3 | 3 | 3 | 4 | 5 | 5.0 | 6 |  | 5 | 4 | 5 |  | 4 |  |  |  |  |  |
|  | 7 | 5 | 5 | 3 | 5 | 3 | 3 | 5 | 3 | 5.0 | 6 |  | 5 | 5 | 5 |  | 5 |  |  |  |  |  |
|  | 8 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1.0 | 1 |  | 1 | 1 | 1 |  | 1 |  |  |  |  |  |
|  | 9 | 1 | 0 | 1 | 1 | 1 | 1 | 1 | 1 | 1.0 | 1 |  | 1 | 1 | 0 |  | 0 |  |  |  |  |  |
|  | 10 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0.0 | 0 |  | 0 | 0 | 0 |  | 0 |  |  |  |  |  |
|  | 11 | 2 | 0 | 2 | 2 | 2 | 2 | 2 | 2 | 2.0 | 2 |  | 2 | 2 | 0 |  | 2 |  |  |  |  |  |
|  | 12 | 2 | 0 | 2 | 2 | 2 | 2 | 2 | 2 | 2.0 | 2 |  | 2 | 2 | 0 |  | 2 |  |  |  |  |  |
|  | Total | 28 | 24 | 31 | 30 | 29 | 29 | 30 | 30 | 33.0 | 44 |  | 32 | 29 | 30 |  | 29 |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Creating a Custom Personality Chip |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Personality chips contain a single SPI Flash memory chip. The memory chip contains encoded audio clips. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The audio clips are organized into twelve groups and encoded as A3400Pro 5Bit with a bit rate of 42kbps and a sample rate of 12KHz. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The audio format is proprietary to GeneralPlus, a company which manufactures the microcontroller that plays the audio clips. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Audio Encoding Software |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| GeneralPlus offers two pieces of software for download from their website, http://www.generalplus.com/,  which may be used to produce personality chips. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | G+ Gadget | Contains several utilities needed to encode audio and prepare it for writing to the memory chip. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | G+ Eventor | Add event data to audio clips which control the behavior of the LEDs in a droid's head and accessories. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | For more information and a walk-through on how to create the audio clips and write them to a personality chip, see this YouTube playlist covering the whole process. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| G+ Audio Batch Converter |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| G+ Audio Batch Converter is part of G+ Gadget. It is used to encode audio files in WAV and other formats into SP5 files which can be played by the droids. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Audio clips need to already have a sample rate of 12KHz before being processed by G+ Audio Batch Converter. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Audio clips that have been encoded with event data from G+ Eventor are then encoded into SP5 files by G+ Audio Batch Converter. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Select the encoding algorithm A3400Pro 5Bit; the bitrate option should be greyed out, but if not, set to 42000. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Under the "IO Event" tab, enable pins 1-5 and 17-21, otherwise event data added with G+ Eventor will not be included in the encoded SP5 file. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| G+ File Merger |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| G+ File Merger is part of G+ Gadget. It is used to organize the audio clips into groups and produce a single BIN file which is then written to the memory chip. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Personality chips have 12 groups. Each groups should be of type Speech (0x00). |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Audio groups can be named whatever you want, however I recommend simply naming them 1-12. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Under the Merge Option area check "Version 2", check "8 Bytes Head", and select "GPCD9T" for body series. Everything else in this area can be left as-is. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The "Option Panel" section displays the memory chip's contents between address 0x20 and 0x40. It is used to specify the personality chip's ID and affiliation. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Option Panel: Bytes 0x20 - 0x40 of the Personality Chip Explained |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Byte (Offset) | Value | Notes |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x20 | 0x01 or 0x02 | Black and CB-23 have a value of 0x02, all others have a value of 0x01. Is this a version number? Uncertain. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x24 | Chip ID |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x26 | Chip ID | (see table below); value will appear as the last byte of the droid's bluetooth beacon data |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x28 | Affiliation ID | (see table below); a representation of this value will appear as the second to last byte of the droid's bluetooth beacon data. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  | Formula to convert Affiliation ID to second-to-last byte of the beacon data: 0x80 + (<Affiliation ID> * 2) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Chip ID | Chip | Affiliation | Shutdown Track |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 1 | none (R2) | Scoundrel | 2019-07-02 00:00:00 |  | Shutdown Track = <group> - <track #> played when droid goes to sleep |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 2 | none (BB) | Scoundrel | 2019-07-03 00:00:00 |  | Shutdown track defaults to 7-1 for any chip with an ID greater than 8. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 3 | Blue | Resistance | 2019-07-02 00:00:00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 4 | Gray | Scoundrel | 2019-07-04 00:00:00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 5 | Red | First Order | 2019-07-02 00:00:00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 6 | Orange | Resistance | 2019-07-03 00:00:00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 7 | Purple | Scoundrel | 2019-07-01 00:00:00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 8 | Black | First Order | 2019-07-01 00:00:00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 9.0 | CB-23 / Red 2 | Scoundrel | 2022-07-01 00:00:00 |  | The rebel RED personality chip is the same as personality chip bundled with CB-23 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 10 | Yellow | Resistance |  |  | possibly CH-33P |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 11 | none (C1-10P) | Resistance |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 12 | none (D-O) | Resistance |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 13 | Blue 2 | Scoundrel |  |  | R2-D2 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 14.0 | none (BD-1) | Resistance |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 15 | ? |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 16 | Drum Kit | Scoundrel |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 1 | Orange (SPOOK-E) | Resistance |  |  | Bundled with purple R-Series panels sold in 2025; looks like a copy of the R2 embedded personality chip with a couple extra, "spooky" sounds. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 1 | Green (R2-H15) | Resistance |  |  | Bundled with R2-H15 Holday Droid, sold in 2025, limited to 5000(?) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Affiliation ID | ID in Binary | Affiliation |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 1 | 0001 | Scoundrel |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 5 | 0101 | Resistance |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 9 | 1001 | First Order | seems like there should be an affiliation id of 3 or left two bits indicate affiliation and the right two bits, '01', are fixed |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| G+ Eventor |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| G+ Eventor is used to add event metadata to an audio clip. Audio files with event data in them will have the file extension GEA or GEAX. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The LEDs in a droid's head have a default behavior of blinking in sync with the audio clip being played; sync is probably based on volume. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Event data within an audio clip may be used to override the default behavior of the LEDs in the droid. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Stock personality chips only contain event data for audio clips that play with R-Series accessories and a single track (group 5, track 1) which makes the head LED blink in a steady pattern. The rest of the audio clips have no event data. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Events |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | There are two types of events: User Events and I/O Events. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | I/O events are controlled via the "Edit Event" section of the G+ Eventor GUI and number from 1 to 112. There are several functions built into the GUI to let you set the I/O event's value throughout the audio clip. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | User events are inserted manually. When in the G+ Eventor GUI press CTRL+I to add a user event. "Index" refers to the ID of the user event and "SubIndex" is the value that event will be given. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | LED Behavior Based On Events |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | There are 5 LEDs in an R-Series droid, 3 in the head, 1 in the left accessory, 1 in the right accessory. BB-Series droids have multiple LEDs in their heads, but the they are treated as a single LED. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Based on testing, it appears that each LED has 3 events associated with it. A "mode", a "brightness", and a "blink speed" event. The names given to these events is based on behavior seen in testing, and may not be correct. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | The "mode" event is set at the beginning of the audio file and essentially enable the given LED. This controls how the LED is synchronized with the audio track being played. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | The "brightness" event controls the brightness of the LEDs. Stock personality chips only use this to ramp down the brightness over the length of the blaster and thruster audio clips. 0 = off, 255 = full brightness |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | The "blink speed" event seems to only matter if the "mode" that's been set is one that blinks. Blaster accessories use a blinking mode, also group 5 sound 1 causes one of the head LEDs to blink. 0 = no blinking, rate increases with value |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | LED | "Mode" User Event | "Brightness" I/O Event | "Blink Speed" I/O Event |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Head 1 | 80.0 | 1.0 | 17.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Head 2 | 81.0 | 2.0 | 18.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Head 3 | 82.0 | 3.0 | 19.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Left Accessory | 83.0 | 4.0 | 20.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Right Accessory | 84.0 | 5.0 | 21.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Event Data From Stock Personality Chips |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Below is a list of all the event data found in stock personality chips. For an example of encoded audio clips with these events see this YouTube video. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Track(s) | Event Type | Event Parameters |  |  |  | Purpose |  |  |  |  |  |  |  |  |  | User Event SubIndex | Effect | i think 0-8 changes duty cycle with 8 being 100% duty cycle (always on) |  |  |  |
|  | 5-1 | User Event | Index 80, SubIndex 4, Position 0 |  |  |  | Enable and Set Behavior of Head LED |  |  |  |  |  |  |  |  |  | 0.0 | nothing |  |  |  |  |
|  | 5-1 | I/O Event | Event 17, Level Control from 100 samples to clip length - 100 samples, level 9 |  |  |  | Set Blink Speed of Head LED |  |  |  |  |  |  |  |  |  | 1.0 | blink .5s, off .5s, repeat |  |  |  |  |
|  | 11-1, 11-2 | User Event | Index 83, SubIndex 3, Position 0 |  |  |  | Enable and Set Behavior of Left Accessory LED |  |  |  |  |  |  |  |  |  | 2.0 | rapid blinking |  |  |  |  |
|  | 11-1, 11-2 | User Event | Index 84, SubIndex 3, Position 0 |  |  |  | Enable and Set Behavior of Right Accessory LED |  |  |  |  |  |  |  |  |  | 3.0 | rapid blinking |  |  |  |  |
|  | 11-1, 11-2 | I/O Event | Event 4, Ramp down from start to end of clip: initial value 255, final value 0 |  |  |  | Fade Out Left Accessory LED |  |  |  |  |  |  |  |  |  | 4.0 | rapid blinking |  |  |  |  |
|  | 11-1, 11-2 | I/O Event | Event 5, Ramp down from start to end of clip: initial value 255, final value 0 |  |  |  | Fade Out Right Accessory LED |  |  |  |  |  |  |  |  |  | 5.0 | rapid blinking |  |  |  |  |
|  | 12-1, 12-2 | User Event | Index 83, SubIndex 13, Position 0 |  |  |  | Enable and Set Behavior of Left Accessory LED |  |  |  |  |  |  |  |  |  | 6.0 | rapid blinking (i think the rapidness is decreasing) |  |  |  |  |
|  | 12-1, 12-2 | User Event | Index 84, SubIndex 13, Position 0 |  |  |  | Enable and Set Behavior of Right Accessory LED |  |  |  |  |  |  |  |  |  | 7.0 | solid, rapid blinking, solid (i think) |  |  |  |  |
|  | 12-1, 12-2 | I/O Event | Event 4, Ramp down from start to end of clip: initial value 255, final value 0 |  |  |  | Fade Out Left Accessory LED |  |  |  |  |  |  |  |  |  | 8.0 | solid |  |  |  |  |
|  | 12-1, 12-2 | I/O Event | Event 5, Ramp down from start to end of clip: initial value 255, final value 0 |  |  |  | Fade Out Right Accessory LED |  |  |  |  |  |  |  |  |  | 9.0 | blinking |  |  |  |  |
|  | 12-1, 12-2 | I/O Event | Event 20, Level Control from start to end of clip: level 96 |  |  |  | Set Blink Speed of Left Accessory LED |  |  |  |  |  |  |  |  |  | 10.0 | blinking |  |  |  |  |
|  | 12-1, 12-2 | I/O Event | Event 21, Level Control from start to end of clip: level 96 |  |  |  | Set Blink Speed of Right Accessory LED |  |  |  |  |  |  |  |  |  | 11.0 | blinking |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | 12.0 | blinking |  |  |  |  |
|  | Examples of Droid Audio Clips with Event Data |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | 13.0 | stock (wavy?) |  |  |  |  |
|  | Below is a link to a ZIP file that contains 5 GEAX files. There are two blaster noises (group 11), two thruster noises (group 12), and one emergency noise (group 5, track 1). |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | 14.0 | solid |  |  |  |  |
|  | These files are released into the public domain. As such you may use these files either as an example or you may include them with your own custom personality. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | 15.0 | solid |  |  |  |  |
|  | https://drive.google.com/open?id=1x9H_aVuFWL4TmU65qPdc4pNt5Wlcx-YU |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | it's likely only the lower nibble (0-15) is considered by the audio controller, and the sequence repeats |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | thus why 16 is off, 17 is the slow blinking, etc... |  |  |  |  |  |
| Custom Personality Chip ROMs |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Custom personality chips available for download. Use them to program your custom personality chip (or make your own!) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| "Unknown" affiliation means the affiliation ID has been set to 3, which is not used by the stock personality chips. I have no clue how other droids or items around Galaxy's Edge might respond. :) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Name | Chip ID | Affiliation | Download Link |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| "Buzz" | 9 (0x09) | Scoundrel* (0x03) | https://drive.google.com/file/d/1BUZe3nxGrU47zWsIzxWGqt2qdRQa4QI2/view |  |  |  |  | * Behaves like Scoundrel, but affiliation ID used in chip is not used by any stock personality chips |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| "Bubbles" | 10 (0x0A) | Scoundrel* (0x03) | https://drive.google.com/file/d/1Hpyr-tAgmYxXDr4LESq1TVHVuAozYS-r/view |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| "Little Mouse" | 11 (0x0B) | Scoundrel* (0x03) | https://drive.google.com/file/d/1ZHd5pPgQVZe8PNejVCNqUINVCXkxGzh1/view |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| "Big Mouse" | 12 (0x0B) | Scoundrel* (0x03) | https://drive.google.com/file/d/1Gyb_Zz9q8IZin4LMoqXSdHT_Mz9Niti0/view |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Resources for Creating A Custom Personality Chip |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| This is a list of resources to guide in constructing your own custom personality chip. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| WARNING: These instructions are presented as-is and without warranty. You take responsibility for what you do with this information. If you break your droid it is your responsibility. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Build Instructions (Playlist) |  |  |  |  | Custom Personality Chip PCB Bill of Materials (BOM) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | https://www.youtube.com/playlist?list=PL1LWtA1iy9htxbn6YRiQPNZSwZlszt2Kj |  |  |  |  | Memory Chip: | SPI Flash, either DIP-8 or SOIC-8 package |  |  | https://www.mouser.com/ProductDetail/454-W25Q16JVSNIQ |  |  |  |  |  |  |  |  |  |  |  |  |
|  | https://www.youtube.com/playlist?list=PL1LWtA1iy9hv2R1a-inW9WY91VEcFrai0 |  |  |  |  |  | (only use one!) |  |  | https://www.mouser.com/ProductDetail/454-W25Q32JVDAIQ |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  | R33, R99: | 0805, 10kOhms resistor |  |  | https://www.mouser.com/ProductDetail/71-CRCW080510K0FKEAC |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Custom PCBs Available from OSH Park |  |  |  |  | C42 | 0805, 0.1uF (100nF) Capacitor |  |  | https://www.mouser.com/ProductDetail/80-C0805C104J5R |  |  |  |  |  |  |  |  |  |  |  |  |
|  | SMD & DIP-8 | https://oshpark.com/shared_projects/pKGHswCw |  |  |  | C44 | 0805, 2pF Capacitor |  |  | https://www.mouser.com/ProductDetail/80-C0805C209D3HACTU |  |  |  |  |  |  |  |  |  |  |  |  |
|  | SMD Only: | https://oshpark.com/shared_projects/h6gIuBDP |  |  |  |  | (15pF will work as well; generally anything under 20ish pF will do) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Through-Hole Only: | https://oshpark.com/shared_projects/BQLBpICr |  |  |  | DIP-8 Socket | OPTIONAL |  |  | https://www.mouser.com/ProductDetail/4808-3004-CP |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  | (for DIP-8 package SPI Flash Chips only!) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| SPI Flash Memory Chip Programmer |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| A programmer is needed to write the custom ROM to the Flash memory chip. There are many options out there. Below are two that I have personally used. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | TL866II Plus | $60 | https://www.ebay.com/itm/192899365703 |  |  | Can be found for cheaper on eBay if willing to wait a month while it ships from China. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | CH341A | $10 | https://www.amazon.com/dp/B07R5LPTYM/ |  |  | Windows software for the CH341A programmer can be found here: https://forum.laboneinside.com/viewtopic.php?f=35&t=76 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  | flashrom (https://www.flashrom.org/Flashrom) can also be used with a CH341A |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Why the massive price difference? |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | The CH341A is designed only for 8-pin Flash chips. The TL866II Plus supports a wide variety of other chips, including microcontrollers and memory chips with more than 8 pins. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | The CH341A does not come with software. To find the software requires searching the internet, whereas the TL866II comes with software and it's available for download from the manufacturer's website. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | I think the TL866II Plus is the better value if you need a programmer for other projects beyond building a custom personality chip. But if it's just personality chips you want, on a budget, the CH341A is the way to go. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Flashrom is an open source project which can be used to read and write personality chips. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Installation will vary between platforms. I have been able to use it successfully with the Windows Subsystem for Linux (WSL). |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | See: | https://docs.microsoft.com/en-us/windows/wsl/connect-usb |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | https://github.com/dorssel/usbipd-win/wiki/WSL-support |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Notes for Installing Flashrom for WSL 2 (requires Windows 10 or later) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | https://docs.microsoft.com/en-us/windows/wsl/connect-usb |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Update WSL so it's running the latest version. From a windows terminal with administrative rights: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | wsl --update |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Then open WSL and run the following commands |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | sudo apt update |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | sudo apt upgrade |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Install the latest usbipd-win release (download the MSI file and execute) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | https://github.com/dorssel/usbipd-win/releases/tag/v2.3.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Install Tools |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | sudo apt install linux-tools-5.4.0-77-generic hwdata |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | sudo update-alternatives --install /usr/local/bin/usbip usbip /usr/lib/linux-tools/5.4.0-77-generic/usbip 20 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Install flashrom |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | sudo apt-get install flashrom |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | sudo cp /lib/udev/rules.d/60-flashrom.rules /etc/udev/rules.d/ |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Notes for Attaching the CH341A Programmer to WSL 2 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 1. Plug in CH341A programmer. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 2. Start WSL |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 3. Open windows command terminal as administrator user and execute the following command: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | usbipd wsl list |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 4. Identify the CH341A programmer in list and note the BUSID value, then run the command: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | usbipd wsl attach --busid <BUSID> |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 5. this should attach the device to WSL. to confirm, run the following from within WSL |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | lsusb |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 6. CH341A should appear in the list. Confirm you can access it with this command: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | flashrom --programmer ch341a_spi |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Notes for Using CH341A with Flashrom |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Read the contents of a personality chip to a file: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | flashrom --programmer ch341a_spi -r <ROM.bin> |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | To write a ROM to a personality chip, the ROM file must be the same size as the flash chip. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | First, obtain the size of the flash chip: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | flashrom --programmer ch341a_spi --flash-size |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Then pad the ROM file out to the full size of the flash |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | truncate -s <ROM_SIZE> <ROM.bin> |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Write the contents of a ROM to the personality chip: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | flashrom --programmer ch341a_spi -w <ROM.bin> |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Personality Chip to DIP-8 Adapter |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| https://oshpark.com/shared_projects/chbCtdq9 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Useful for programming your personality chip without having to remove the chip or hook a clip to it. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Project description on OSHPark has links to where you can buy the socket and pins needed to build the adapter. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| If using a TL866 or TL866II Plus programmer, disable the "Pin Detect" option in the lower-left of the programming software window when using this adapter. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Custom Personality Chip Case |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Designed by Spudinator on Thingiverse, there are versions for both DIP and SOIC-8 package memory chips. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| https://www.thingiverse.com/thing:4161884 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Bluetooth Beacons and Order of Audio Played |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| When the droid encounters an appropriate bluetooth beacon it will play an audio clip from the group specified by the beacon. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The droid will react to a beacon about every 2 minutes. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The clips are played sequentially as they are stored within the group on the memory chip. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| If a droid leaves the area of a beacon, but then returns (without having been powered off) it will pick up at the spot in the order where it left off. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Bluetooth Beacon Motor Response -- BB-Seriess |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| An attempt at identifying different responses based on motor drive of BB units. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| It appears motor drive responses when reacting to a beacon are specific to the audio group. (Further Research Needed) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| These motor pulses spin the head of the BB unit. I suspect similar patterns are in place for R2 units. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Motor Pulse Time | Classification |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0.5s | short |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 1s | medium |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 2s | long |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Beacon / Group | Motor Pulse Pattern |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 1.0 | short, short, short, short |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 2.0 | long, long, long, long |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 3.0 | med, long, med |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 4.0 | short, short, long |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 5.0 | med, med, med, med |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 6.0 | med, short, short, med, short |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 7.0 | med, med, med |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Testing The Activation Noise -or- How To Factory Reset And Pair Your Droid |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| https://www.youtube.com/watch?v=gKocbzvLSUg |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| With the droid powered off, hold down the pairing button and then turn the droid on. Keep the button down until the pairing LED turns on (about 10 seconds). |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The droid is now in a 'factory' state. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| To pair your droid with your remote hold down the pairing button on the droid until the LED turns on (about 2 seconds). |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| With the remote off, hold down the up and accessory buttons, then turn the remote on. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The droid will pair with the remote and as the droid is in a 'factory' state, the activation noise will play. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The manual that came with your droid also contains the instructions on how to pair it. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Analyzing Personality Chip's SPI Flash Memory Chip Contents |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Information below comes from analyzing the raw data on the flash memory of the personality chip. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Group Index Table |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Offset 0x40 contains a 4-byte value of how many groups there are. This value appears to always be 0x0c (12). |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The group index table begins at offset 0x44. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Each entry in the group table is 4-bytes long. It is an offset to the location on the chip that contains a list of locations for each audio clip in that group. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The size of this table will be 4 * <value at 0x40>. In this case that's 48 bytes. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The audio by group index table begins immediately after the group index table. To calculate its starting location add the value calculated above to the offset for the start of the group index table. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 0x44 + 0x30 = 0x74 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Audio by Group Index Table |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Audio by Group Index Table (audio table) has as many records in it as there are groups. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Each record in contains a list of offsets to each audio clip in that particular group. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The first 4-bytes of the record represents the number of audio clips in the bank |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| There is an extra 4 byte value at the end of the record; currently unsure what it is, but appears to be related to where the end of the audio data is |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Different banks can point to the same audio clip. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Audio Data |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The microcontroller skips the first 4 bytes of the audio data block for some reason. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| This skipped value appears to always be 0x650d2100 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The next 4-byte value appears to always be 0xe02e0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The microcontroller only reads the first 2 bytes of that value; 0xe02e |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| This is a little-endian value of 12,000. This is the sample rate of the audio clip. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Searching for the value 0x650d2100e02e0000 is a quick and dirty way to locate the start of an audio data block |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| What track is the shutdown track? |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Chip ID | Personality | Shutdown Track |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 0 | none | none |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1 | R2 | Group 7, Track 2 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 2 | BB | Group 7, Track 3 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 3 | Blue | Group 7, Track 2 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 4 | Gray | Group 7, Track 4 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 5 | Red | Group 7, Track 2 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 6 | Orange | Group 7, Track 3 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 7 | Purple | Group 7, Track 1 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 8 | Black | Group 7, Track 1 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| any other ID |  | Group 7, Track 1 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Trying to determine which track is used as a 'shutdown' noise. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Which track is used is different depending on if the personality chip was inserted before or after power-on. |  |  |  |  |  |  | looking at decompiled firmware |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Or the after-power might also be triggered by the forward button during voltage drop. Hmmm |  |  |  |  |  |  | any personality chip with a chip ID greater than 8 will always play track 1 of group 7 for its shutdown noise |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Chip ID greater than 6, then shutdown track is 7-1. |  |  |  |  |  |  | 9 bytes starting at offset 22C18 of the firmware identify the shutdown track in group 7 for each personality |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  | 00 01 02 01 03 01 02 00 00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| version - chip - chip - affiliation |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | group - track |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Shutdown Track |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Chip Config | add before power | add after power |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-3-3-1 | 2019-07-02 00:00:00 | 2019-01-02 00:00:00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-4-4-1 | 2019-07-04 00:00:00 | 2019-01-04 00:00:00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-5-5-9 | 2019-07-02 00:00:00 | 2019-01-02 00:00:00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-6-6-5 | 2019-07-03 00:00:00 | 2019-01-03 00:00:00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-7-7-1 | 2019-07-01 00:00:00 | 2019-01-01 00:00:00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 2-8-8-9 | 2019-07-01 00:00:00 | 2019-07-01 00:00:00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-4-4-5 | 2019-07-04 00:00:00 | 2019-01-04 00:00:00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-4-4-9 | 2019-07-04 00:00:00 | 2019-01-04 00:00:00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-6-6-1 | 2019-07-03 00:00:00 | 2019-01-03 00:00:00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 2-6-6-1 | 2019-07-03 00:00:00 | 2019-01-03 00:00:00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  | last bytes of beacon |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-3-6-1 | 2019-07-02 00:00:00 | 2019-01-02 00:00:00 |  | 8203 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-5-6-3 | 2019-07-02 00:00:00 | 2019-01-02 00:00:00 |  | 8605 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 2-4-6-3 | 2019-07-04 00:00:00 | 2019-01-04 00:00:00 |  | 8604 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 3-9-9-3 | 2019-07-01 00:00:00 | 2019-01-01 00:00:00 |  | 8609 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 3-A-A-3 | 2019-07-01 00:00:00 | 2019-01-01 00:00:00 |  | 860A |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 3-B-A-B | 2019-07-01 00:00:00 | 2019-01-01 00:00:00 |  | 960B |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 3-C-C-3 | 2019-07-01 00:00:00 | 2019-01-01 00:00:00 |  | 860C |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-1-1-1 | 2019-07-02 00:00:00 | 2019-01-02 00:00:00 |  | 8201.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-2-2-1 | 2019-07-03 00:00:00 | 2019-01-03 00:00:00 |  | 8202.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-12-12-1 | 2019-07-01 00:00:00 | 2019-01-01 00:00:00 |  | 8212.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-0-0-1 | no audio from droid |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Which Audio Group Is Used By Which Beacon Under Which Personality Chip? |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Cycle power between chips. Droid retains the beacon/group mapping set when it powers on through multiple personality chip swaps. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| "chip config" = version - chip - chip - affiliation |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| these are the values found in the special data section of the personality chip |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| affiliation appears to define the beacon/group mapping |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Affiliation | Mapping | in Binary | Name |  | Notes |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0 (0x00) | 4,5,3,1,7,6,2 | 0000 0000 |  |  | Upon power-up, droids will wait 1 minute before responding to a beacon |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 1 (0x01) | 1,2,3,4,5,6,7 | 0000 0001 | Scoundrel |  | Unchipped droids will have an affiliation of scoundrel |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 2 (0x02) | 1,2,3,4,5,6,7 | 0000 0010 |  |  | Droids will not respond to other droid beacons for 2 hours after last seeing a location beacon. This is probably to keep droids from reacting all the time while in the parks. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 3 (0x03) | 1,2,3,4,5,6,7 | 0000 0011 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 4 (0x04) | 4,5,3,1,7,6,2 | 0000 0100 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 5 (0x05) | 4,5,3,1,7,6,2 | 0000 0101 | Resistance |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 6 (0x06) | 4,5,3,1,7,6,2 | 0000 0110 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 7 (0x07) | 4,5,3,1,7,6,2 | 0000 0111 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 8 (0x08) | 5,4,3,7,1,2,6 | 0000 1000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 9 (0x09) | 5,4,3,7,1,2,6 | 0000 1001 | First Order |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 10 (0x0A) | 5,4,3,7,1,2,6 | 0000 1010 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 11 (0x0B) | 5,4,3,7,1,2,6 | 0000 1011 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 12 (0x0C) | 5,4,3,1,2,7,6 | 0000 1100 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 13 (0x0D) | 5,4,3,1,2,7,6 | 0000 1101 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 14 (0x0E) | 5,4,3,1,2,7,6 | 0000 1110 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 15 (0x0F) | 5,4,3,1,2,7,6 | 0000 1111 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 16 (0x10) | 5,4,3,1,2,7,6 | 0001 0000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 17 (0x11) | 5,4,3,1,2,7,6 | 0001 0001 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Chip Config | Beacon Byte | Audio Group |  | Chip Config | Beacon Byte | Audio Group |  | Chip Config | Beacon Byte | Audio Group |  | Chip Config | Beacon Byte | Audio Group |  | Chip Config | Beacon Byte | Audio Group |  | Chip Config | Beacon Byte | Audio Group |
| 1-3-3-5 | 1.0 | 4.0 |  | 1-6-6-5 | 1.0 | 4.0 |  | 1-1-1-5 | 1.0 | 4.0 |  | 1-7-7-5 | 1.0 | 4.0 |  | 1-9-9-5 | 1.0 | 4.0 |  | 2-8-8-5 | 1.0 | 4.0 |
| 1-3-3-5 | 2.0 | 5.0 |  | 1-6-6-5 | 2.0 | 5.0 |  | 1-1-1-5 | 2.0 | 5.0 |  | 1-7-7-5 | 2.0 | 5.0 |  | 1-9-9-5 | 2.0 | 5.0 |  | 2-8-8-5 | 2.0 | 5.0 |
| 1-3-3-5 | 3.0 | 3.0 |  | 1-6-6-5 | 3.0 | 3.0 |  | 1-1-1-5 | 3.0 | 3.0 |  | 1-7-7-5 | 3.0 | 3.0 |  | 1-9-9-5 | 3.0 | 3.0 |  | 2-8-8-5 | 3.0 | 3.0 |
| 1-3-3-5 | 4.0 | 1.0 |  | 1-6-6-5 | 4.0 | 1.0 |  | 1-1-1-5 | 4.0 | 1.0 |  | 1-7-7-5 | 4.0 | 1.0 |  | 1-9-9-5 | 4.0 | 1.0 |  | 2-8-8-5 | 4.0 | 1.0 |
| 1-3-3-5 | 5.0 | 7.0 |  | 1-6-6-5 | 5.0 | 7.0 |  | 1-1-1-5 | 5.0 | 7.0 |  | 1-7-7-5 | 5.0 | 7.0 |  | 1-9-9-5 | 5.0 | 7.0 |  | 2-8-8-5 | 5.0 | 7.0 |
| 1-3-3-5 | 6.0 | 6.0 |  | 1-6-6-5 | 6.0 | 6.0 |  | 1-1-1-5 | 6.0 | 6.0 |  | 1-7-7-5 | 6.0 | 6.0 |  | 1-9-9-5 | 6.0 | 6.0 |  | 2-8-8-5 | 6.0 | 6.0 |
| 1-3-3-5 | 7.0 | 2.0 |  | 1-6-6-5 | 7.0 | 2.0 |  | 1-1-1-5 | 7.0 | 2.0 |  | 1-7-7-5 | 7.0 | 2.0 |  | 1-9-9-5 | 7.0 | 2.0 |  | 2-8-8-5 | 7.0 | 2.0 |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-4-4-1 | 1.0 | 1.0 |  | 1-7-7-1 | 1.0 | 1.0 |  | 1-6-6-1 | 1.0 | 1.0 |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-4-4-1 | 2.0 | 2.0 |  | 1-7-7-1 | 2.0 | 2.0 |  | 1-6-6-1 | 2.0 | 2.0 |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-4-4-1 | 3.0 | 3.0 |  | 1-7-7-1 | 3.0 | 3.0 |  | 1-6-6-1 | 3.0 | 3.0 |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-4-4-1 | 4.0 | 4.0 |  | 1-7-7-1 | 4.0 | 4.0 |  | 1-6-6-1 | 4.0 | 4.0 |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-4-4-1 | 5.0 | 5.0 |  | 1-7-7-1 | 5.0 | 5.0 |  | 1-6-6-1 | 5.0 | 5.0 |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-4-4-1 | 6.0 | 6.0 |  | 1-7-7-1 | 6.0 | 6.0 |  | 1-6-6-1 | 6.0 | 6.0 |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-4-4-1 | 7.0 | 7.0 |  | 1-7-7-1 | 7.0 | 7.0 |  | 1-6-6-1 | 7.0 | 7.0 |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-5-5-9 | 1.0 | 5.0 |  | 1-6-6-9 | 1.0 | 5.0 |  | 1-7-7-9 | 1.0 | 5.0 |  | 1-8-8-9 | 1.0 | 5.0 |  | 1-9-9-9 | 1.0 | 5.0 |  | 2-8-8-9 | 1.0 | 5.0 |
| 1-5-5-9 | 2.0 | 4.0 |  | 1-6-6-9 | 2.0 | 4.0 |  | 1-7-7-9 | 2.0 | 4.0 |  | 1-8-8-9 | 2.0 | 4.0 |  | 1-9-9-9 | 2.0 | 4.0 |  | 2-8-8-9 | 2.0 | 4.0 |
| 1-5-5-9 | 3.0 | 3.0 |  | 1-6-6-9 | 3.0 | 3.0 |  | 1-7-7-9 | 3.0 | 3.0 |  | 1-8-8-9 | 3.0 | 3.0 |  | 1-9-9-9 | 3.0 | 3.0 |  | 2-8-8-9 | 3.0 | 3.0 |
| 1-5-5-9 | 4.0 | 7.0 |  | 1-6-6-9 | 4.0 | 7.0 |  | 1-7-7-9 | 4.0 | 7.0 |  | 1-8-8-9 | 4.0 | 7.0 |  | 1-9-9-9 | 4.0 | 7.0 |  | 2-8-8-9 | 4.0 | 7.0 |
| 1-5-5-9 | 5.0 | 1.0 |  | 1-6-6-9 | 5.0 | 1.0 |  | 1-7-7-9 | 5.0 | 1.0 |  | 1-8-8-9 | 5.0 | 1.0 |  | 1-9-9-9 | 5.0 | 1.0 |  | 2-8-8-9 | 5.0 | 1.0 |
| 1-5-5-9 | 6.0 | 2.0 |  | 1-6-6-9 | 6.0 | 2.0 |  | 1-7-7-9 | 6.0 | 2.0 |  | 1-8-8-9 | 6.0 | 2.0 |  | 1-9-9-9 | 6.0 | 2.0 |  | 2-8-8-9 | 6.0 | 2.0 |
| 1-5-5-9 | 7.0 | 6.0 |  | 1-6-6-9 | 7.0 | 6.0 |  | 1-7-7-9 | 7.0 | 6.0 |  | 1-8-8-9 | 7.0 | 6.0 |  | 1-9-9-9 | 7.0 | 6.0 |  | 2-8-8-9 | 7.0 | 6.0 |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-3-3-0 | 1.0 | 4.0 |  | 1-9-9-0 | 1.0 | 4.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-3-3-0 | 2.0 | 5.0 |  | 1-9-9-0 | 2.0 | 5.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-3-3-0 | 3.0 | 3.0 |  | 1-9-9-0 | 3.0 | 3.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-3-3-0 | 4.0 | 1.0 |  | 1-9-9-0 | 4.0 | 1.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-3-3-0 | 5.0 | 7.0 |  | 1-9-9-0 | 5.0 | 7.0 |  |  |  |  |  |  |  |  | Config | Personality Chip Color |  |  |  |  |  |  |
| 1-3-3-0 | 6.0 | 6.0 |  | 1-9-9-0 | 6.0 | 6.0 |  |  |  |  |  |  |  |  | 1-3-3-5 | Blue |  |  |  |  |  |  |
| 1-3-3-0 | 7.0 | 2.0 |  | 1-9-9-0 | 7.0 | 2.0 |  |  |  |  |  |  |  |  | 1-4-4-1 | Gray |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | 1-5-5-9 | Red |  |  |  |  |  |  |
| 1-9-9-3 | 1.0 | 1.0 |  |  |  |  |  |  |  |  |  |  |  |  | 1-6-6-5 | Orange |  |  |  |  |  |  |
| 1-9-9-3 | 2.0 | 2.0 |  |  |  |  |  |  |  |  |  |  |  |  | 1-7-7-1 | Purple |  |  |  |  |  |  |
| 1-9-9-3 | 3.0 | 3.0 |  |  |  |  |  |  |  |  |  |  |  |  | 2-8-8-9 | Black |  |  |  |  |  |  |
| 1-9-9-3 | 4.0 | 4.0 |  |  |  |  |  |  |  |  |  |  |  |  | 1-9-9-3 | "Buzz" |  |  |  |  |  |  |
| 1-9-9-3 | 5.0 | 5.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-3 | 6.0 | 6.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-3 | 7.0 | 7.0 |  |  |  |  |  |  |  |  |  |  |  |  | Group | Number |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | 1 | 1-5 |  |  |  |  |  |  |
| 1-5-5-7 | 1.0 | 4.0 |  | 1-9-9-7 | 1.0 | 4.0 |  |  |  |  |  |  |  |  | 2 | 6-10 |  |  |  |  |  |  |
| 1-5-5-7 | 2.0 | 5.0 |  | 1-9-9-7 | 2.0 | 5.0 |  |  |  |  |  |  |  |  | 3 | 11-15 |  |  |  |  |  |  |
| 1-5-5-7 | 3.0 | 3.0 |  | 1-9-9-7 | 3.0 | 3.0 |  |  |  |  |  |  |  |  | 4 | 16 |  |  |  |  |  |  |
| 1-5-5-7 | 4.0 | 1.0 |  | 1-9-9-7 | 4.0 | 1.0 |  |  |  |  |  |  |  |  | 5 | 17 |  |  |  |  |  |  |
| 1-5-5-7 | 5.0 | 7.0 |  | 1-9-9-7 | 5.0 | 7.0 |  |  |  |  |  |  |  |  | 6 | 18-21 |  |  |  |  |  |  |
| 1-5-5-7 | 6.0 | 6.0 |  | 1-9-9-7 | 6.0 | 6.0 |  |  |  |  |  |  |  |  | 7 | 22-25 |  |  |  |  |  |  |
| 1-5-5-7 | 7.0 | 2.0 |  | 1-9-9-7 | 7.0 | 2.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-5-5-11 | 1.0 | 5.0 |  | 1-9-9-11 | 1.0 | 5.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-5-5-11 | 2.0 | 4.0 |  | 1-9-9-11 | 2.0 | 4.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-5-5-11 | 3.0 | 3.0 |  | 1-9-9-11 | 3.0 | 3.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-5-5-11 | 4.0 | 7.0 |  | 1-9-9-11 | 4.0 | 7.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-5-5-11 | 5.0 | 1.0 |  | 1-9-9-11 | 5.0 | 1.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-5-5-11 | 6.0 | 2.0 |  | 1-9-9-11 | 6.0 | 2.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-5-5-11 | 7.0 | 6.0 |  | 1-9-9-11 | 7.0 | 6.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-3-3-15 | 1.0 | 5.0 |  | 1-9-9-15 | 1.0 | 5.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-3-3-15 | 2.0 | 4.0 |  | 1-9-9-15 | 2.0 | 4.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-3-3-15 | 3.0 | 3.0 |  | 1-9-9-15 | 3.0 | 3.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-3-3-15 | 4.0 | 1.0 |  | 1-9-9-15 | 4.0 | 1.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-3-3-15 | 5.0 | 2.0 |  | 1-9-9-15 | 5.0 | 2.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-3-3-15 | 6.0 | 7.0 |  | 1-9-9-15 | 6.0 | 7.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-3-3-15 | 7.0 | 6.0 |  | 1-9-9-15 | 7.0 | 6.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-16 | 1.0 | 5.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-16 | 2.0 | 4.0 |  | https://blooloop.com/features/secret-messages-ogas-cantina/ |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-16 | 3.0 | 3.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-16 | 4.0 | 1.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-16 | 5.0 | 2.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-16 | 6.0 | 7.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-16 | 7.0 | 6.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-2 | 1.0 | 1.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-2 | 2.0 | 2.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-2 | 3.0 | 3.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-2 | 4.0 | 4.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-2 | 5.0 | 5.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-2 | 6.0 | 6.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-2 | 7.0 | 7.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-4 | 1.0 | 4.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-4 | 2.0 | 5.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-4 | 3.0 | 3.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-4 | 4.0 | 1.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-4 | 5.0 | 7.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-4 | 6.0 | 6.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-4 | 7.0 | 2.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-6 | 1.0 | 4.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-6 | 2.0 | 5.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-6 | 3.0 | 3.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-6 | 4.0 | 1.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-6 | 5.0 | 7.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-6 | 6.0 | 6.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-6 | 7.0 | 2.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-8 | 1.0 | 5.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-8 | 2.0 | 4.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-8 | 3.0 | 3.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-8 | 4.0 | 7.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-8 | 5.0 | 1.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-8 | 6.0 | 2.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-8 | 7.0 | 6.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-10 | 1.0 | 5.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-10 | 2.0 | 4.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-10 | 3.0 | 3.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-10 | 4.0 | 7.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-10 | 5.0 | 1.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-10 | 6.0 | 2.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-10 | 7.0 | 6.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-12 | 1.0 | 5.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-12 | 2.0 | 4.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-12 | 3.0 | 3.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-12 | 4.0 | 1.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-12 | 5.0 | 2.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-12 | 6.0 | 7.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-12 | 7.0 | 6.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-13 | 1.0 | 5.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-13 | 2.0 | 4.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-13 | 3.0 | 3.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-13 | 4.0 | 1.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-13 | 5.0 | 2.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-13 | 6.0 | 7.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-13 | 7.0 | 6.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-14 | 1.0 | 5.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-14 | 2.0 | 4.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-14 | 3.0 | 3.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-14 | 4.0 | 1.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-14 | 5.0 | 2.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-14 | 6.0 | 7.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-14 | 7.0 | 6.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-17 | 1.0 | 5.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-17 | 2.0 | 4.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-17 | 3.0 | 3.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-17 | 4.0 | 1.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-17 | 5.0 | 2.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-17 | 6.0 | 7.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-9-9-17 | 7.0 | 6.0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  | Chip ID | Chip | Affiliation |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Group | Number |  | 1 | none (R2) | Scoundrel |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 1 | 1-5 |  | 2 | none (BB) | Scoundrel |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 2 | 6-10 |  | 3 | Blue | Resistance |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 3 | 11-15 |  | 4 | Gray | Scoundrel |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 4 | 16 |  | 5 | Red | First Order |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 5 | 17 |  | 6 | Orange | Resistance |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 6 | 18-22 |  | 7 | Purple | Scoundrel |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 7 | 23-27 |  | 8 | Black | First Order |  | 0x44 = 68 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Which Audio Group Is Used By Which Beacon Under Which Personality Chip? |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Cycle power between chips. Droid retains the beacon/group mapping set when it powers on through multiple personality chip swaps. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Droids will not respond to other droid beacons for 2 hours after last seeing a location beacon. This is probably to keep droids from reacting all the time while in the parks. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| "chip config" = version - chip - chip - affiliation |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| looks like reaction to other droids may be similar to what happens when a button is pressed on the controller. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| roughly 2 minute interval between reactions; there is some randomization in there. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Chip Config | Chip ID Seen | Group Reaction (Order) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-3-3-5 | 1 | 6, 5, 2, 6, 5, 5, 6, 4 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 2 | 4, 6, 4, |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 3 | 4, 4, 4, 6, |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 4 | 5, 5, |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 5 | 3, 3, 2, 3, 3 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 6 | 4, 3, 3, 4 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 7 | 2, 6 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |