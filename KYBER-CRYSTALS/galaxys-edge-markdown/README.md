# Galaxy's Edge RFID & Kyber Crystal Research Documentation

This folder contains comprehensive technical documentation about Star Wars: Galaxy's Edge technology, specifically focusing on kyber crystals, holocrons, lightsabers, and droid components. All information has been compiled from community research and reverse engineering efforts.

## Table of Contents

### General Information
- **[About](about.md)** - Project overview, community resources, and external links

### Kyber Crystals
- **[Kyber Crystals - Series 1](kyber-crystals-(series-1).md)** - Complete database of Series 1 crystals including RFID data, colors, voices, and configurations
- **[Kyber Crystals - Series 2](kyber-crystals-(series-2).md)** - Complete database of Series 2 crystals with new characters and configurations

### Holocrons
- **[Holocron Hardware](holocron-hardware.md)** - Component identification, ICs, pinouts, and PCB details
- **[Holocron IR Protocol](holocron-ir-protocol.md)** - Infrared communication protocol for holocron-to-holocron interaction
- **[Holocron Flash Memory Data Structure](holocron-flash-memory-data-stru.md)** - Memory layout and audio file organization
- **[Holocron Quotes](holcron-quotes.md)** - Complete listing of all audio clips and quotes from Jedi and Sith holocrons
- **[Sith Wayfinder Quotes](sith-wayfinder-quotes.md)** - Audio clips specific to the Sith Wayfinder device

### Lightsabers
- **[Savi's Workshop Chassis Hardware](savis-workshop-chassis-hardware.md)** - Electronics and components in Savi's Workshop lightsaber hilts
- **[Lightsaber Blade Hardware and Operations](lightsaber-blade-hardware-and-o.md)** - LED blade PCB design and operation modes
- **[Lightsaber Hilt & Blade Communications](lightsaber-hilt-&-blade-communi.md)** - Serial communication protocol between hilt and blade

### RFID Technology
- **[RFID Reader/Writer Hardware](rfid-readerwriter-hardware.md)** - RFID chips used in holocrons and analysis tools
- **[RFID Writer Signal Analysis](rfid-writer-signal-analysis.md)** - Using Proxmark3 to analyze and program kyber crystals

### Astromech Droids
- **[Astromech Personality Chip](astromech-personality-chip.md)** - Structure and data format of R-series and BB-series personality chips
- **[Astromech Droid Hardware](astromech-droid-hardware.md)** - Internal electronics and PCB layouts
- **[Astromech Droid Controller](astromech-droid-controller.md)** - Remote control specifications and operation
- **[Bluetooth Beacons](bluetooth-beacons.md)** - BLE beacon implementation and datapad app interaction

### Visual Resources
- **[Image Galleries](image-galleries.md)** - Links to teardown photos, PCB images, and component galleries
- **[Hardware](hardware.md)** - General hardware documentation and specifications

## Key Technologies

### RFID (Kyber Crystals)
Kyber crystals use **EM4305** RFID chips configured to emulate the EM4100 protocol. Each crystal has a unique Tag ID that determines:
- **Color** - Which color the lightsaber blade displays
- **Voice** - Which character speaks when inserted into a holocron
- **Location** - Which planet/location is revealed in the wayfinder

### Holocron Communication
Holocrons communicate with each other using **infrared (IR)** signals. When a Jedi holocron and Sith holocron are placed together, they trigger special audio sequences about balance in the Force.

### Lightsaber Protocol
Savi's Workshop lightsabers use a **UART serial protocol** (115200 baud) to communicate between the hilt electronics and the blade. Commands control:
- LED colors and brightness
- Animation modes and effects
- Power states

### Droid Personality Chips
Personality chips use **I²C EEPROM** technology and contain:
- Droid personality data
- Audio sound banks
- Behavior configurations
- Affiliation data (Resistance, First Order, Scoundrel, etc.)

## How to Use This Documentation

### For Makers
1. Start with **[About](about.md)** to understand the ecosystem and find community resources
2. Review **[Kyber Crystals Series 1](kyber-crystals-(series-1).md)** and **[Series 2](kyber-crystals-(series-2).md)** databases for Tag ID references
3. Read **[RFID Writer Signal Analysis](rfid-writer-signal-analysis.md)** for programming instructions
4. Check **[Image Galleries](image-galleries.md)** for visual references

### For Hardware Hackers
1. Review **[Holocron Hardware](holocron-hardware.md)** for component identification
2. Study **[Lightsaber Hilt & Blade Communications](lightsaber-hilt-&-blade-communi.md)** for protocol details
3. Analyze **[Astromech Droid Hardware](astromech-droid-hardware.md)** for PCB layouts
4. Reference **[Bluetooth Beacons](bluetooth-beacons.md)** for BLE implementation

### For Researchers
1. Read **[Holocron IR Protocol](holocron-ir-protocol.md)** for communication specs
2. Study **[Holocron Flash Memory Data Structure](holocron-flash-memory-data-stru.md)** for memory layout
3. Review **[RFID Reader/Writer Hardware](rfid-readerwriter-hardware.md)** for technical specifications
4. Explore **[Astromech Personality Chip](astromech-personality-chip.md)** for data structures

## Data Sources

This documentation is compiled from:
- Community reverse engineering efforts
- Hardware teardowns and analysis
- RFID tag dumps and analysis
- Protocol captures and analysis
- Audio file extraction
- PCB tracing and component identification

## Community

### Primary Resources
- **Discord**: The Galaxy's Edge Discord Server (#makerspace channel)
- **Web**: Dead Bothans Society, Galaxy's Edge Transcriptions
- **GitHub**: TitaNets, Ruthsarian, Siddacious repositories
- **Flickr**: Ruthsarian's photo galleries

### Contributing
If you discover new information, please share it with the community through:
- Discord discussions
- GitHub repositories
- Community documentation projects

## Important Notes

### RFID Programming
- **EM4305 tags** are the original chips used in official crystals
- **T5577 tags** can be configured to emulate EM4305 behavior
- Always use **12mm disc format** RFID tags for physical compatibility
- Programming requires a **Proxmark3** or compatible RFID tool

### Safety
- Be careful when disassembling devices with lithium batteries
- RFID tags can be damaged by heat, static, or incorrect programming
- Always test programmed tags before final assembly

### Legal
This documentation is for educational and personal use only. Star Wars and Galaxy's Edge are trademarks of Lucasfilm Ltd. and The Walt Disney Company. This documentation is not affiliated with or endorsed by Disney or Lucasfilm.

## Credits

This documentation represents the collective work of many community members, including but not limited to:
- TitaNets - Data mining and analysis
- Ruthsarian - Hardware documentation and photography
- Siddacious - Protocol analysis
- Bap - Bluetooth analysis
- Dead Bothans Society - Community coordination
- And many other contributors in the Galaxy's Edge maker community

## Updates

**Last Updated**: December 2024

This documentation is continuously updated as new information is discovered. Check the community Discord for the latest findings and discussions.

---

*May the Force be with you.*
