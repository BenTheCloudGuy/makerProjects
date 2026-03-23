# Astromech Droid Hardware

> **THIS IS A WORK IN PROGRESS**

## YouTube Videos

- [BB Head LED Mod](https://www.youtube.com/watch?v=A0AJl5ipgx0)
- [How To Reset and Pair](https://www.youtube.com/watch?v=gKocbzvLSUg)
- [Low Battery Shutdown Circuit Mod](https://www.youtube.com/watch?v=KCyAfx2cFCk)
- [Battery Status](https://www.youtube.com/watch?v=-CkDXRUWeeM)

## BB Droid Current Draw

| State | Current |
|---|---|
| Idle | 13mA |
| Making Sound | 50mA |
| Moving / Motors | 1A |
| Sleeping | <20uA |

## BB-Series PCB

### BB-Series Audio Controller (GeneralPlus GPCD6TP270A or GPCD9TP340A)

| Pin | Net | Purpose |
|---|---|---|
| IOD0 | SPI_SI | Personality Chip - Serial In |
| IOD1 | SPI_SO | Personality Chip - Serial Out |
| IOD2 | SPI_SCK | Personality Chip - Serial Clock |
| IOD3 | SPI_CS | Personality Chip - Chip Select |
| IOD4 | SPI_DET | Detect insertion of personality chip |
| IOD5 | HEAD_LED_A | Control LEDs in head |
| IOD6 | HEAD_LED_B | Control LEDs in head |
| IOC2 | GP_MCLK | Bluetooth Controller Serial Clock |
| IOC3 | GP_SCLK | GP Serial Clock |
| IOC4 | GP_MO | Bluetooth Controller Serial Data |
| IOC5 | GP_SO | GP Serial Data |
| IOC6 | GP_REQ | Bluetooth Controller Signal to GP |

> **Note:** Pinout naming is based on schematics by Siddacious. The IOC pins are suspected to actually be IOA with incremented numbers, because the GPCD9TP datasheet states IOA1 = SDA and IOA2 = SCK for programming. IOD names are likely correct since the IOD port is the only port to support SPI.

## R-Series PCB

*(R-Series PCB images)*

## BD-Unit PCB

### BD Units Audio Controller (U4A) Pinout

| Pin | Connection |
|---|---|
| 1 | VPP |
| 2 | VCC_33 |
| 3 | GND |
| 4 | VCC |
| 5 | MM_RESET (controlled by nRF.6 via Q8) |
| 6 | ?? V3.3 DET |
| 7 | nRF.5 (nRF is the BLE controller; pins 7-11 are used for communication between audio and BLE controllers) |
| 8 | nRF.4 |
| 9 | nRF.3 |
| 10 | nRF.2 |
| 11 | nRF.1 |
| 12 | VCC_33, C14 |
| 13 | GND |
| 14 | LED1-G (LEDn are the 4 LEDs on the back of the head) |
| 15 | LED1-R |
| 16 | LED2-B |
| 17 | LED2-G |
| 18 | LED0-B |
| 19 | LED0-G, SDA |
| 20 | LED0-R, SCK |
| 21 | LED1-B |
| 22 | VCC_33 |
| 23 | GND |
| 24 | ?? SICS |
| 25 | R-EYE LED |
| 26 | L-EYE LED |
| 27 | LED2-R |
| 28 | LED3-B |
| 29 | LED3-G |
| 30 | LED3-R |
| 31 | GND |
| 32 | SPK- |
| 33 | LED+, VCC |
| 34 | SPK+ |
| 35 | GND |
| 36 | GND |

## SW (Serial Wire Debug) Port

> *"SW" technically stands for "Serial Wire debug" (not Star Wars!)*

The serial wire debug port is an interface that can be used to program and debug the NRF51822 microcontroller.

### BB-Series SW Port Pinout (left to right)

| Pin | Signal |
|---|---|
| 1 | GND |
| 2 | SWCLK |
| 3 | SWDIO |
| 4 | VCC |

### R-Series SW Port Pinout (left to right)

| Pin | Signal |
|---|---|
| 1 | VCC |
| 2 | SWDIO |
| 3 | SWCLK |
| 4 | GND |

## R-Series Accessory Port

R-Series droids include an accessory port on each leg. A blaster or thruster accessory can be installed into either leg. The connector is a DuPont-style 3-pin, 2.54mm pitch, female header.

| Label | Purpose |
|---|---|
| DET | A resistor between DET and GND identifies the presence and type of accessory. 4.7k = thruster, 10k = blaster. |
| GND | Ground |
| LED | An LED placed between LED and GND will light up in sync with audio played while the accessory is active. |

> **Note:** Tests show only thruster or blaster accessories are identified through this port. Resistor values from 100 ohms to 10M ohms were tried; no unknown/unused accessories were found.

## R-Series Leg Attachment Joint

This is the joint the leg plugs into. It has 5 pins: 3 go to the accessory port, 2 drive the motor.

### Pinout from the LEG perspective:

```
LED+  M+
 *   *
GND     M-
 * DET  *
    *
```

### Pinout from the BODY perspective (horizontally flipped):

```
M+  LED+
 *   *
M-     GND
 * DET  *
    *
```

## Schematics

Schematics for the droid PCBs have been reverse engineered by Siddacious and Russ. Download them from Siddacious' GitHub: <https://github.com/siddacious/SA-45>

> **Note:** There may be errors in these schematics. Without access to official schematics, these were created by documenting every trace and component on the PCBs - a ridiculously tedious process. The work of Russ and Siddacious is greatly appreciated.

## Tilt-Switch Wake-up Mod

For a demonstration and explanation: <https://www.youtube.com/watch?v=iu8T0AD-TIE>

> **NOTICE: This mod WILL NOT WORK with droids assembled after April 2024!**

Galaxy's Edge droids go to sleep after 5 minutes of inactivity. To wake the droid, the power switch must be cycled off then on. For BB droids especially, this is cumbersome.

This mod uses a ball/tilt switch to reset the microcontroller, allowing the droid to be woken by briefly tipping it upside down.

### Parts Needed

A ball or tilt switch such as an **SW-520D** (available on Amazon, eBay, AliExpress, etc.)

### Installation

1. Connect one pin of the tilt switch to **GND** and the other to the **SWDIO** pin of the NRF51822
2. Use the "SW Port" on the control board for easy access to both SWDIO and GND
3. Insert the switch leads only a few millimeters into the holes before soldering
4. Bend the leads to orient the switch so the **end with leads faces UP** when the droid is upright
5. On BB droids, bend the switch over towards the microcontroller so the body is parallel with the PCB
