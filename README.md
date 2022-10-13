# SIM108 - NMEA 2000 switch input module

This project implements an NMEA 2000 switch input module with
support for eight switch input channels.

__SIM108__ consists of a microcontroller-based hardware design
and an associated firmware.

The stock firmware realises an NMEA 2000 switchbank interface
that accepts SPST switch inputs and transmits
[PGN 127501 Binary Status Report]()
messages.

The module is powered from the NMEA bus and has an LEN of 0.5.

## Design overview

__SIM108__ uses a Teensy 3.2 microcontroller supported by power
supply, CAN unterface, configuration, display and switch input
sub-systems.

The power supply sub-system consists of a solid-state DC-DC
converter which adapts the voltage of the NMEA host NMEA bus to
the 5VDC required by the module's electronics.
The power supply is rated at 2W and its bus connection is fused
and reverse polarity protected.

The CAN interface sub-system manages all NMEA data bus I/O.
The data bus connection can be switched by the installer to
include a 120 Ohm bus termination resistor allowing the module
to be installed as either a bus termination node or a drop node.

The configuration sub-system consists of an 8-position DIL switch
and push-button which allow installer configuration of the module's
NMEA instance number.

The display sub-system provides a collection of LEDs which are used
to give configuration feedback and indicate the module operating
status.

The switch input sub-system consists of eight hardware debounced
input channels each of which is optically isolated and reverse
polarity protected with reference to a shared common ground.
An input voltage of between 5VDC and 50VDC is interpreted as
an ON condition and when ON the nominal current draw per input
channel is 8mA at 12VDC, 10mA at 24VDC.

__SIM108__'s stock firmware monitors input channel state changes
and queues switchbank status updates for transmission over NMEA 2000.
Switchbank status messages are transmitted once every four seconds or
immediately a state change is detected on an input channel.

The firmware transmits the following NMEA 2000 message types.

| PGN  | Description |
| :--- | :--- |
|127501 (Binary Status Report) | Issued every four seconds or immediately on the state change of any input channel. |

## Implementation

### Parts list

| REF      | Subsystem       | Component               | RS Part#|
| :---     | :---            | :---                    | :--- |
| --       | ENC             | [Plastic flanged enclosure](https://docs.rs-online.com/7852/0900766b80fcf8b3.pdf) | [https://uk.rs-online.com/web/p/general-purpose-enclosures/7417477) |
| --       | PCB             | [PCB](./ROM104.brd.pdf) | |
| U7       | Microcontroller | [PJRC Teensy 3.2 MCU](https://www.pjrc.com/store/teensy32.html) |
| C8       | Microcontroller | [100nF elctrolytic capacitor](https://docs.rs-online.com/6ccf/0900766b8143e698.pdf)| [862-4146](https://uk.rs-online.com/web/p/aluminium-capacitors/8624146) |
| SW1      | Configuration   | [8-way SPST DIP switch](https://docs.rs-online.com/c98b/0900766b810b550f.pdf) | [756-1347](https://uk.rs-online.com/web/p/dip-sip-switches/7561347/) |
| SW2      | Configuration   | [2-way SPST DIP switch](https://docs.rs-online.com/a014/0900766b81670159.pdf) | [177-4261](https://uk.rs-online.com/web/p/dip-sip-switches/1774261) |
| SW3      | Configuration   | [Push button](https://docs.rs-online.com/9eaa/0900766b81403991.pdf) | [010-2327](https://uk.rs-online.com/web/p/keyboard-switches/0102327) |
| ??       | Configuration   | [MAX6816 debouncer](https://docs.rs-online.com/617e/0900766b81729403.pdf) | [189-9248](https://uk.rs-online.com/web/p/bounce-eliminator-ics/1899248) |
| U6       | Display         | [74HC595 shift register](https://uk.rs-online.com/web/p/counter-ics/7091971) | [709-1971](https://uk.rs-online.com/web/p/counter-ics/7091971) |
| C9       | Display         | [100nF elctrolytic capacitor](https://docs.rs-online.com/6ccf/0900766b8143e698.pdf)| [862-4146](https://uk.rs-online.com/web/p/aluminium-capacitors/8624146) |
| D1-D8    | Display         | [2mm rectangular LED](https://docs.rs-online.com/3547/0900766b81384f75.pdf) | [229-2447](https://uk.rs-online.com/web/p/leds/2292447) |
| RN1      | Display         | [470R 8x resistor array](https://docs.rs-online.com/d532/0900766b8069ccfd.pdf) | [522-4273](https://uk.rs-online.com/web/p/resistor-arrays/5224273) |
| U3       | Power supply    | [TracoPower TMR-2411 DC-DC converter](https://docs.rs-online.com/1b79/0900766b8172f5cb.pdf) | [433-8258](https://uk.rs-online.com/web/p/dc-dc-converters/4338258) |
| F1       | Power supply    | [1A resettable fuse](https://docs.rs-online.com/ec39/0900766b80bc9043.pdf) | [657-1772](https://uk.rs-online.com/web/p/resettable-fuses/6571772) |
| U2       | CAN interface   | [MCP2551-I/P CAN transceiver](https://docs.rs-online.com/f763/0900766b8140ba57.pdf) | [876-7259](https://uk.rs-online.com/web/p/can-interface-ics/8767259) | 
| C1       | CAN interface | [100nF elctrolytic capacitor](https://docs.rs-online.com/6ccf/0900766b8143e698.pdf)| [862-4146](https://uk.rs-online.com/web/p/aluminium-capacitors/8624146) |
| R1       | CAN interface   | [4K7 0.25W resistor](https://docs.rs-online.com/d566/A700000008919924.pdf) | [707-7260](https://uk.rs-online.com/web/p/through-hole-resistors/7077726) |
| R2       | CAN interface   | [120R 0.5W resistor](https://docs.rs-online.com/1e48/0900766b8157ae0f.pdf) | [707-8154](https://uk.rs-online.com/web/p/through-hole-resistors/7078154) |
| J3       | CAN interface   | [M12 5-pin male connector](https://docs.rs-online.com/6e45/A700000007926144.pdf) | [877-1154](https://uk.rs-online.com/web/p/industrial-circular-connectors/8771154) |
| D9       | Switch input    | [ IN4148 diode]() | |
| R3       | Switch input    | [ 10K 0.5W resistor ]() | |
| R4       | Switch input    | [ 100R 0.5W resistor]() | |
| R19      | Switch input    |


### Assembly

Components must be placed and soldered with care taken to ensure
correct orientation and polarity.

The host NMEA bus can be wired directly to J1 or (and preferably)
ENCLOSURE can be drilled to accommodate J3 and J3's flying leads
connected to J1 or soldered directly to the PCB.

D9 through D17 can be soldered with long leads and holes drilled in
ENCLOSURE to expose the LED or (and preferably), they can each be
mounted with CLIP to ENCLOSURE and trailing leads used to connect
back to the PCB mounting location.
The latter approach means exact positioning of the holes which
expose the PCB mounted LEDs is not required.

## Use

### Configuration

1. It will almost always be simpler to configure the module on the bench
   and then install it in its normal operating location.

2. Begin configuration by exposing the module PCB.

3. Configure bus termination.
   Set SW2[T] to ON(1) if the module will be connected as a terminating node
   at the end of its host NMEA bus backbone; or
   set SW2[T] to OFF(0) if the module will be connected to its host NMEA bus
   via a T-connector and drop cable.

4. Configure bus ground.
   Set SW2[G] to ON(1) to connect the NMEA bus shield to the module GND.
   Set SW2[G] to OFF(0) to isolate the NMEA bus shield from the module GND.
   Usually it is appropriate to set SW2[G] to OFF(0).

5. Configure switchbank instance address.
   Set SW1[1..8] to a binary representation of your chosen, unique, instance
   address in the range 0 through 252.
   Setting an address outside this range will disable the module.
   SW1[1] sets address bit 0; SW1[8] sets address bit 7.
   
### Connecting switch inputs

1. Connect a reference switch input ground to J2[9].

2. Connect up to a maximum of eight switch inputs to J2[1..8].
   Each input must supply an ON voltage in the range 5VDC through 50VDC
   relative to J2[9].
   Each input must be able to source around 10mA necessary to drive the
   opto-isolation input circuitry.
