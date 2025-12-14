# Astromech Droid Controller

| Astromech Droid Controller |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| The stock droid controller is driven by a Nordic Semiconductor nRF31512 and thought to use a protocol unique to Nordic Semiconductor called "Enhanced Shock Burst" (ESB) to control droids. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| However the droids also have a Bluetooth interface that can be used to control them, such as the official droid controller app from Disney. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| This page will attempt to document both the stock controller hardware and the Bluetooth interface to control droids. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Droid Controller Apps |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Official Droid Depot app on Google Play |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Official Droid Depot app on Apple's Store |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Droid Controller App by Jamie Adkins on Google Play |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Droid Depot Control by BAP (requires a web browser that supports Web Bluetooth) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| C4-DDU by TitaNets |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Bluetooth Commands |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Droids can be controlled by sending commands via bluetooth low energy services. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Connections can be made through various methods, from arduino to web bluetooth to command line tools. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| For a programatic see Droid Toolbox, an arduino sketch using an ESP32-based device to connect to and control a droid. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| For a command-line example, please see the "using hcitool and gatttool" section later in this spreadsheet. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Droid Remote Must Be Off |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| In order to connect to the droid the droid's remote must be off, otherwise the connection will fail. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Service and Characteristics |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The service and characteristics are used to communicate with the droid. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | Value Handle | UUID |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Droid Service |  | 09b600a0-3e42-41fc-b474-e9c0c8f0c801 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Command Characteristic | 0x000e | 09b600b1-3e42-41fc-b474-e9c0c8f0c801 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Notify Characteristic | 0x000b | 09b600b0-3e42-41fc-b474-e9c0c8f0c801 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Login Command: 0x222001 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Upon connecting, the following command must be sent twice to the command characteristic: 0x222001 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| These two commands must be sent within a short amount of time after connection or the client will be disconnected from the droid. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| If listening on the notify characteristic a string of bytes will be returned with each login command. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| This data seems to always be the same regardless of droid type or installed personality chip. The data returned is as follows: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 2F 32 81 45 4B 10 01 44 44 11 11 01 00 00 00 00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The meaning of the data is not currently understood, but it is hard-coded into the droid's firmware and is not generated on-the-fly. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Perhaps droid firmware version? |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Command Structure |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Once connected you can send commands to the droid via the command characteristic. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Commands can vary in length. The first four bytes describe the command to execute and the length of the data: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Data length can never be more than 0x1f (31) bytes long |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | byte 1 | 0x1f + total bytes in the command |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | byte 2 | 0x42 if command id is 0x0f, otherwise 0x00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | byte 3 | command id |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | byte 4 | data length + 0x40 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | byte 5 ... byte n | command data |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Command ID |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The command ID identifies the command being sent to the droid's bluetooth controller (an nRF 51822). |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The bluetooth controller handles motor functions and the pairing LED. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The audio controller is a separate device inside the droid and handles sound and LEDs. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The bluetooth controller has a communication channel that it uses to send commands to the audio controller. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Command ID | Purpose |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x01 | return the ID of the robot/firmware in a GATT notify event |  |  |  |  |  |  | The gaps in this list are command IDs that do nothing |  |  |  |  |  |  |  |  |  |
|  | 0x02 | set the pairing LED on/off |  |  |  |  |  |  | This is confirmed looking at the firmware |  |  |  |  |  |  |  |  |  |
|  | 0x03 | set RGB LED on/off; there are no RGB LEDs, this command isn't useful to us, but here for completeness |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x04 | flash pairing LED | the pairing LED is part of the bluetooth stuff, thus is controlled by the nRF chip |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  | this is the ONLY LED controlled directly by the nRF chip |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x05 | control motor speed |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x06 | script command; used to write data to the currently open script |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x0c | script command; used to execute pre-programmed scripts |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x0d | delay; used in command scripts |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x0f | multi-purpose: sent command to audio controller or control motors |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | Byte 6 Value | Purpose |  | Example |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | 0.0 | command audio controller |  | 27 42 0f 44 44 00 CC PP |  |  | CC = command, PP = parameter |  |  |  |  |  |  |  |  |  |  |
|  |  | 1.0 | center R2 head |  | 27 42 0f 44 44 01 XX YY |  |  | XX = speed, if YY == 0 then stop at center, otherwise continue the head turn past center; only works on R-Seriess |  |  |  |  |  |  |  |  |  |  |
|  |  | 2.0 | rotate R2 head |  | 2B 42 0f 48 44 02 XX YY AA AA BB BB |  |  | XX = direction (00 = right, FF = left), YY = speed, AAAA = motor ramp-up time, BBBB = delay after command is executed |  |  |  |  |  |  |  |  |  |  |
|  |  | 3.0 | rotate R2 head |  | 27 42 0f 44 44 03 XX YY |  |  | XX = direction (00 = right, FF = left), YY = delay after command is executed |  |  |  |  |  |  |  |  |  |  |
|  |  | 4.0 | rotate BB |  | 2B 42 0f 48 44 04 XX YY AA AA BB BB |  |  | XX = direction (00 = right, FF = left), YY = speed, AAAA = motor ramp-up time, BBBB = delay after command is executed |  |  |  |  |  |  |  |  |  |  |
|  |  | 5.0 | drive BB |  | 2B 42 0f 48 44 05 XX YY AA AA BB BB |  |  | XX = direction, YY = speed (if LSB of direction is 0), AAAA = motor ramp-up time, BBBB = delay after command is executed |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  | * times are in milliseconds; a value of 03E8 would be 1 second |  |  |  |  |  |  |  |  |  |  |
| Audio Controller Commands |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1-byte commands can be sent to the audio controller using the command id 0x0f. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The format of such a command is: |  | 27 42 0f 44 44 00 CC PP |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Where CC = the 1-byte command and PP is the 1-byte parameter passed to the command. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Known Audio Controller Commands |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Command | Values | Purpose |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x01 * |  | return droid type |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x08 * |  | return personality chip |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x0a * |  | return affiliation |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x0e | 0x00 - 0x0f | set volume, usable values seem to be 0x00 - 0x1f |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x0f |  | ?? (serial hold) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x10 | 0x00 - 0x0B | play audio clip from group specified by value, clips are played in order |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x11 | 0x00 - 0x0B | play audio clip from group specified by value, clips are played in order, LEDs do not activate while audio plays |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x18 | 0x00 - 0xff | play audio clip from currently selected sound group (set by command 0x1f) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x1c | n/a | play all audio clips from all groups in order |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x1f | 0x00 - 0x0B | set sound group |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x21 |  | ?? audio loop |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x42 * |  | ?? (used during droid initialization) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x44 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x45 |  | ?? LED flash |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x48 | LED identifier | set LEDs on |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x49 | LED identifier | set LEDs off |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x4a | LED identifier | disable head LEDs |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x4b | LED identifier | enable head LEDs |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x5n | 0x00-0x1f | Set the display pattern of the LED (blink, fade, off, on); n represents the LED being controlled |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x6n | 0x00-0xff | Set the number of times the LED pattern is repeated; 00 is continuous repeat; n represents the LED being controlled |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x7n |  | ?? |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x8n |  | Set the brightness of the LED; n represents the LED being controlled |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x9n |  | Set the speed of the pattern; n represents the LED being controlled |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0xAn - 0xFn |  | Set the speed for all LEDs; value of 'n' does not seem to matter |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | * these commands are used internally, but the returned values are not accessible via bluetooth (as far as I know...) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | LED identifier |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Value | R-Series | BB-Series | BD Units |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x00 |  |  | LED0, blue |  | If looking at the back of BD's head, LED0 is the LED farthest right and LED3 is the LED farthest left. |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x01 | Left Head LED | Head LEDs | LED0, green |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x02 | Middle Head LED |  | LED0, red |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x03 |  |  | LED1, blue |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x04 | Right Head LED |  | LED1, green |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x05 |  |  | LED1, red |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x06 |  |  | LED2, blue |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x07 |  |  | LED2, green |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x08 | Left Accessory |  | LED2, red |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x09 |  |  | LED3, blue |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x0A |  |  | LED3, green |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x0B |  |  | LED3, blue |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x0C |  |  | left eye |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x0D |  |  | right eye |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x0E |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x0F |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0x10 | Right Accessory |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Pre-Programmed Scripts |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Droids contain scripted actions that can be executed  via command ID 0x0c |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The 0x0c command accepts a 1 byte parameter which is used to identify the pre-programmed script to execute. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Uncertain if these should be called "scripts"; they just rotate the head while an audio file plays from the specified audio group |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  | II to Audio Group Translation Table |  |  |  |  |  |  |  |  |  |
| Command Format: | 25 00 0C 42 II AA |  |  |  |  |  |  |  | R | BB | Audio Group |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  | 01 | 0C | 1 |  |  |  |  |  |  |  |
|  | II (Index) | Purpose |  |  |  |  |  |  | 02 | 0D | 2 |  |  |  |  |  |  |  |
|  | 0x01 - 0x08 | R-Series scripted actions |  |  |  |  |  |  | 03 | 0B | 3 |  |  |  |  |  |  |  |
|  | 0x09 - 0x10 | BB unit scripted actions; can be used by R-Seriess, but will cause them to spin rapidly in place. |  |  |  |  |  |  | 04 | 0A | 4 |  |  |  |  |  |  |  |
|  | 0x11 - 0x12 | Delay followed by pairing noise |  |  |  |  |  |  | 05 | 09 | 5 |  |  |  |  |  |  |  |
|  | 0x13 | WARNING! Will leave motors running, must cycle power to stop motors. |  |  |  |  |  |  | 06 | 0F | 6 |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  | 07 | 0E | 7 |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  | 08 | 10 | 8 (Activation Noise) |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | AA (Action) | Purpose |  |  |  |  |  |  | Example of creating a script to drive a BB unit forward then backwards |  |  |  |  |  |  |  |  |  |
|  | 00 | Closes any currently open script and open the one identified by II (II must be 0x14 or greater) |  |  |  |  |  |  | 25000C421400                # open script 0x14 for writing |  |  |  |  |  |  |  |  |  |
|  | 01 | Closes any currently open script. |  |  |  |  |  |  | 2B420f48440500FF01F403E8    # move forward for 1 second, spending 500ms ramping up to full speed |  |  |  |  |  |  |  |  |  |
|  | 02 | Execute command specified by II |  |  |  |  |  |  | 2B420f484405F0FF03E807D0    # move backwards for 2 seconds, taking 1 second to ramp up to full speed |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  | 2B420f484405000000000000    # stop moving |  |  |  |  |  |  |  |  |  |
| Motor Control |  |  |  |  |  |  |  |  | 25000C421401                # close script 0x14 |  |  |  |  |  |  |  |  |  |
| Motors in the droid can be commanded via bluetooth via the 0x05 command id. |  |  |  |  |  |  |  |  | 25000C421402                # execute script 0x14 |  |  |  |  |  |  |  |  |  |
| The format for this command is as follows: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Command Format: | 27 00 05 44 DM SS RR RR |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 29 42 05 46 DM SS RR RR 00 00 |  |  | note: don't know why this format is used, but have seen it used by the Droid Depot app |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Where: | D = direction of motor (0=forward or left, 8=backwards or right) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | M = identifies motor to power (0=left, 1=right, 2=head) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | SS = motor speed; high nibble seems to be the real value; a minimum value of 0x60 needed to get motor to move; 0xA0 seems to be a common value used by the app |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | RRRR = two byte value that sets the time (in milliseconds?) it takes the motor to ramps up to full speed; 0x012C seems to be a common value used by the app |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| !! WARNING !! | Motors, when turned on, will NOT stop until a command is sent to stop them or you power the droid off. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | BE READY to stop your droid! |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| R-Series heads are the exception to this. They are capable of knowing they've turned as far in one direction as possible and stop. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Example Commands |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Below are several example commands to help show how commands are structured and used. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Commands are shown in hexidecimal format. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Pairing LED Control |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | Turn the pairing LED on: | 25 00 02 42 00 ff |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | Turn the pairing LED off: | 25 00 02 42 00 00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | Blink the pairing LED 10 times: | 2C 00 04 49 02 00 01 ff 01 ff 0a ff 00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Head LED Control |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | turn on specific LEDs | 27 42 0f 44 44 00 48 1f |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | turn off specific LEDs | 27 42 0f 44 44 00 49 00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | disable head LEDs reacting to sounds | 27 42 0f 44 44 00 4a 00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | enable head LEDs reacting to sounds | 27 42 0f 44 44 00 4b 1f |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Sound Control |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | set volume | 27 42 0f 44 44 00 0e 1f |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | play a clip from specified audio group | 27 42 0f 44 44 00 10 00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | play a clip from specified audio group, no LEDs | 27 42 0f 44 44 00 11 00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | play first sound from currently selected audio group | 27 42 0f 44 44 00 18 00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | play next sound clip; cycle through groups 1-7 | 26 42 0f 43 44 00 1c |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | select audio group 1 | 27 42 0f 44 44 00 1f 00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Pre-Programmed Script |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | Execute script 0x01 (R-Series) | 25 00 0c 42 01 02 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | Execute script 0x10 (BB-Series) | 25 00 0c 42 10 02 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Motor Control |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | rotate head left | 29 42 05 46 02 a0 01 2c 00 00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | rotate head right | 29 42 05 46 82 a0 01 2c 00 00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | stop head rotation | 29 42 05 46 02 00 01 2c 00 00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | center head * | 27 42 0f 44 44 01 ff 00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | * head centering command only works on R-Series droids |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Using hcitool and gatttool To Control Your Droid |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| hcitool and gatttool are utilities found on Linux systems (including Raspberry Pi OS) which can be used to send commands to your droid over bluetooth from a computer. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Below is an example to get you started. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Check out BAP's great article on working out the protocol used below here: Controlling Disney’s Droids from Droid Depot with WebBluetooth |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Step 1: Turn on your droid, NOT your droid controller |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Once your controller connects to the droid after it's turned on, you won't be able to send commands to it. So leave it off otherwise these next steps won't work. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Step 2: Find your droid's Bluetooth address |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Use the hcitool utility to scan for nearby bluetooth devices. Your droid, once powered on, will be included in this list and will have the name 'DROID'. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | sudo hcitool lescan | grep -i droid |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Note the address in the output of the hcitool utility. This is your droid's address and you'll need it in the next step |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Step 3: Start gatttool in interactive mode |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Use the gatttool utility to connect to your droid with the bluetooth address you identified in the previous step. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | The first command will start gatttool in interactive mode, but it will not make a connection to the droid, you will have to issue a 'connect' command later. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | sudo gatttool -t random -i hci0 -b XX:XX:XX:XX:XX:XX -I |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | where 'XX:XX:XX:XX:XX:XX' is the bluetooth address of your droid |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Step 4: Connect to the droid |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Next connect to the droid by entering the 'connect command |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | > connect |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | A few seconds after issuing the connect command you will likely see an error and be told you're disconnected. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | This is because you have a few seconds to establish the connection before the droid will disconnect you. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | In order to establish the connection, a special command must be sent, twice. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Enter the connect command again, quickly followed up by the following commands. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | > char-write-cmd 0x000e 222001 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | > char-write-cmd 0x000e 222001 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | You will need to have this command pasted onto your clipboard so you can paste it and execute it twice (as shown above) as quickly as possible. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | If you are not disconnected after a few seconds then you have established the connection to your droid. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Step 5: Make the droid do something |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Commands are sent to the droid in the same format as shown above except the last value will change depending on the command. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | To make the droid play a sound you need to send it two commands. The first command tells the droid which sound bank to play a sound from. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | > char-write-cmd 0x000e 27420f4444001f00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | The last byte of this command controls which sound bank is being selected. In this example, the first sound bank (bank 0) is specified with the last byte. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | There are 12 sound banks and every bank, except the 10th, will have at least one sound it in. NOTE: BB droids without a personality chip will have no sounds beyond bank 8. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | The second command tells the droid which sound within the bank to play. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | > char-write-cmd 0x000e 27420f4444001800 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | The last byte of the command tells the droid which sound to play within that bank. In the example above, the first sound (sound 0) will be played. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Step 6: Experiment CAREFULLY |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | BAP has written an article documentation droid motor movement. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | The article includes information on the commands needed to control the motors. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | BE AWARE that if you tell the droid to move forward, for example, at full speed, IT WILL NOT STOP UNTIL YOU TELL IT TO STOP. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | You risk damaging your droid's motors if you let it spin at max speed for anything more than tens of seconds. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Be ready to power off your droid in the event you find yourself unable to stop the droid's motors. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Stock Droid Controller Hardware |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The heart of the controller is a Nordic Semiconductor nRF31512C in a QFN32 package. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| I have not been able to locate a datasheet for this specific chip, however there are several other nRF chips with accessible datasheets. Using them as a guideline I'm trying to construct the pinout of the chip. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| A similar chip is used in Disney's Magic Bands. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| nRF31512C Pinout |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| PIN | PIN Name | PCB Contact | Test Point | Connected To |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1 | DEC1 |  |  | C81 to BAT- |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 2 | DEC2 |  |  | C82 to BAT- |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 3 | P1.1 | P1.1 | 9 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 4 | P0.0 | P0.0 |  | SFC Button |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 5 | P0.1 | P0.1 |  | SFX Button |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 6 | P0.2 | P0.2 |  | HR Button |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 7 | P0.3 | P0.3 | 4 | HL Button |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 8 |  | Gnd | 1 | BAT- |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 9 |  | Gnd | 1 | BAT- |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 10 |  | V | 2 | BAT+ |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 11 |  | Gnd | 1 | BAT- |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 12 | P0.4 | P0.4 | 5 | FW Button |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 13 | P0.5 | P0.5 | 6 | BW Button |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 14 | P0.6 | P0.6 | 7 | TL Button |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 15 | P0.7 | P0.7 |  | TR Button |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 16 | P1.0 | P1.0 | 8 | Transmit (Red) LED |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 17 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 18 | PROG/VPP | PR | 3 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 19 |  | Gnd | 1 | BAT- |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 20 | VDD_PA |  |  | Antenna |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 21 | ANT1 |  |  | Antenna |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 22 | ANT2 |  |  | Antenna |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 23 | VSS | Gnd | 1 | BAT- |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 24 | VDD | V | 2 | BAT+ |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 25 | IREF |  |  | R101 (22k) to BAT- |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 26 |  | Gnd | 1 | BAT- |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 27 | RESET | Re | 10 | D11 to Bat+ |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 28 | VDD | V | 2 | Bat+ |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 29 | XC2 |  |  | Xtal (16MHz) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 30 | XC1 |  |  | Xtal (16MHz) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 31 | VSS | Gnd | 1 | BAT- |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 32 | VSS | Gnd | 1 | BAT- |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| It's A Secret To Everybody |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Most of the following information comes from decompiling and reverse engineering the firmware of the bluetooth microcontroller (nrf51822) in the droid. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Neither the dumped firmware ROM or the reverse engineered code is publically available. It's likely protected by copyright law. Don't go asking for it. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| However you could always dump the firmware yourself. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Both droid types have an unpopulated serial wire debug port. This is the same port used in the tilt switch mod. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| SWD allows access to debug the bluetooth microcontroller. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The following articles discuss how to connect a debugger to the microcontroller via SWD and dump the firmware: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| https://blog.includesecurity.com/2015/11/firmware-dumping-technique-for-an-arm-cortex-m0-soc/ |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| https://www.pentestpartners.com/security-blog/nrf51822-code-readout-protection-bypass-a-how-to/ |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| You'll need a debugger of some kind to connect to the SWD port; there are many options, look at OpenOCD's supported hardware page: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| http://openocd.org/doc/html/Debug-Adapter-Hardware.html |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Python scripts to help automate the dumping process, using OpenOCD, are available here: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| https://github.com/siddacious/SA-45/tree/master/nrf_extract |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Once the dumped firmware is obtained, there are several available tools to convert it into assembly or even higher level languages. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Probably the best tool for this job is Ghidra: https://ghidra-sre.org/ |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Ghidra has a learning curve, but it is very much worth the time invested into learning it. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Accessories |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Confirmed in decompiled firmware that R-Series droids only support TWO accessories. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Test Mode |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Droids have a test/debug mode. This appears to be used for debugging droids. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Not a lot of reserach has gone into using droid test mode. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| To Enter Test Mode: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 1. turn off droid |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 2. hold down pairing button |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 3. turn droid on |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 4. hold button for more than 2 seconds, less than 10 seconds |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 5. release |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 6. press 3 times within 3 seconds |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 7. wait until 3 seconds is up |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| To Exit Test Mode: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | turn off droid |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | turn on droid |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| What Does Test Mode Do? |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| no clue. mindless notes while playing with test mode follow |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | writes the value 0x775ea52b to the DEADBEEF location (user filesystem, i think...) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | if R-Series |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | head movement tests |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | play sound from bank 6 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | if BB-Series |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  | play sound from bank 7 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Loop: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | move (?) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | play sound |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | detects changes in personality chips |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | handle BLE operations (?? can it be paired with a remote? does it respond to a remote?) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Preprogrammed Scripts |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Script Index | Data |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1 | 01 57 00 01 0F 44 44 01 A0 01 0F 44 44 00 10 04 0F 44 44 03 00 14 0F 48 44 02 00 82 00 28 01 4A 0F 48 44 02 00 00 00 28 00 28 0F 44 44 03 80 14 0F 48 44 02 80 82 00 28 01 5E 0F 48 44 02 80 FF 00 28 01 2C 0F 48 44 02 00 FF 00 50 02 6C 0F 44 44 01 FF 01 05 44 02 00 00 28 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 2 | 01 6B 00 02 0F 44 44 01 A0 01 0F 44 44 00 10 03 0F 48 44 02 80 88 00 00 00 A0 0F 48 44 02 00 84 00 50 01 90 0F 48 44 02 80 84 00 50 01 90 0F 48 44 02 00 84 00 50 00 F0 0F 48 44 02 00 00 00 28 00 28 0F 44 44 03 80 14 0F 48 44 02 80 82 00 28 02 F8 0F 48 44 02 80 00 00 28 00 28 0F 44 44 03 00 14 0F 44 44 01 82 01 05 44 02 00 00 28 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 3 | 01 55 00 03 0F 44 44 01 A0 01 0F 44 44 00 10 02 0F 44 44 03 00 14 0F 48 44 02 00 82 00 04 02 26 0F 48 44 02 00 00 00 28 00 28 0D 42 01 2C 0F 44 44 03 80 14 0F 48 44 02 80 82 00 28 05 14 0F 48 44 02 80 00 00 28 00 28 0D 42 01 2C 0F 44 44 01 DC 01 05 44 02 00 00 14 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 4 | 01 57 00 04 0F 44 44 01 A0 01 0F 44 44 00 10 00 0F 44 44 03 00 14 0F 48 44 02 00 82 00 00 01 90 0F 48 44 02 80 DC 00 3C 03 20 0F 48 44 02 00 D2 00 3C 02 BC 0F 48 44 02 80 FA 00 3C 02 8A 0F 48 44 02 80 00 00 28 00 28 0F 44 44 03 00 14 0F 44 44 01 82 01 05 44 02 00 00 00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 5 | 01 57 00 05 0F 44 44 01 A0 01 0F 44 44 00 10 01 0F 44 44 03 00 14 0F 48 44 02 00 82 00 28 01 68 0F 48 44 02 80 E6 00 28 01 F4 0F 48 44 02 80 00 00 28 00 28 0F 48 44 02 00 E6 00 28 01 F4 0F 48 44 02 00 00 00 28 00 28 0F 44 44 03 80 14 0F 44 44 01 82 01 05 44 02 00 00 00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 6 | 01 8F 00 06 0F 44 44 01 A0 01 0F 44 44 00 10 06 0F 44 44 03 00 14 0F 48 44 02 00 82 00 28 01 90 0F 48 44 02 00 00 00 14 00 14 0D 42 01 0E 0F 44 44 03 80 14 0F 48 44 02 80 82 00 28 04 4C 0F 48 44 02 80 00 00 14 00 14 0D 42 01 0E 0F 44 44 03 00 14 0F 48 44 02 00 82 00 28 02 8A 0F 48 44 02 00 00 00 14 00 14 0F 44 44 03 80 14 0F 48 44 02 80 82 00 00 01 90 0F 48 44 02 80 00 00 14 00 14 0F 44 44 03 00 14 0F 44 44 01 82 01 05 44 02 00 00 00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 7 | 01 5B 00 07 0F 44 44 01 A0 01 0F 44 44 00 10 05 0F 44 44 03 00 14 0F 48 44 02 00 87 00 14 00 B4 0F 48 44 02 80 A0 00 28 01 90 0F 48 44 02 00 A0 00 28 01 90 0F 48 44 02 80 A0 00 28 01 AE 0F 48 44 02 00 A0 00 28 01 90 0F 44 44 03 80 14 0F 48 44 02 80 87 00 14 01 18 05 44 02 00 00 28 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 8 | 01 4D 00 08 0D 42 00 00 0F 44 44 03 00 14 0F 48 44 02 00 82 00 28 0B B8 0F 44 44 03 80 14 0F 48 44 02 80 82 00 00 13 88 0F 44 44 03 00 14 0F 48 44 02 00 82 00 00 13 88 0F 44 44 03 80 14 0F 44 44 01 82 01 05 44 02 00 00 00 0F 44 44 00 10 07 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 9 | 01 45 00 09 0F 44 44 00 10 04 0F 48 44 04 00 B4 00 C8 02 58 0F 48 44 04 80 B4 01 90 03 20 0F 48 44 04 00 B4 01 90 03 20 0F 48 44 04 80 B4 01 90 03 20 0F 48 44 04 00 B4 01 90 01 90 05 44 00 00 00 32 05 44 01 00 00 32 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 10 | 01 31 00 0A 0F 44 44 00 10 03 0F 48 44 04 00 B4 00 C8 01 2C 0F 48 44 04 80 B4 01 90 02 58 0F 48 44 04 00 8C 01 54 06 40 05 44 00 00 00 32 05 44 01 00 00 32 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 11 | 01 31 00 0B 0F 44 44 00 10 02 0F 48 44 04 00 B4 00 C8 01 90 0F 48 44 04 80 82 01 90 08 FC 0F 48 44 04 00 AA 01 90 02 BC 05 44 00 00 00 32 05 44 01 00 00 32 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 12 | 01 3B 00 0C 0F 44 44 00 10 00 0F 48 44 04 00 A0 00 A0 01 2C 0F 48 44 04 80 B4 01 90 02 58 0F 48 44 04 00 B4 01 90 02 58 0F 48 44 04 80 A0 01 90 02 58 05 44 00 00 00 32 05 44 01 00 00 32 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 13 | 01 3B 00 0D 0F 44 44 00 10 01 0F 48 44 04 00 6E 00 78 03 20 0F 48 44 04 80 78 00 F0 04 4C 0F 48 44 04 00 78 00 F0 04 4C 0F 48 44 04 80 6E 00 F0 03 20 05 44 00 00 00 32 05 44 01 00 00 32 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 14 | 01 31 00 0E 0F 44 44 00 10 06 0F 48 44 04 00 64 00 64 02 BC 0F 48 44 04 80 69 00 C8 03 E8 0F 48 44 04 00 64 00 C8 02 BC 05 44 00 00 00 00 05 44 01 00 00 00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 15 | 01 45 00 0F 0F 44 44 00 10 05 0F 48 44 04 00 A0 00 64 01 90 0F 48 44 04 80 BE 01 90 02 58 0F 48 44 04 00 BE 01 90 02 58 0F 48 44 04 80 BE 01 90 03 20 0F 48 44 04 00 B4 01 90 02 58 05 44 00 00 00 32 05 44 01 00 00 32 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 16 | 01 73 00 10 0D 42 00 00 0F 48 44 04 00 5A 00 28 03 20 05 44 00 00 00 50 05 44 01 00 00 50 0D 42 08 FC 0F 48 44 04 80 5A 00 28 05 14 05 44 00 00 00 50 05 44 01 00 00 50 0D 42 08 FC 0F 48 44 04 00 5A 00 28 05 14 05 44 00 00 00 50 05 44 01 00 00 50 0D 42 08 FC 0F 48 44 04 80 5A 00 28 09 C4 05 44 00 00 00 50 05 44 01 00 00 50 0D 42 05 78 0F 44 44 00 10 07 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 17 | 01 0B 00 11 0D 42 00 64 0F 44 44 00 10 07 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 18 | 01 0B 00 12 0D 42 07 D0 0F 44 44 00 10 07 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 19 | 01 2B 00 13 05 44 00 20 00 00 05 44 01 20 00 00 0F 48 44 05 01 DC 01 90 00 FA 0F 48 44 05 00 00 02 EE 00 FA 0F 48 44 05 01 DC 01 90 00 00 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| How to Decode |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Each script contains one or more commands. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Each command is read and executed one at a time in order. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| data[1] = length of the script |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| data[4] = start of first command |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| For each command: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| command[1] & 0x1f = command length (typically 4 or 8 bytes) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| command data after command length follows the command structure discussed previously on this page. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Example: Script #1 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Here is the script broken down into individual commands |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Command |  |  | Action |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0F 44 44 01 A0 01 |  |  | center head |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0F 44 44 00 10 04 |  |  | play audio clip from group 4 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0F 44 44 03 00 14 |  |  | start rotating R-Series head right |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0F 48 44 02 00 82 00 28 01 4A |  |  | speed up rotation |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0F 48 44 02 00 00 00 28 00 28 |  |  | stop rotation |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0F 44 44 03 80 14 |  |  | start rotating R-Series head left |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0F 48 44 02 80 82 00 28 01 5E |  |  | slow rotation |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0F 48 44 02 80 FF 00 28 01 2C |  |  | speed up rotation |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0F 48 44 02 00 FF 00 50 02 6C |  |  | stop rotation |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0F 44 44 01 FF 01 |  |  | center head |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 05 44 02 00 00 28 |  |  | stop head moving; this command is likely here to prevent issues where the head centering detection fails |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Example: Script #19 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| This script is known to leave motors running. Let's see if we can figure out why. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Command |  |  | Action |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 05 44 00 20 00 00 |  |  | slowly move left motor forward immediately |  |  | the speed value of 0x20 is probably not high enough to actually move the motors. |  |  |  |  |  |  |  |  |  |  |  |
|  | 05 44 01 20 00 00 |  |  | slowly move right motor forward immediately |  |  | perhaps these two commands equate to a "stop" command? |  |  |  |  |  |  |  |  |  |  |  |
|  | 0F 48 44 05 01 DC 01 90 00 FA |  |  | drive BB forward |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0F 48 44 05 00 00 02 EE 00 FA |  |  | stop |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 0F 48 44 05 01 DC 01 90 00 00 |  |  | drive BB forward |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | The last command is to drive forward, thus the motors never turn off. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | The firmware of the droids do not call this script, ever. It's probably something leftover from development. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Why does it use two different methods to the control the motor? Don't know. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |