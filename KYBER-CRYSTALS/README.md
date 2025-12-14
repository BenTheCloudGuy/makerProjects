# KYBER CRYSTALS Project

## Overview

This project is dedicated to understanding, documenting, and creating custom kyber crystals compatible with Star Wars: Galaxy's Edge technology. Based on Disney's RFID-enabled kyber crystals used in lightsabers and holocrons, this project enables makers to create their own crystals for use in Jedi Holocrons, Sith Holocrons, Wayfinders, and Savi's Workshop lightsabers.

**Key Goals:**
- Document the RFID technology and protocols used in Galaxy's Edge devices
- Create 3D-printable kyber crystal designs (resin printing recommended)
- Provide tools and guides for programming custom RFID tags
- Understand the hardware and software architecture of holocrons and lightsabers
- Build community knowledge around Galaxy's Edge maker projects

## Project Structure

```
KYBER-CRYSTALS/
├── README.md                    # This file
├── arduinoApp/                  # Arduino/microcontroller code
│   └── backup.cpp
├── galaxys-edge-markdown/       # Comprehensive documentation (see below)
├── kyber_saves/                 # Kyber crystal RFID configuration files
│   ├── s2-ben-solo.json
│   ├── s2-darth-sidious.json
│   ├── s2-Indeera_Stokes.json
│   └── s2-mace-windu.json
└── STLS/                        # 3D printable models
    ├── kyber-crystal-jedi-crusader-pendant-model_files/
    └── Savi's Kyber Crystal (to take 12mm RFID chip) - 4195012/
```

## Documentation

The `galaxys-edge-markdown/` folder contains comprehensive documentation extracted from community research. This documentation is essential for understanding how to work with Galaxy's Edge technology:

### Quick Links

- **[About](galaxys-edge-markdown/about.md)** - Overview, resources, and community links
- **[README](galaxys-edge-markdown/README.md)** - Documentation index

### Hardware Documentation

- **[Holocron Hardware](galaxys-edge-markdown/holocron-hardware.md)** - Component breakdown and pinouts
- **[Holocron IR Protocol](galaxys-edge-markdown/holocron-ir-protocol.md)** - Infrared communication protocol
- **[Holocron Flash Memory Data Structure](galaxys-edge-markdown/holocron-flash-memory-data-stru.md)** - Memory organization
- **[RFID Reader/Writer Hardware](galaxys-edge-markdown/rfid-readerwriter-hardware.md)** - RFID hardware specs
- **[RFID Writer Signal Analysis](galaxys-edge-markdown/rfid-writer-signal-analysis.md)** - Protocol analysis with Proxmark3

### Lightsaber Documentation

- **[Savi's Workshop Chassis Hardware](galaxys-edge-markdown/savis-workshop-chassis-hardware.md)** - Chassis components and electronics
- **[Lightsaber Blade Hardware and Operations](galaxys-edge-markdown/lightsaber-blade-hardware-and-o.md)** - LED blade technology
- **[Lightsaber Hilt & Blade Communications](galaxys-edge-markdown/lightsaber-hilt-&-blade-communi.md)** - Protocol between hilt and blade

### Kyber Crystal Documentation

- **[Kyber Crystals (Series 1)](galaxys-edge-markdown/kyber-crystals-(series-1).md)** - Complete Series 1 crystal database
- **[Kyber Crystals (Series 2)](galaxys-edge-markdown/kyber-crystals-(series-2).md)** - Complete Series 2 crystal database
- **[Holocron Quotes](galaxys-edge-markdown/holcron-quotes.md)** - All holocron audio clips and quotes
- **[Sith Wayfinder Quotes](galaxys-edge-markdown/sith-wayfinder-quotes.md)** - Wayfinder-specific audio

### Droid Documentation

- **[Astromech Personality Chip](galaxys-edge-markdown/astromech-personality-chip.md)** - Personality chip structure
- **[Astromech Droid Hardware](galaxys-edge-markdown/astromech-droid-hardware.md)** - Droid electronics
- **[Astromech Droid Controller](galaxys-edge-markdown/astromech-droid-controller.md)** - Controller specifications
- **[Bluetooth Beacons](galaxys-edge-markdown/bluetooth-beacons.md)** - BLE beacon analysis

### Visual Resources

- **[Image Galleries](galaxys-edge-markdown/image-galleries.md)** - Teardown photos and visual documentation

## Getting Started

### What You'll Need

#### For Reading/Analyzing Crystals:
- **Proxmark3** (Easy or RDV4) - RFID reader/writer
- Existing kyber crystals to analyze

#### For Creating Custom Crystals:
- **3D Resin Printer** - For printing crystal shells
- **EM4305 or T5577 RFID Tags** (12mm disc format)
- **Proxmark3** - For programming RFID tags
- Clear resin (recommended for crystal appearance)
- LED diffuser material (optional)

#### For Software/Arduino Projects:
- Arduino IDE or compatible development environment
- USB programming cable
- See `arduinoApp/` folder for code examples

### Basic Workflow

1. **Learn the Technology**
   - Read the documentation in `galaxys-edge-markdown/`
   - Understand RFID protocols and crystal IDs
   - Review existing crystal configurations in `kyber_saves/`

2. **Obtain Hardware**
   - Get a Proxmark3 for RFID programming
   - Source appropriate RFID tags (EM4305 recommended)
   - Prepare 3D printing setup

3. **Program Your Crystals**
   - Use Proxmark3 to write crystal IDs to RFID tags
   - Reference the crystal databases for Tag IDs and configurations
   - Test with actual holocrons or lightsabers

4. **Create Physical Crystals**
   - 3D print crystal shells from `STLS/` folder
   - Insert programmed RFID tags
   - Assemble and test

## RFID Tag Programming

### Tag ID Format

Kyber crystals use **EM4305 RFID chips** configured to emulate **EM4100 protocol**. The Tag ID determines:
- Crystal color (for lightsabers)
- Voice/character (for holocrons)
- Location (for wayfinders)

### Example Tag IDs

| Tag ID (Hex) | Tag ID (Dec) | Color | Holocron Voice | Wayfinder Location |
|--------------|--------------|-------|----------------|-------------------|
| 0C00 | 3072 | White | Ahsoka Tano | Mandalore |
| 0C01 | 3073 | Red | Darth Vader | Mustafar |
| 0C03 | 3075 | Yellow | Temple Guard | Coruscant |
| 0C04 | 3076 | Green | Qui-Gon Jinn | Naboo |
| 0C06 | 3078 | Blue | Old Ben Kenobi | Tatooine |
| 0C07 | 3079 | Purple | Mace Windu | Geonosis |

See the complete databases in:
- [Kyber Crystals (Series 1)](galaxys-edge-markdown/kyber-crystals-(series-1).md)
- [Kyber Crystals (Series 2)](galaxys-edge-markdown/kyber-crystals-(series-2).md)

### Programming with Proxmark3

```bash
# Example: Programming a Qui-Gon Jinn crystal (Green, Tag ID 3076)
proxmark3> lf em 4x05 write -b 6 -d 0C803000
```

For detailed instructions, see:
- [RFID Writer Signal Analysis](galaxys-edge-markdown/rfid-writer-signal-analysis.md)

## 3D Printing

### Available Models

The `STLS/` folder contains:

1. **Kyber Crystal Jedi Crusader Pendant** - Wearable crystal design with RFID capability
2. **Savi's Kyber Crystal (12mm RFID chip)** - Custom crystal shell designed to hold standard 12mm RFID tags

### Printing Recommendations

- **Material**: Clear resin for authentic crystal appearance
- **Layer Height**: 0.025-0.05mm for fine detail
- **Post-Processing**: 
  - Polish with multiple grit sandpapers (400 → 1000 → 2000 grit)
  - Optional: Clear coat with automotive clear or resin
  - Consider LED diffuser inserts for illuminated effects

## Crystal Save Files

The `kyber_saves/` folder contains JSON configuration files for Series 2 crystals:

- `s2-ben-solo.json` - Ben Solo / Kylo Ren crystal configuration
- `s2-darth-sidious.json` - Emperor Palpatine crystal configuration
- `s2-Indeera_Stokes.json` - Indeera Stokes (High Republic era) crystal
- `s2-mace-windu.json` - Mace Windu crystal configuration

These files can be used with compatible RFID programming software to replicate specific crystal configurations.

## Community & Resources

### Discord
**The Galaxy's Edge Discord Server**
- Visit the **#makerspace** channel for discussions on crystals, RFIDs, and maker projects

### External Resources
- [Dead Bothans Web Site](http://deadbothans.com) - Community research hub
- [Ruthsarian's Flickr](https://www.flickr.com/photos/ruthsarian) - Photo documentation
- [Galaxy's Edge Fonts](https://unfiction.github.io/resources/fonts/GEFonts.html)

### Code Repositories
- [TitaNets Github](https://github.com/titanets)
- [Ruthsarian Github](https://github.com/ruthsarian)
- [Siddacious Github](https://github.com/siddacious)

For a comprehensive list of resources, see: [about.md](galaxys-edge-markdown/about.md)

## Contributing

This project is based on community research and contributions. If you have:
- New crystal discoveries
- Hardware teardowns
- 3D printable designs
- Arduino/microcontroller code
- Documentation improvements

Please consider sharing your work with the community!

## Safety & Legal

### Safety Notes
- RFID tags can be damaged by excessive heat during 3D printing
- Insert RFID tags AFTER printing and cooling
- Test programmed tags before final assembly
- Be careful with lithium batteries in holocrons and lightsabers

### Legal Disclaimer
This project is for educational and personal use only. Star Wars, Galaxy's Edge, and related trademarks are property of Lucasfilm Ltd. and The Walt Disney Company. This project is not affiliated with or endorsed by Disney or Lucasfilm.

Creating custom kyber crystals for personal use is generally acceptable, but:
- Do not sell custom crystals commercially
- Do not claim crystals are official Disney merchandise
- Respect intellectual property rights

## License

Documentation and community-contributed content follow their respective licenses. Always credit original researchers and contributors.

3D models in the `STLS/` folder may have their own licenses - check individual LICENSE files in each folder.

## Project Status

🚧 **Active Development** - This project is actively maintained and updated with new discoveries from the community.

**Last Updated**: December 2024

---

*May the Force be with you, always.*
