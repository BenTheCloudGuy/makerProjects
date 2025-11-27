# PROXMARK 3 (RFID)

## Setup Proxmark 3 on Windows (WSL)

### USB Passthrough to WSL for Proxmark

- Run Powershell Admin and run ``usbipd list``. You should see USB Serial Device (COM#).. Mine below is already configured for sharing.

  ```powershell
  ┏[bemitchell]
  ┖[~]> usbipd list
  Connected:
  BUSID  VID:PID    DEVICE                                                        STATE
  2-2    045e:0c1e  Surface Camera Front, Surface IR Camera Front                 Not shared
  2-5    9ac4:4b8f  USB Serial Device (COM4)                                      Shared
  2-6    28bd:092f  USB Input Device                                              Not shared
  2-10   8087:0029  Intel(R) Wireless Bluetooth(R)                                Not shared
  4-1    045e:09a0  Surface Ethernet Adapter                                      Not shared
  5-5    045e:09ac  USB Input Device                                              Not shared
  6-5    045e:09a8  Surface Dock 2 Audio, USB Input Device                        Not shared
  7-4    043e:9a39  USB Input Device                                              Not shared
  9-1    0c46:64ab  USB Live camera, USB Live camera audio                        Not shared
  9-2    046d:c52b  Logitech USB Input Device, USB Input Device                   Not shared

  Persisted:
  GUID                                  DEVICE
  20806872-28c2-40b2-b525-f6313dc7ae3c  USB Serial Device (COM3)
  ```
- If it is not already shared - then you'll need to bind it using ``usbipd bind --busid #-#``(you can use short hand -b vs --busid)

  ```powershell
  ┏[bemitchell]
  ┖[~]> usbipd bind -b 2-5
  usbipd: info: Device with busid '2-5' was already shared.
  ```
- Once the Proxmark's binding is done. You need to attach it to WSL2 terminal.

  ```powershell
  ┏[bemitchell]
  ┖[~]> usbipd attach --auto-attach -b 2-5 --wsl
  usbipd: info: Using WSL distribution 'Ubuntu' to attach; the device will be available in all WSL 2 distributions.
  usbipd: info: Detected networking mode 'nat'.
  usbipd: info: Using IP address 172.17.0.1 to reach the host.
  usbipd: info: Starting endless attach loop; press Ctrl+C to quit.
  WSL Monitoring host 172.17.0.1 for BUSID: 2-5
  WSL 2025-05-31 10:24:54 Device 2-5 is available. Attempting to attach...
  WSL 2025-05-31 10:24:54 Attach command for device 2-5 succeeded.
  WSL 2025-05-31 10:25:02 Device 2-5 is now attached.
  ```

### Setup PM3 in WSL2

- Clone down PM3 from GitHub
- Install/Configure (pending)
- Validate Install/Setup using ``pm3-flash-fullimage``

TO-DO - document these steps for my own setup process. Provided docs on GitHub were not complete and had to dig around to find completed instructions.

### Running PM3 from WSL2

- From within the proxmark3 repo ``/home/benthebuilder/proxmark3``. type ``pm3``.
  ```bash
  10:49:29 benthebuilder@DESKTOP-SSAPT7D proxmark3 ±|master|→ pm3
  [=] Session log /home/benthebuilder/.proxmark3/logs/log_20250531144930.txt
  [+] loaded `/home/benthebuilder/.proxmark3/preferences.json`
  [+] Using UART port /dev/ttyACM0
  [+] Communicating with PM3 over USB-CDC


    8888888b.  888b     d888  .d8888b.   
    888   Y88b 8888b   d8888 d88P  Y88b  
    888    888 88888b.d88888      .d88P  
    888   d88P 888Y88888P888     8888"  
    8888888P"  888 Y888P 888      "Y8b.  
    888        888  Y8P  888 888    888  
    888        888   "   888 Y88b  d88P 
    888        888       888  "Y8888P"    [ ☕ ]



    [ Sponsor innovation, build tomorrow! ]
       Patreon - https://www.patreon.com/iceman1001/


    [ Proxmark3 RFID instrument ]

      MCU....... AT91SAM7S512 Rev A
      Memory.... 512 KB ( 66% used )

      Client.... Iceman/master/4c74704aa 2025-03-27 20:27:22
      Bootrom... Iceman/master/4c74704aa-suspect 2025-03-28 20:23:56 
      OS........ Iceman/master/4c74704aa-suspect 2025-03-28 20:24:01
      Target.... PM3 GENERIC


  [usb] pm3 --> 
  ```

## Scanning RFID Devices

```bash
hf search

```

## Notes

Blue Keychain RFID Tags - ``ISO 14443-A tag``.

| TagId | UID         | Notes             |
| :---: | ----------- | ----------------- |
|   1   | 13 33 93 0D | MIFARE Classic 1K |
|   2   | 7A B7 AF D5 | MIFARE Classic 1K |
|   3   | EE DF 5D 63 | MIFARE Classic 1K |
|   4   | 1B 06 BC 1B | MIFARE Classic 1K |
|   5   | 2E F2 E1 62 | MIFARE Classic 1K |
|   6   | 9F A2 DC 6C | MIFARE Classic 1K |

Key Cards

| TagId |      NAME      | Secret Identity | RGB (Color) |     UID     |       Notes       |
| :---: | :-------------: | :-------------: | :---------: | :---------: | :---------------: |
|  A1  |   Tony Stark   |     Ironman     |  255,69,0  | EA AB 51 6B | MIFARE Classic 1K |
|  A2  |  Thor Odinson  |      Thor      | 192,192,192 | 64 8A 01 A6 | MIFARE Classic 1K |
|  A3  |  Bruce Banner  |      Hulk      |  34,139,34  | 44 F9 30 A6 | MIFARE Classic 1K |
|  A4  |  Clint Barton  |     Hawkeye     | 102,51,153 | A9 CD 17 2A | MIFARE Classic 1K |
|  A5  |  Peter Parker  |    Spiderman    |   255,0,0   | D3 DB 3D F6 | MIFARE Classic 1K |
|  B1  | Stephen Strange |   Dr. Strange   |   0,0,139   | 44 C5 2C A6 | MIFARE Classic 1K |
|      |                |                |            |            |                  |

Kyber Crystals (Low Freq) - ``EM410x ( RF/64 )``

| Color/Id | TagId                  | Unique TAG ID | DEZ 8    |
| -------- | ---------------------- | ------------- | -------- |
| Green    | EM 410x ID 1111000C03 | 88880030C0    | 00003075 |
| Red      | EM 410x ID 0000000C07 | 00000030E0    | 00003079 |

## Kyber Crystals

Link: [Galaxy&#39;s Edge Research - Google Sheets](https://docs.google.com/spreadsheets/d/13P_GE6tNYpGvoVUTEQvA3SQzMqpZ-SoiWaTNoJoTV9Q/edit?gid=1434754068#gid=1434754068)

To scan the Kyber Crystal use ``lf search`` (must be held correctly to scan properly)

```bash

[usb] pm3 --> lf search

[=] Note: False Positives ARE possible
[=] 
[=] Checking for known tags...
[=] 
[+] EM 410x ID 1111000C03
[+] EM410x ( RF/64 )
[=] -------- Possible de-scramble patterns ---------
[+] Unique TAG ID      : 88880030C0
[=] HoneyWell IdentKey
[+]     DEZ 8          : 00003075
[+]     DEZ 10         : 0285215747
[+]     DEZ 5.5        : 04352.03075
[+]     DEZ 3.5A       : 017.03075
[+]     DEZ 3.5B       : 017.03075
[+]     DEZ 3.5C       : 000.03075
[+]     DEZ 14/IK2     : 00073299659779
[+]     DEZ 15/IK3     : 000586397266112
[+]     DEZ 20/ZK      : 08080808000003001200
[=] 
[+] Other              : 03075_000_00003075
[+] Pattern Paxton     : 286542339 [0x11144A03]
[+] Pattern 1          : 612 [0x264]
[+] Pattern Sebury     : 3075 0 3075  [0xC03 0x0 0xC03]
[+] VD / ID            : 017 / 0285215747
[+] Pattern ELECTRA    : 4369 3075
[=] ------------------------------------------------

[+] Valid EM410x ID found!

[=] Couldn't identify a chipset
[usb] pm3 --> lf em 

help             This help
410x             { EM 4102 commands... }
4x05             { EM 4205 / 4305 / 4369 / 4469 commands... }
4x50             { EM 4350 / 4450 commands... }
4x70             { EM 4070 / 4170 commands... }

```
