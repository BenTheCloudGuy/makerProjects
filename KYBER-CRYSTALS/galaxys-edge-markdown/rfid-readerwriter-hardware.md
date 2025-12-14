# RFID ReaderWriter Hardware

| RFID Reader/Writer Hardware |  |  |  |  |  |  |  |  |  |  |  |  |  |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| This page was originally created prior to the existence of series 2 kyber crystals. |  |  |  |  |  |  |  |  |  |  |  |  |  |
| With the introduction of series 2 kyber crystals almost all the hardware listed on this page, if used with a series 2 kyber crystal, will turn it into a series 1 kyber crystal. |  |  |  |  |  |  |  |  |  |  |  |  |  |
| As such, the recommended hardware to work with series 2 kyber crystals is a Proxmark3 Easy as it is the only hardware on this page capable of reading and writing to individual addresses with in the RFID tag of kyber crystals. |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Proxmark3 Easy |  |  |  |  |  |  |  |  |  |  |  |  |
|  | The best choice. If you're on a Windows machine, check out proxmarkbuilds.org for a simple way to get your PM3 up and running. |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  | This is a swiss army knife for RFID tags. |  |  |  |  |  |  |  |
|  |  |  |  |  |  | Allows reading/writing of many different RFID tags including EM4305 tags found in kyber crystals. |  |  |  |  |  |  |  |
|  |  |  |  |  |  | Requires a computer to use. |  |  |  |  |  |  |  |
|  |  |  |  |  |  | Can be used to remove password-protected RFID tags. |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  | These devices will cost around US$50. Search around eBay and Amazon. |  |  |  |  |  |  |  |
|  |  |  |  |  |  | There is a learning curve to using this device, but the effort is worth it. |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  | Video Guides on the Proxmark3 Easy: |  |  |  |  |  |  |  |
|  |  |  |  |  |  | This YouTube video will help guide you through setup of your Proxmark3 Easy. |  |  |  |  |  |  |  |
|  |  |  |  |  |  | This YouTube video shows an alternative setup that uses pre-compiled binaries rather than compiling the software yourself. |  |  |  |  |  |  |  |
|  |  |  |  |  |  | This YouTube video walks you through fixing password-protected kyber crystals. |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  | Series 2 kyber crystals have extra data in address 9 of the EM4305 RFID tag. |  |  |  |  |  |  |  |
|  |  |  |  |  |  | See the "Kyber Crystals (Series 2)" sheet within this spreadsheet to see the RFID tag data used by each series 2 kyber crystal. |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | NOTICE: kyber crystals modified with a handheld writer will not function with "series 2 aware" devices |  |  |  |  |  |  |  |  |  |  |  |  |
|  | What's a "series 2 aware" device? Currently it is series 2 holocrons and wayfinders. |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Handheld RFID Writer Notes |  |  |  |  |  |  |  |  |  | References |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  | This is an inexpensive device that can be found online which is capable of cloning kyber crystal |  |  |  |  |  |  | Dangerous Things Forums |  |  |
|  |  |  |  | RFID tags to blank EM4305 or T5577 RFID tags. |  |  |  |  |  |  | Proxmark Developers Community |  |  |
|  |  |  |  |  |  |  |  |  |  |  | EM4305 Datasheet |  |  |
|  |  |  |  | However this device locks the tag with a password so that it |  |  |  |  |  |  | EM4100 Protocol |  |  |
|  |  |  |  | cannot be written to except by this device. |  |  |  |  |  |  | Chinese Cloners and Passwords |  |  |
|  |  |  |  |  |  |  |  |  |  |  | proxmark3 on eBay |  |  |
|  |  |  |  | The password for T55xx tags 51243648 |  |  |  |  |  |  | EM4095 Datasheet |  | (EM4095 is the chip used in Holocrons and Lightsabers to read Crystals) |
|  |  |  |  | The password for EM4305 tags is F9DCEBA0 |  |  |  |  |  |  | Common Passwords used by RFID Writers |  |  |
|  |  |  |  |  |  |  |  |  |  |  | T5557 protocol description |  |  |
|  |  |  |  | With a Proxmark3 it is possible to remove the password on a T55xx tag with the following command: |  |  |  |  |  |  |  |  |  |
|  |  |  |  | lf t55xx write b 0 d 00148041 p 51243648 |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  | To remove the password on a kyber crystal (EM4305 tag) with a proxmark 3 use the following command |  |  |  |  |  |  |  |  |  |
|  |  |  |  | lf em 4x05writeword a 2 d 0 p F9DCEBA0 |  |  |  |  |  |  |  |  |  |
|  |  |  |  | lf em 4x05writeword a 4 d 0001805F p 00000000 |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  | Alternatively, after turning the writer on, but before reading any RFID tags, perform a WRITE to the locked RFID tag. This will wipe the tag, remove the password, and make it usable with other readers. |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Handheld RFID Writer with HD3.2 LCD Notes |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  | There are at many versions of this writer out there, and one is known to not work with Kyber Crystals. |  |  |  |  |  |  |  |
|  |  |  |  |  |  | One has an orange/red background image on the screen, the other has a blue background image. |  |  |  |  |  |  |  |
|  |  |  |  |  |  | The blue background image writer does not appear to work with Kyber Crystals. If you're purchasing one of these, look through all the available images on the page to see if they show a red or blue background image. |  |  |  |  |  |  |  |
|  |  |  |  |  |  | The red background one should also have a white background on its disclaimer. Look for images in the listing and if they include a disclaimer image and it doesn't have a white background, you probably need to look for another writer. |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  | Devices marketed under the name/brand "OBO HANDS" have been reported to not work. |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  | This device costs 3 times as much as the above writer, however it does allow for manual input of IDs  to program RFID tags with. |  |  |  |  |  |  |  |
|  |  |  |  |  |  | The number entered into the device must be in DECIMAL format and not HEXADECIMAL. If you have tag IDs you want to program this with that contain letters, that's likely a hexadecimal number. You can find web sites online that will convert hex to decimal for you. If you have a Windows computer the built-in calculator program has a 'programmer' mode which will also do this for you. |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  | Kyber Crystals contain an EM4305 tag. This writer will alter the configuration of the EM4305 tag such that you cannot read data unless you provide a password. |  |  |  |  |  |  |  |
|  |  |  |  |  |  | The password is not altered from what it was prior to writing to the tag, so in most cases it will be '00000000'. |  |  |  |  |  |  |  |
|  |  |  |  |  |  | This configuration change does not alter the performance of the kyber crystal or your ability to program it. It does however hide the information stored on the chip when viewing it with a tool like a proxmark 3. |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  | With a Proxmark 3 the following command will resolve the issue: |  |  |  |  |  |  |  |
|  |  |  |  |  |  | lf em 4x05writeword a 4 d 0001805F p 00000000 |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  | NOTE: this DOES also set a password for T5577 chips as well. the password is 00012323 |  |  |  |  |  |  |  |
|  |  |  |  |  |  | lf t55xx write b 0 d 00148041 p 00012323 |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  | OBO HANDS RFID Passwords |  |
|  |  |  |  |  |  |  |  |  |  |  |  | T55xx: 1C0B5848, 51243648, E4204998, 121AD038, 126C248A, 7686962A |  |
|  |  |  |  |  |  |  |  |  |  |  |  | EM4305: 7686962A, F9DCEBA0, 2A968676 |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  | 300CD-H (black case) RFID Passwords |  |
|  |  |  |  |  |  |  |  |  |  |  |  | EM4305: 7686962A, F9DCEBA0 |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  | 300CD (white case) RFID Passwords |  |
|  |  |  |  |  |  |  |  |  |  |  |  | EM4305: 84AC15E2 |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | GOOD |  |  |  | BAD |  |  |  | BAD |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | GOOD |  |  |  | BAD |  |  |  | Unknown |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Handheld RFID Writer without LCD |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  | Can not write to Kyber Crystals! |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  | This RFID writer is almost as cheap as the blue RFID cloner above, but also allows for input of custom ID numbers. |  |  |  |  |  |  |  |  |  |
|  |  |  |  | However I have been unable to get it to write to any EM4305 RFID tag. It will write to T55xx tags. |  |  |  |  |  |  |  |  |  |
|  |  |  |  | EM4305 tags are used in kyber crystals. In other words, you won't be able to change the ID of kyber crystals with this writer. |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  | This device does write a password to the tag preventing it from being modified by other RFID writers. |  |  |  |  |  |  |  |  |  |
|  |  |  |  | The password for T55xx tags is 932D9963 |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  | The proxmark3 command to remove password protection would be: |  |  |  |  |  |  |  |  |  |
|  |  |  |  | lf t55xx write b 0 d 00148041 p 932D9963 |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | RDM6300 Module (Arduino) |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  | The RDM630 or RDM6300 module sends the decoded ID of an RFID tag it detects via serial. |  |  |  |  |
|  |  |  |  |  |  |  |  |  | It can be used with an Arduino to detect kyber crystals. |  |  |  |  |
|  |  |  |  |  |  |  |  |  | These can be found on Amazon and eBay for under $10. |  |  |  |  |
|  |  |  |  |  |  |  |  |  | However it does require an Arduino or some other device that can interpret serial communications to view the data. |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | ZX-Copy3 |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  | Will put a password on your kyber crystal! |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  | It can write to kyber crystals, however you will be locked into using only this device because it sets an unknown password on the crystal. |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  | Avoid this writer. It's expensive. It sets a password on your kyber crystal so no other RFID writer will work with it. |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  | Password for EM4305 RFID tags: 84AC15E2 |  |  |  |  |  |  |  |
|  |  |  |  |  |  | Password for T55xx RFID tags: E4204998 |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  | To recover the crystal using a proxmark3: |  |  |  |  |  |  |  |
|  |  |  |  |  |  | lf em 4x05writeword a 2 d 0 p 84AC15E2 |  |  |  |  |  |  |  |
|  |  |  |  |  |  | lf em 4x05writeword a 4 d 0001805F p 00000000 |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Antennas |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Because ability to read/write to RFID tags is incredibly dependent on the antenna in the reader/writer. |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Changing an antenna can make an ineffectual RFID reader into a superb reader. |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Inductance measurements made with DE-5000 LCR Meter |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Dimensions measured with cheap eBay digital calipers |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Holocron |  |  |  |  |  |  | Kyber Crystal |  |  |  |  |  |
|  | Dimensions | circle, 15mm OD, 11mm ID, 3mm thick |  |  |  |  |  | Dimensions |  |  |  |  |  |
|  | Inductance | 353 uH |  |  |  |  |  | Inductance |  |  |  |  |  |
|  | Resistance | 3.7 ohms |  |  |  |  |  | Resistance |  |  |  |  |  |
|  | Notes |  |  |  |  |  |  | Notes |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Savi's Workshop Hilt |  |  |  |  |  |  | EM4305 Blue Key Fob |  |  |  |  |  |
|  | Dimensions |  |  |  |  |  |  | Dimensions |  |  |  |  |  |
|  | Inductance | 350 uH |  |  |  |  |  | Inductance |  |  |  |  |  |
|  | Resistance | 3.8 ohms |  |  |  |  |  | Resistance |  |  |  |  |  |
|  | Notes |  |  |  |  |  |  | Notes |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Proxmark3 Easy LF_ANT_500UH |  |  |  |  |  |  | Wayfinder |  |  |  |  |  |
|  | Dimensions | circle, 40mm OD, 34mm ID, 2.7mm thick |  |  |  |  |  | Dimensions | rectangle, 44x22mm, 2.5mm thick |  |  |  |  |
|  | Inductance | 488 uH |  |  |  |  |  | Inductance | 347uH |  |  |  |  |
|  | Resistance | 3.5 ohms |  |  |  |  |  | Resistance | 6.2 ohms |  |  |  |  |
|  | Notes |  |  |  |  |  |  | Notes |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Proxmark3 Easy LF_ANT_500UH MODIFIED |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Dimensions | circle, 40mm OD, 34mm ID, 2.7mm thick |  |  |  |  |  |  |  |  |  |  |  |
|  | Inductance | 487 uH |  |  |  |  |  |  |  |  |  |  |  |
|  | Resistance | 3.5 ohms |  |  |  |  |  |  |  |  |  |  |  |
|  | Notes | modification is a 5.1k resistor in parallel with the antenna; doesn't change inductance or resistance very much, but makes a big difference in assisting the pm3 in reading kybers. |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | RDM6300 Antenna |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Dimensions | square, 35x47mm, 2x1.5mm cross section |  |  |  |  |  |  |  |  |  |  |  |
|  | Inductance | 429 uH |  |  |  |  |  |  |  |  |  |  |  |
|  | Resistance | 6.2 ohms |  |  |  |  |  |  |  |  |  |  |  |
|  | Notes | bought off amazon (https://www.amazon.com/gp/product/B00HGB9TOE/) |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | AliExpress Antenna 1 (125KHZ RFID reader antenna coil self-adhesive 8MM ID access control) |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Dimensions | circle, 14mm OD, 8mm ID, 2.5mm thick |  |  |  |  |  |  |  |  |  |  |  |
|  | Inductance | 348 uH |  |  |  |  |  |  |  |  |  |  |  |
|  | Resistance | 4 ohms |  |  |  |  |  |  |  |  |  |  |  |
|  | Notes |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | AliExpress Antenna 2 (125KHZ coil reader antenna antenna reader RFID ID 20MM) |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Dimensions | circle, 26mm OD, 18mm ID, 1mm thick |  |  |  |  |  |  |  |  |  |  |  |
|  | Inductance | 749 uH |  |  |  |  |  |  |  |  |  |  |  |
|  | Resistance | 10.4 ohms |  |  |  |  |  |  |  |  |  |  |  |
|  | Notes |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | AliExpress Antenna 2  MODIFIED |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Dimensions | circle, 23.5mm OD, 18mm ID, 1mm thick |  |  |  |  |  |  |  |  |  |  |  |
|  | Inductance | 345 uH |  |  |  |  |  |  |  |  |  |  |  |
|  | Resistance | 6.6 ohms |  |  |  |  |  |  |  |  |  |  |  |
|  | Notes | modification is about 9ft of wire removed (unwound) from the coil to lower inductance |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Handheld Writer (Zonsin ZX-08CD) w/LCD |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Dimensions | rectangle, 33x24mm, 1.2x1.3mm cross section |  |  |  |  |  |  |  |  |  |  |  |
|  | Inductance | 206uH |  |  |  |  |  |  |  |  |  |  |  |
|  | Resistance | 6 ohms |  |  |  |  |  |  |  |  |  |  |  |
|  | Notes | from a 'good', 'genuine' Zonsin "Invincible King" |  |  |  |  |  |  |  |  |  |  |  |