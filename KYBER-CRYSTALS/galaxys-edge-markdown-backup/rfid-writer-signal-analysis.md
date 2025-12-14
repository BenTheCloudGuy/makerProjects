# RFID Writer Signal Analysis

| RFID Writer Signal Analysis (Determining Its Password) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| The OBO Hands RFID writer is a tool that looks a lot like the Zonsin RFID writer, but it can only write once to a kyber crystal and it locks the crystal with a password. |  |  |  |  |  |  |  |  |  |  | Excellent RFID Reference: |  |  |  |
| Let's determine the password by analyzing the signal of the writer using a Proxmark3 Easy. |  |  |  |  |  |  |  |  |  |  | https://www.priority1design.com.au/rfid_design.html |  |  |  |
| And possibly try to understand why it can only write once. |  |  |  |  |  |  |  |  |  |  | https://www.priority1design.com.au/t5557_rfid_transponder.html |  |  |  |
| The techniques shown here could easily be applied to other RFID writers. |  |  |  |  |  |  |  |  |  |  | https://www.priority1design.com.au/em4100_protocol.html |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Hardware |  |  |  |  |  |  |  |  |  | the above references go into data modulation schemes. |  |  |  |
|  | Proxmark3 Easy |  |  |  |  |  |  |  |  |  | these are the schemes used by the RFID tag to transmit data. |  |  |  |
|  | OBO Hands RFID Writer |  |  |  |  |  |  |  |  |  | in this document we're looking at how writers transmit data to tags, |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  | which will use a different scheme |  |  |  |
|  | Software |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | ProxSpace |  |  |  |  |  |  |  |  |  | Related |  |  |  |
|  | Official Proxmark3 Client |  |  |  |  |  |  |  |  |  | Analysis of Sith Wayfinder RFID Operations |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  | xEM Cloning, Emulation Modes and the perils of Chinese cloners! |  |  |  |
|  | Alternative Software |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Precompiled Proxmark Builds |  |  |  |  |  |  |  |  |  | Further Study |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  | https://www.serasidis.gr/circuits/RFID_reader/125kHz_RFID_reader.htm |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Data Collection |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 1. Connect your PM3 to your computer |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 2. Start the pm3 client |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 3. Configure the client so it's ready to snoop the writer's signal |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | (standard client) |  |  |  | (iceman client) |  |  |  |  |  |  |  |  |  |
|  | proxmark3> lf config d 4 b 8 L t 96 s 5000 |  |  |  | [usb] pm3 --> lf config --dec 4 -b 8 --125 -t 96 -s 5000 |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 4. Begin snooping for the signal |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | (standard client) |  |  |  | (iceman client) |  |  |  |  |  |  |  |  |  |
|  | proxmark3> lf snoop |  |  |  | [usb] pm3 --> lf sniff |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 5. Power up the RFID writer, set it to 125KHz mode, and enter some value to write. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 6. Place the writer over the LF antenna of the PM3 and press the write button. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Make sure the back of the writer is up against the pm3 antenna; this will produce a better signal. |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 7. Open the data plot window |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | (standrad client) |  |  |  | (iceman client) |  |  |  |  |  |  |  |  |  |
|  | proxmark3> data plot |  |  |  | [usb] pm3 --> data plot |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 8. This typically opens two windows, a plot/graph window and an 'overlays' window. I usually close the overlay window as I do not use it. Here is the plot: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | The configuration options with the "lf config" command have been crafted such that the entire WRITE signal sent by the writer is captured in this plot. |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | These options include 'decimating' the signal (collecting only 1 in every 4 samples) and skipping the first 5000 samples |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | If your capture does not look as crisp as this, you can try again by re-entering the "lf snoop" command and then writing with the RFID writer while it is pressed against the pm3. The plot window will update with the new capture automatically |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Try changing the position of the RFID writer relative to the proxmark3. Positioning will make a huge difference in the quality of signal you are able to capture. |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Navigating the Plot Window |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Use the up and down arrow keys to zoom in and out |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Left and right arrow keys move left and right |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Holding shift will move a greater distance left or right |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Holding ctrl will move a smaller distance left or right |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| 9. Save this data so you can use it later on rather than having to keep acquiring this signal every time you want to analyze it |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | (standard client) |  |  |  | (iceman client) |  |  |  |  |  |  |  |  |  |
|  | proxmark3> data save obo_hands_write_3078_d4_s5000 |  |  |  | [usb] pm3 --> data save -f obo_hands_write_3078_d4_s5000 |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | a copy of the data that I collected and have displayed in the plot above may be downloaded here: https://drive.google.com/file/d/1p9Kru_Op5jaDVYtsEiZUBa-LlP82DBu-/view |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | you can load this file into the pm3 client with the command: |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | (standard client) |  |  |  | (iceman client) |  |  |  |  |  |  |  |  |  |
|  | proxmark3> data load <path to file>/obo_hands_write_3078_d4_s5000 |  |  |  | [usb] pm3 --> data load -f obo_hands_write_3078_d4_s5000 |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Analyzing The Signal |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| I use the term "signal" and "capture" interchangeably here. Sorry for any confusion. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| I will refer to sections of the capture as "blocks". The "blocks" are sections of the capture that appear to contain a single "command" and will be separated by other blocks with a "blank" period. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| I will number them from left to right beginning with the number 1. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| For example, in the capture above, what I will refer to as block 5 and block 9 are very brief (narrow) in the image above. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The spots with a single "valley" I won't including in my block numbering scheme. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| By this method I could at least 26 blocks before I get near the end where there's no real data there and so I don't want to bother continuing with my counting. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| This type of RFID writer is designed to work with several different types of RFID tags. As such there are many different write commands embedded in the capture, one section for each type of RFID tag the writer is designed to write to. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Knowing the protocol used to write to an RFID tag will be critical in analyzing the capture. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Each block will, typically, contain a single command for a given RFID tag. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| There will be multiple commands for each type of RFID tag and those commands will be grouped together. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| For example, blocks 1-4 and 6-8 are commands that target the same RFID chip. Blocks 5 and 9 probably have the purpose of resetting the RFID tag, but contain no actual command. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| How RFID Signals Work & How That Relates To The Plot Window |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The RFID reader/writer will generate a signal consisting of pulses of electricity at some regular interval. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| In our case, these are 125KHz RFID tags, so there will be 125,000 pulses of electricity generated per second. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| These pulses provide the energy to power the RFID tag in a manner similar to how a cell phone charger can wirelessly charge a cell phone. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| These pulses can also be modulated such as by changing the frequency of the pulses (frequency modulation or FM) or changing the amplitude (the 'strength') of the pulses (amplitude modulation or AM). |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| For RFID writers, the signals they send to the RFID tags (at least the ones we care about) will be done through amplitude modulation (AM). |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| In fact, it uses the simplest form of AM in which either the signal is ON or OFF, referred to as on-off keying or OOK. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Data will be transmitted in binary. You can think of a single binary value as being 1 or 0. Or you could think of it as ON  or OFF. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| How a 1 and 0 are transmitted will vary depending on the protocol being used. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The T5557 Protocol |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Let's look at the T5557 RFID chip (a common 125KHz RFID chip found in those blue key fobs) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The T5557 datasheet may be found here: https://media.digikey.com/pdf/Data%20Sheets/Atmel%20PDFs/T5557.pdf |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| On page 7 of the datasheet begins a section titled "Reader to Tag Communication" in which it details how 1s and 0s are transmitted. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Data is transmitted by using 'field gaps', which simply means the 125KHz signal of the writer is turned off. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The time between two gaps, that is the period during which the 125KHz signal is ON, determines whether a 1 or a 0 is being transmitted. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | (roughly) 24 'field clocks' = 0, 54 'field clocks' = 1 |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | a 'field clock' is one pulse of electricity. |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | there are 125,000 of them per second; a single clock is 8 microseconds. |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 24 field clocks = 192 microseconds |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 56 field clocks = 448 microseconds |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Essentially this means is a short ON period = 0, a long ON period = 1. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| How the Captured Signal Relates to the RFID Protocol |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The capture does not show every pulse of electricity being emitted by the RFID writer. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Instead what we see is the voltage level across the antenna which also has a capacitor. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Each pulse of electricity will charge the capacitor (similar to how it charges the internal capacitor of the RFID tag) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| When the RFID writer's signal is ON (when it's sending out pulses) we'll see an increase in voltage across the capacitor. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| When the RFID writer's signal is OFF we'll see that charge decrease. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Essentially, the signal we see in the plot window of the proxmark3 shows us the on and off periods of the RFID writer 125KHz signal. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Let's zoom in to the start of the first block in the capture and see what's there: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| This block contains a command for a T5557 RFID tag. (I know this from previous experiences using trial and error and guess work.) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Let's focus on just the elements of the signal that are above the 0 point (the horizontal line in the middle of the plot). |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Specifically, look at when each 'peak' intersects that 0 line. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The peaks can be divided up into two types: narrow and wide. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The wide peaks seem to curve down and off to the right a bit before crossing the 0 line, but only looking at where they cross the 0 line, you can see the wide peaks are twice as big as the narrow peaks. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Wide peaks = long ON period = binary 1 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Narrow peaks = short ON period = binary 0 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Based on this, we can interpret the signal above to contain the following binary value: 1000011001 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Decoding The Command |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Working through the entire first block in the capture we get this value: 10000110011001001000000100001001110010101000110100101100001011011101111 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| So what does it mean? |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Looking at the T5557 datasheet, page 9 contains a description of the protocol. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| We have 71 bits of information. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| A 'standard write' contains 38 bits. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| A protected write contains 70 bits. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| This is likely a protected write command, but why do we have an extra bit? |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The last peak in the capture never dips 'significantly' below the 0 line. It's likely that the RFID writer's signal remained on after the last bit to signal an end to the command (as denoted in the datasheet). |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| That last, staying-on period by the RFID writer has produced this peak that never dips below the 0 line. We can ignore that last peak. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| So we really have 70 bits of information (we ignore the last bit): 1000011001100100100000010000100111001010100011010010110000101101110111 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Now we can apply the 'protected write' command format outlined in the datasheet to this binary information we have: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The first bit is always a '1' followed by the 'page' |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The next 32 bits are the password. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The 1 bit specifies whether or not the address being written to should be locked, preventing further writes to the address |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The next 32 bits contain the data being written to the RFID tag |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The last 3 bytes contain the address where the data should be stored. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Here is the decoded command: |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Bits | Purpose | Hex Value | Binary Value |  |  |  |  |  |  |  |  |  |  |
|  | [0:0] | Command Start | 1 | 1 |  |  |  |  |  |  |  |  |  |  |
|  | [1:1] | Page | 0 | 0 |  |  |  |  |  |  |  |  |  |  |
|  | [2:33] | Password | 19920427 | 00011001100100100000010000100111 |  |  |  |  |  |  |  |  |  |  |
|  | [34:34] | Lock | 0 | 0 |  |  |  |  |  |  |  |  |  |  |
|  | [35:66] | Data | 5469616E | 01010100011010010110000101101110 |  |  |  |  |  |  |  |  |  |  |
|  | [67:69] | Address | 7 | 111 |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | * you use an online tool like this one to convert binary to hex. Windows 10 users can use the built-in calculator in programmer mode as well |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| From the decoded command we can see data is being written to address 7. What's address 7 used for? |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The datasheet refers to addresses as "blocks" and states, on page 4, that block 7 is used to hold the password. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| This command is attempting to write a new password to the RFID tag. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| GOTCHA: Bit Order |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| One thing to be aware of is bit order (or bit numbering); is the first bit in the binary value we have the most-significant bit (MSB) or the least-significant bit (LSB)? |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Take the decimal number 1,024 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The most significant digit would be the 1, which is in the thousands place. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The least significant digit would be the 4, which is in the ones place. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| This value, and how people typically process numbers, is that the most significant digit comes first. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| However, the T5557 datasheet seems to indicate that the data and password fields are LSB first. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Meaning we may need to reverse the order of bits before converting it to a hexadecimal value to get the password. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The password can then be used with the Proxmark3 to unlock an RFID tag (remove the password and password requirement of the RFID tag). |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| But what if the pm3 client you're using ALSO treats these values as LSB first and we DON'T need to reverse the bit order; in other words we convert the original binary value to HEX and use that as the password instead. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| WHICH IS IT?! |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Don't know. Try them both. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| An online tool like this one can be used to reverse the string of binary digits. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Record both values of the binary value in hex. One of them will work, we'll figure out which later. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| So we've discovered this RFID writer is setting a password with a value, in hexadecimal, of either 5469616E or 7686962A. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| And we also have a list of other passwords it's attempting to use to change the password on the RFID tag. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| These are passwords that other RFID writers must be using. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| If we decode all the T5557 commands in the capture we can create a decent list of possible passwords to use with locked RFID tags. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Password (LSB) | Password (MSB) |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 5469616E | 7686962A |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 51243648 | 126C248A |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 1C0B5848 | 121AD038 |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 19920427 | E4204998 |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Analyzing the EM4305 Signal |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Kyber crystals use EM4305 tags. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Beginning with block 10 we have commands designed for the EM4305 RFID tag. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| To analyze these commands we must first identify the writer to tag protocol used. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The datasheet for the EM4305 describes the write protocol. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The EM4305 datasheet may be found here: https://www.emmicroelectronic.com/sites/default/files/products/datasheets/4205-4305-DS-01.pdf |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| A description of the write protocol begins on page 8 of the datasheet. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The datasheet talks about a 'field' and a 'field stop'. The field is the RF field being generated by the writer's pulses of electricity. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| When the field is on, the writer is generating 125,000 pulses of electricity a second. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| When the field is off, the writer is not generating any pulses of electricity. This is also known as a 'field stop'. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| A 'bit period' is the period during which a bit is transmitted. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The length of the bit period is 32 pulses or clocks of the RF field. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| A '1' is transmitted if the RF field stays on for the full bit period. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| A '0' is transmitted if the RF turns off at any point during the bit period (typically after 16 clocks). |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Let's look at the start of block 10 in the capture: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| This is similar to what was seen with the T5557 signal, except you'll notice there the two "wide" peaks here have different widths. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| What's happening is the more 1s being transmitted sequentially, the wider the peak because the field never turns off while a 1 is being transmitted. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| It would be useful if there was a way to draw a grid identifying the bit period so we could use that to identify how many 1s are being transmitted when one or more are being transmitted. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| And proxmark allows us to do just that! |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | (standard client) |  |  |  | (iceman client) |  |  |  |  |  |  |  |  |  |
|  | proxmark3> data grid 8 |  |  |  | [usb] pm3 --> data grid -x 8 |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The above command will draw a vertical line every 8 samples. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Adjust this value until you can fit a complete narrow peak between two of the lines, like this: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| With this arrangement it's now possible to 'decode' the binary data by recording a '0' for every slice that has a peak in it, and a '1' for every slice that does not have a peak. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Using this method, the above image contains the following bit values: 0000110000010101 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Applying this method across the entire block 10 we get:  000011000001010110101110001110111100111110011101100 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| All EM4305 Commands Begin with '00' |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Before decoding this command, it's important to review the datasheet, page 8, one more time. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Under the section "Forward Link Communication" it talks about how the writer can bring the tag out of its default read mode by issuing a field stop. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| After issuing a field stop, a 0 is then sent in order to sync the tag with the writer. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| A field stop and a 0 are essentially the same thing here. That means the first two zeroes in our data are not actually part of the command, but the initial field stop to take the tag out of default read mode and the 0 to sync the tag with the writer. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| This means all our EM4305 commands should begin with '00'. This is a great way to help identify a potential EM4305 command when looking at an unknown RFID capture. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Decoding The Command |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Pages 10 and 11 of the datasheet outline the structure of the commands. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Each command begins with a command code. This will be a 3-bit value followed by a single parity bit. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The command code being sent will also tell us which other data (address, password, data, etc...) will be included in the rest of the command. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| About Parity |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Before going further, it helps to understand what parity bits are and how they're used here. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Parity bits are used to validate that decoding a signal into a stream of bits was good. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| In the case of EM4305, parity bits are used to even out the number of 1s that appear in a stream of bits. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Take our bit stream for example, we ignore the first two bits (the field stop and '0' sync), then look at the next 4 bits which contain the 3-bit command code and parity bit. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Bitstream: 0011 |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Command Code: 001 |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Parity Bit: 1 |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Counting the number of 1s in the command code gives us an odd number, thus the parity bit is set to 1 in order to even out the number of 1s. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| If we had a command code of '001' and a parity bit of '0' then we know something is wrong; either our interpretation of the signal is wrong or the command is not an EM4305 command. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Parity bits play a very important role when it comes to decoding data later on. It's important to be familiar with the concept. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The Login Command |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The command code from our bitstream is '001' which, according to the datasheet, is a "Login" command. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The login command is necessary if an RFID tag is password protected and we want to read specific addresses in the tag or write to it (as in the case with this RFID writer). |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Page 11 of the datasheet shows that the login command structure is simply the command code for login followed by the password. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The remaining 45 bits of data contain the password the RFID writer is sending for the login command. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| We can break down the entire bitstream like this: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | bits | purpose | value |  |  |  |  |  |  |  |  |  |  |  |
|  | [0:0] | field stop | 0 |  |  |  |  |  |  |  |  |  |  |  |
|  | [1:1] | sync | 0 |  |  |  |  |  |  |  |  |  |  |  |
|  | [2:5] | command code | 0011 |  |  |  |  |  |  |  |  |  |  |  |
|  | [6:50] | password | 000001010110101110001110111100111110011101100 |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The password is a 32-bit value, but we have 45 bits here, what gives? |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The password field contains parity bits. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Page 10 of the datasheet explains the structure of the data and parity bits under the section "Data structure". |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Here data is broken down into 4 rows of 8 bits with each row taking on an additional parity bit as well as each column. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| To decode the 45-bit password field rearrange the data into 5 rows of 9 bits like this: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 000001010 |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 110101110 |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 001110111 |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 100111110 |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 011101100 |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The right-most bit of each row is the parity bit for that row. The bottom most row contains the parity bit for each column. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| If you want to validate your data and confirm you've correctly interpreted the signal, you check to see if the parity bits contain the values you'd expect. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Or you can simply chip off the last bit of each row, and ignore the bottom row completely, to extract the 32-bit value |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 00000101 |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 11010111 |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 00111011 |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 10011111 |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Then we can arrange this back into a single-row binary value: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 00000101110101110011101110011111 |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Plug this into a binary-to-hex converter and we get a password: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | LSB | MSB |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 05D73B9F | F9DCEBA0 |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | While the binary value is LSB first according to the datasheet, we're not sure how software might interpret it, so we'll reverse the binary string and record that value as well |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | We can figure out which way it is later with a practical test; change a kyber crystal with the writer, then unlock it using the proxmark3 and the passwords we decode. |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The Write Command |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Block 11 provides the following bitstream: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 00 0101 0100001 010101001011010010011000011011011101001100100 |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| I've added spaces to separate the different sections of the command. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The first two bits are the usual '00' that all commands begin with. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The second section is the 3-bit command code and parity bit which identifies this as a WRITE command. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| According to the datasheet, the structure of the write command is a 4-bit address followed by two zeros in a parity bit then followed by the 32-bit value encoded with parity bits giving us the 45-bit section at the end. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The address is given in LSB-first, so the bitstream '0100' should be interpreted as the binary value '0010' or 2. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| According to the datasheet, address 2 is where the password for the RFID tag is stored. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Thus this command is trying to set a new password on the RFID tag by writing it to address 2. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Decoding the data of this command gives us the password:(s) |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | LSB | MSB |  |  |  |  |  |  |  |  |  |  |  |  |
|  | 5469616E | 7686962A |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| And this is our first glimpse at the password this RFID writer wants to set on the RFID tag. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| And also curious to note that this is the same password being used with the T5557 tags. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| At this point it's likely we can assume all types of RFID tags this writer will write to will use the password we found. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The Rest of the EM4305 Blocks |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Below is a list of all the bitstreams and description of each command for all blocks from the capture that contain EM4305 commands |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Block | Bitstream |  |  |  | Purpose |  |  |  |  |  |  |  |  |
|  | 10 | 00 0011 000001010110101110001110111100111110011101100 |  |  |  | login with password F9DCEBA0 |  |  |  |  |  |  |  |  |
|  | 11 | 00 0101 0100001 010101001011010010011000011011011101001100100 |  |  |  | set new password 7686962A |  |  |  |  |  |  |  |  |
|  | 12 | 00 0011 000000000000000000000000000000000000000000000 |  |  |  | login with password 00000000 |  |  |  |  |  |  |  |  |
|  | 13 | 00 0101 0100001 010101001011010010011000011011011101001100100 |  |  |  | set new password 7686962A |  |  |  |  |  |  |  |  |
|  | 14 | 00 0011 010101001011010010011000011011011101001100100 |  |  |  | login with password 7686962A |  |  |  |  |  |  |  |  |
|  | 15 | 00 0101 1010000 111111110100000001000000000000000000011111110 |  |  |  | write 000001FF to address 5 |  |  |  |  |  |  |  |  |
|  | 16 | 00 0101 0110000 000000000000011000000000011100101001100110010 |  |  |  | write 29803000 to address 6 |  |  |  |  |  |  |  |  |
|  | 17 | 00 0101 0010001 111110100000000011101010001000000000010100110 |  |  |  | write 0015805F to address 4 |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Default read mode is when the tag is inside an active RF field (meaning it's powered) and starts outputting that data, repeatedly, until it either leaves the RF field or detects a field stop and waits for a command. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Blocks 15 and 16 write data to addresses 5 and 6. This is the EM4100 protocol-encoded data that will be transmitted while the tag is in default read mode. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| For kyber crystals, this is where the ID that the lightsaber hilt and holocron read to identify which crystal is present. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| For more information on the EM4100 protocol and how to decode the data stored in addresses 5 and 6 see: https://www.priority1design.com.au/em4100_protocol.html |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The Configuration Word |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Block 17 writes the value 0x0015805F to address 4. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| According to the datasheet, address 4 contains the configuration word. This defines the behavior of the RFID tag. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Pages 6 and 7 of the datasheet document what each bit of the configuration word do. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The bitstream (LSB) of the value being written to address 4 is: 11111010000000011010100000000000 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Using this bitstream, below documents the settings of the RFID tag being set |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | bits | value | setting | setting value | purpose |  |  |  |  |  |  |  |  |  |
|  | [0:5] | 111110 | Data Rate | RF/64 | defines the bit period the tag will use when sending data back to the reader |  |  |  |  |  |  |  |  |  |
|  | [6:9] | 1000 | Encoder | Manchester | defines the encoding used to send data back to the reader |  |  |  |  |  |  |  |  |  |
|  | [10:11] | 00 | not used |  |  |  |  |  |  |  |  |  |  |  |
|  | [12:13] | 00 | Delayed On | no delay |  |  |  |  |  |  |  |  |  |  |
|  | [14:17] | 0110 | Last Default Read Word | Address 6 | when in default read mode, the tag starts emitting data stored at Address 5 and will continue reading subsequent addresses up to and include the value defined here |  |  |  |  |  |  |  |  |  |
|  | [18:18] | 1 | Read Login | enabled | require a login command in order to read data from the tag beyond what it will transmit in default read mode; requires password to read specific addresses |  |  |  |  |  |  |  |  |  |
|  | [19:19] | 0 | not used |  |  |  |  |  |  |  |  |  |  |  |
|  | [20:20] | 1 | Write Login | enabled | require a login command in order to write data to the tag |  |  |  |  |  |  |  |  |  |
|  | [21:22] | 00 | not used |  |  |  |  |  |  |  |  |  |  |  |
|  | [23:23] | 0 | Disable | disabled |  |  |  |  |  |  |  |  |  |  |
|  | [24:24] | 0 | Reader Talk First | disabled |  |  |  |  |  |  |  |  |  |  |
|  | [25:25] | 0 | not used |  |  |  |  |  |  |  |  |  |  |  |
|  | [26:26] | 0 | Pigeon mode | disabled |  |  |  |  |  |  |  |  |  |  |
|  | [27:31] | 00000 | reserved for future use |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The critical items to point out here is that this RFID writer is enabling both the READ LOGIN and WRITE LOGIN configuration options. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| This essentially enables password protection on the RFID tag. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| If disabled, a password would not be needed to read or write to the RFID tag, even if a password was set. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Because this enables password protection, an RFID writer cannot write to the RFID tag without knowing and using the password. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| So Why Does The OBO Hands Writer Only Write Once? |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The commands themselves look good. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| However after a test write with the OBO Hands writer it seems the password is NOT being set in the crystal, but the read and write login flags are. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| I believe blocks 16 and 17 are being received by the RFID tag in the crystal, but the others aren't being processed for some reason. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| After block 17 is processed, all subsequent writes fail because the crystal has been reconfigured to require a login before a write. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| So why are the logins and set password commands being ignored? |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| I think it's a timing issue. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Here's what the OBO Hands EM4305 commands look like in the plot: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| This graph begins with block 10. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Notice the gap between blocks 10 and 11 is very narrow? |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| The same between blocks 12 and 13 then again between 14 and 15. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| I think that small gap is the issue. I think the gap should be as wide as you see between gaps 11 and 12 or 13 and 14 or 15 and 16 or 16 and 17. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| As an example, I pulled out another RFID writer which can write to EM4305 tags. Here's what its EM4305 blocks look like: |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| There are 6 blocks here and a considerable gap between each block. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| I think because the gap between the login and set password commands is so small, they're not being processed by the RFID tag. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Now go back and look at all the commands; remove all the login/set password pairs and that only leaves blocks 16 and 17. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| If only blocks 16 and 17 are processed by EM4305 tags, that would extirely explain the behavior seen with OBO Hands! |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| There is likely a bug in the OBO Hands fimrware that breaks the delay between commands when a login command is sent by the device. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Proxmark3 Captures |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Below is a list of captures make with various RFID writers if you want to try your own hand at decoding these devices. |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Writer | Link To Capture |  |  |  |  |  |  |  |  |  |  |  |  |
|  | OBO Hands | obo_hands_write_3078_d4_s5000 |  |  |  |  |  |  |  |  |  |  |  |  |
|  | OBO Hands #2 | obo_hands2_write_3078_d4_s0 |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Zonsin | zonsin_write_3078_d4_s0 |  |  |  |  |  |  |  |  |  |  |  |  |
|  | Zonsin #2 | zonsin-like_write_3078_d4_s0 |  |  |  |  |  |  |  |  |  |  |  |  |
|  | ZXCopy3 | zxcopy3_write_3079_d4_s0 |  |  |  |  |  |  |  |  |  |  |  |  |