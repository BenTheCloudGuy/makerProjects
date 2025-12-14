# Holocron IR Protocol

| Holocron Infrared (IR) Protocol Overview |  |  |  |  |
|---|---|---|---|---|
| The Sith and Jedi holocrons pair with eachother via infrarad communications. This an an attempt at explaining the protocol being used. |  |  |  |  |
|  |  |  |  |  |
| Holocron messages are transmitted one message at a time. |  |  |  |  |
| Each message is either 8 or 12 bits depending on which series of holocron it is. |  |  |  |  |
| A bit is transmitted as length of time where the signal is "off" followed by a length of time when the signal is "on". |  |  |  |  |
| A "period" is the time it takes to transmit a single bit. |  |  |  |  |
| The value of a transmitted bit (1 or 0) is indicated by comparing the time "off" vs the time "on" during a single period. |  |  |  |  |
| If the time on is greater than the time off, the bit value is 1. |  |  |  |  |
| If the time off is greater than the time on, the bit value is 0. |  |  |  |  |
| Each message begins with a "preamble" where the signal is "ON" for about 2 times the length of a period. This indicates a new message is starting. |  |  |  |  |
|  |  |  |  |  |
|  | Here is an example of one message being transmitted: |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  | The "low" portion of the graph (lighter grey color) represents an "ON" signal. |  |  |  |
|  | In the example above, the bit value 11110000 (0xF0) is being transmitted. |  |  |  |
|  |  |  |  |  |
|  | It's possible to interpret this value as the bit order being reversed where the least significant bit is transmitted first. In that case the value would be 0x0F. |  |  |  |
|  | For the purposes of this document (and any code I write), I treat it as most significant bit is transmitted first. |  |  |  |
|  | What's important is to remain consistent in how you interpret the bit order when writing code that will communicate with holocrons. |  |  |  |
|  |  |  |  |  |
| Protocol Differences Between Series 1 and Series 2 |  |  |  |  |
| Series 1 and series 2 holocrons use slightly different protocols. This is probably being done so that series 2 holocrons can identify a series 2 versus a series 1 holocron when pairing. |  |  |  |  |
| Note: the timings provided for these protocols were determined through use of a logic analyzer. The timings may not be perfect, but they're good enough to work for me. :) |  |  |  |  |
|  |  |  |  |  |
|  | Series 1 Protocol |  |  |  |
|  | The preamble is 4ms long. |  |  |  |
|  | The bit period is 2ms or 2000 microseconds (uS). |  |  |  |
|  | To transmit a 1: 500uS off, 1500uS on |  |  |  |
|  | To transmit a 0: 1500uS off, 500uS on |  |  |  |
|  | Messages are 8 bits in length. |  |  |  |
|  |  |  |  |  |
|  | Messages |  |  |  |
|  | The message name and description are by no means official; this is my interpretation of how the holocrons react when receiving these commands. |  |  |  |
|  |  |  |  |  |
|  | Byte Value | Direction | Message | Description |
|  | 0x3C | SITH -> JEDI | Hello | Initiate connection, sent in response to a Jedi's beacon command |
|  | 0x69 | SITH -> JEDI | Button Press | Jedi holocron starts playing a Bendu message |
|  | 0x78 | SITH -> JEDI | Acknowledge | The Sith responds to Jedi commands with this to let the Jedi holocron know it's still alive |
|  | 0x87 | JEDI -> SITH | Breathe | Tells the Sith holocron to perform a 'breathing' animation where its lights start dim, get bright, then return to being dim. It will only do this once. The Jedi holocron must continue to send this message every 6000ms to keep the Sith holocron breathing |
|  | 0x96 | JEDI -> SITH | Bright | Tells the Sith holocron to brighten its lights. his is used to create the dark/light animation during playing of an audio clip |
|  | 0xA5 | JEDI -> SITH | Dark | Tells the Sith holocron to dim its lights. This is used to create the dark/light animation during playing of an audio clip |
|  | 0xB4 | JEDI -> SITH | Ping | When not sending any other command the Jedi holocron sends out this command every ~30ms to let the Sith holocron know it's alive and to get the Sith holocron to respond with its acknowledge command so the Jedi holocron knows the Sith holocron is still there. |
|  | 0xC3 | JEDI -> SITH | Breathe | Appears to be the same as 0x87 command; further investigation to identify a difference between the two is needed |
|  | 0xD2 | JEDI -> SITH | Flash | Under most circumstances, this causes the Sith holocron to momentarily flash its lights |
|  | 0xE1 | JEDI -> SITH | Lights Off | Tell the Sith holocron to turn off its lights; but it doesn't always work, more investigation is needed |
|  | 0xF0 | JEDI | Beacon 1 | When not connected to a Sith holocron, the Jedi holocron is transmitting this command every 30ms and looking for a response from a Sith holocron. |
|  |  |  |  |  |
|  | When sent a command it doesn't know about, the Sith holocron will disconnect. |  |  |  |
|  | Using this information I wrote a program to go through all 256 values for the command to identify all commands the Sith accept which is where many of the above commands come from. |  |  |  |
|  |  |  |  |  |
|  | Series 2 Protocol |  |  |  |
|  | The preamble is 4.4ms long (compatible with Series 1) |  |  |  |
|  | The bit period is 1125 uS. |  |  |  |
|  | To transmit a 1: 350uS off, 775uS on |  |  |  |
|  | To transmit a 0: 775uS off, 350uS on |  |  |  |
|  | Messages are 12 bits in length (with one exception). |  |  |  |
|  |  |  |  |  |
|  | Messages |  |  |  |
|  | Byte Value | Direction | Message | Description |
|  | 0x880 | SITH -> JEDI | Acknowledge | Tells the Jedi holocron it is paired with that it received the last message. |
|  | 0x891 | SITH -> JEDI | Button Press | Tells the Jedi holocron its button has been pressed. |
|  | 0x00 | JEDI | Beacon 2 | Series 2 Jedi holocrons transmit a 2-message beacon, 0x00 0xF0. Series 2 Sith holocrons respond to the 0x00 beacon while series 1 Sith holocrons respond to the 0xF0 beacon. |
|  | 0x044 | JEDI -> SITH | Ping | When paired and at idle, the Jedi holocron sends out this message to let the Sith holocron know it's still there. And it listens for the Sith holocron's response to know it's still present. |
|  | 0x055 | JEDI -> SITH | Dark | Tells the Sith holocron to dim its lights. This is used to create the dark/light animation during playing of an audio clip. |
|  | 0x066 | JEDI -> SITH | Bright | Tells the Sith holocron to brighten its lights. his is used to create the dark/light animation during playing of an audio clip. |
|  | 0x077 | JEDI -> SITH | Breathe | Tells the Sith holocron to perform a 'breathing' animation where its lights start dim, get bright, then return to being dim. It will only do this once. The Jedi holocron repeats this message to keep the Sith holocron breathing. |
|  |  |  |  |  |
|  |  |  |  |  |
| Technical Details on Transmitting and Receiving IR Data |  |  |  |  |
| Holocrons transmit IR data using a 38kHz carrier frequency (similar to how some remote controls work). This means that the "on" portion of a signal is actually being transmitted using a 38kHz square wave. |  |  |  |  |
| The carrier wave is used to help prevent interference from the environment (anything else that transmits IR). |  |  |  |  |
| This is something to take into consideration when creating a setup to read or send IR communications with holocrons. |  |  |  |  |
|  |  |  |  |  |
|  | Here's an example of data being transmitted, captured by an IR receiver in the raw: |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  | Those dark areas are actually the 38kHz square wave. |  |  |  |
|  | That same signal, seen through an IR receiver module which removes the carrier frequency, looks like this: |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
| For my current setup, I am using a KY-032 module which is a cheap, Arduino-friendly distance/avoidance detection module. It includes both an IR transmitter and an IR receiver and is very cheap. |  |  |  |  |
| Examples of the module I am using: https://www.ebay.com/itm/404512411038, https://www.amazon.com/dp/B0969B3FWN/ |  |  |  |  |
|  |  |  |  |  |
| This module can be used to both send and receive data with holocrons. |  |  |  |  |
| The module includes a 555 timer that's used to drive the IR transmitter at frequencies in the kHz range. It is capable of being tuned to 38khz. |  |  |  |  |
| The enable pin of the module can be used (after removing the on-board jumper) to turn the transmitter on and off via an Arduino or other such device. |  |  |  |  |
| The IR receive module of the KY-032 removes the 38kHz carrier frequency, producing an output similar to what you see above. |  |  |  |  |
|  |  |  |  |  |
| For data capture I am using PulseView for the application: https://sigrok.org/wiki/PulseView |  |  |  |  |
| For capture hardware I am using a cheap US$6 logic analyzer from eBay: https://www.ebay.com/itm/145184521106 |  |  |  |  |
|  |  |  |  |  |
| With the logic analyzer attached to the OUT pin of the KY-032 module (and with power being applied to the module), I can capture signals from the holocron. |  |  |  |  |
| This is how I can analyze the comms to reverse the IR protocl and it's what I'm using to generate the graphs used on this tab. |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  | My setup: |  |  |  |
|  | Arduino Nano |  |  |  |
|  | KY-032 IR Module |  |  |  |
|  | Mini Logic Analyzer |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
| Code |  |  |  |  |
| I have written some code to interface with holocrons. I've created a github repository for that code at https://github.com/ruthsarian/holocron-toolbox. |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |