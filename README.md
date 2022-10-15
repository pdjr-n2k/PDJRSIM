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
supply, CAN interface, configuration, display and switch input
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

| REF                                | Type | Qtty | Component                                 | Purchase |
| :---                               | :--- | ---: | :---                                      | :--
| ENC                                |      | 1    | Hammond 1591 Series Flanged ABS Enclosure | [741-7477](https://uk.rs-online.com/web/p/general-purpose-enclosures/7417477) |
| PCB                                |      | 1    | PCB 2-layer 100 x 85                      | [](./ROM104.brd.pdf) |
| C1,C2,C3,C4                        | THT  | 4    | 100nF electrolytic capacitor              | [862-4146](https://uk.rs-online.com/web/p/aluminium-capacitors/8624146) |
| C5,C6,C7,C8,C9,C10,C11,C12         | SMD  | 8    | 100nF aluminium capacitor                 | [838-8005](https://uk.rs-online.com/web/p/aluminium-capacitors/8388005) |
| D1,D2,D3,D4,D5,D6,D7,D8,D9         | THT  | 9    | 2mm rectangular LED                       | [229-2447](https://uk.rs-online.com/web/p/leds/2292447) |
| D10,D11,D12,D13,D14,D15,D16,D17    | THT  | 8    | 1N4148 300mA diode                        | [739-0290](https://uk.rs-online.com/web/p/switching-diodes/7390290) |
| F1                                 | THT  | 1    | 1A resettable fuse                        | [657-1772](https://uk.rs-online.com/web/p/resettable-fuses/6571772) |
| J1                                 | THT  | 1    | PCB terminal header 5mm x 9               | [657-1772](https://uk.rs-online.com/web/p/pcb-headers/8971200) |
| J2                                 | ---  | 1    | M12 5-pin male connector                  | [877-1154](https://uk.rs-online.com/web/p/industrial-circular-connectors/8771154) |
| Q1,Q3,Q5,Q7,Q9,Q11,Q13,Q15         | THT  | 8    | BC547 NPN transistor                      | [671-1113](https://uk.rs-online.com/web/p/bipolar-transistors/6711113) |
| Q2,Q4,Q6,Q8,Q10,Q12,Q14,Q16        | THT  | 8    | BC337-40 bipolar transistor               | []() |
| R1,R6,R9,R12,R15,R18,R21,R24,R27   | THT  | 9    | 4K7 0.25W resistor                        | []() |
| R2                                 | THT  | 1    | 120R 0.5W resistor]()                     | []() |
| R3,R28,R29,R30,R31,R32,R33,R34,R35 |                              | THT  | 1    | 470R 0.25W resistor]()                    | []() |
| R4,R7,R10,R13,R16,R19,R22,R25      | THT  | 8    | 10K 0.5W resistor]()                      | []() |
| R5,R8,R11,R14,R17,R20,R23,R26      | THT  | 8    | 100R 0.25W resistor]()                    | []() |

| SW1                                | THT  | 1    | Push-button 10mm                          | [010-2327](https://uk.rs-online.com/web/p/keyboard-switches/0102327) |
| SW2                                | THT  | 1    | DIP switch 8-channel                      | [756-1347](https://uk.rs-online.com/web/p/dip-sip-switches/7561347/) |
| SW3                                | THT  | 1    | DIP switch 2-channel                      | [177-4261](https://uk.rs-online.com/web/p/dip-sip-switches/1774261) |
| U1                                 | THT  | 1    | MCP2551-I-P CAN transceiver               | [402-920](https://uk.rs-online.com/web/p/can-interface-ics/402-920) |
| U2                                 | THT  | 1    | TracoPower TMR-2411 DC-DC converter       | [433-8258](https://uk.rs-online.com/web/p/dc-dc-converters/4338258) |
| U3,U7,U9,U11,U13,U15,U17,U19,U21   | SMD  | 9    | MAX6816 switch debouncer                  | [189-9248](https://uk.rs-online.com/web/p/bounce-eliminator-ics/1899248) |
| U4                                 | THT  | 1    | 74HC595 shift register                    | [709-1971](https://uk.rs-online.com/web/p/counter-ics/7091971) |
| U5                                 | THT  | 1    | PJRC Teensy 3.2 MCU                       | [](https://www.pjrc.com/store/teensy32.html) |
| U6,U8,U10,U12,U14,U16,U18,U20      | THT  | 8    | SFH617A optocoupler                       | [180-7182](https://uk.rs-online.com/web/p/optocouplers/1807182) |

### Assembly

1. Components must be placed and soldered with care taken to ensure
   correct orientation and polarity.
   
2. The flying leads of the host NMEA bus connector (J2) can be
   soldered directly to the PCB, but, if desired, a screw connector
   block can be installed on the PCB to enable a demountable
   connection.
   
3. LEDs D1 through D9 can be routed to the enclosure using LED light
   pipes (not included in parts list).

## Use

### Configuration

1. It will almost always be simpler to configure the module on the bench
   and then install it in its normal operating location.

2. Begin configuration by exposing the module PCB.

3. Configure bus termination.
   Set SW3[T] to ON(1) if the module will be connected as a terminating node
   at the end of its host NMEA bus backbone; or
   set SW3[T] to OFF(0) if the module will be connected to its host NMEA bus
   via a T-connector and drop cable.

4. Configure bus ground.
   Set SW3[G] to ON(1) to connect the NMEA bus shield to the module GND.
   Set SW3[G] to OFF(0) to isolate the NMEA bus shield from the module GND.
   Usually it is appropriate to set SW2[G] to OFF(0).

5. Configure switchbank instance address.
   Set SW2[1..8] to a binary representation of your chosen, unique, instance
   address in the range 0 through 252.
   Setting an address outside this range will disable the module.
   SW2[1] sets address bit 0; SW2[8] sets address bit 7.
   
### Connecting switch inputs

Switch inputs shopuld be connected to an appropriate pluggable screw terminal.

1. Connect a reference switch input ground to J1[1].

2. Connect up to a maximum of eight switch inputs to J1[2..9].
   Each input must supply an ON voltage in the range 5VDC through 50VDC
   relative to J1[1].
   Each input must be able to source around 10mA necessary to drive the
   opto-isolation input circuitry.
