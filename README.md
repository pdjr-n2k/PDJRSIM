# SIM108 - NMEA 2000 switch input module

__SIM108__ is an NMEA 2000 switch input module that supports eight
SPST input channels.

Channel state information is transmitted over NMEA 2000 using 
[PGN 127501 Binary Status Report]().

Multiple __SIM108__ modules can be installed on a single NMEA bus.

## Design criteria

1. Easy bus connection by a standard M12 5-pin plug.
2. Will operate as either a bus drop or a bus termination node.
3. Powered directly from the NMEA bus.
4. Supports arbitrary SPST DC inputs with voltages in the range 5-50VDC.
5. NMEA connection and input channel status indicated by LEDs.
6. Module instance number is field configurable.
7. Easy assembly afforded by PCB with well marked component locations and 100% through-hole mounting.

## Implementation notes

1. Bus connection by screw termination block or optional M12 5-pin plug.
2. DIL switch selectable 120 Ohm bus termination resistor.
3. Module has a bus LEN of 0.5.
4  Input channels are optically isolated and support signal voltages in the range 5VDC through 50VDC relative to a single common signal ground. Input channel current draw is 8mA at 12VDC, 10mA at 24VDC.
5. Power LED flashes each time the module transmits onto the NMEA bus. Channel LEDs report transmitted status.
6. Module instance number set by DIL switch.

### PCB

The module PCB is a 75mm x 75mm square. 

![Fig 2: PCB layout](images/SIM108.brd.svg)

### Electronic components

| Component   | Description                                     | Further information
|------------ |------------------------------------------------ |--------------------- |
| C1          | 1000uF aluminium capacitor                      | [711-1148](https://uk.rs-online.com/web/p/aluminium-capacitors/7111148)
| C2,C3       | 100nF ceramic capacitor]                        | [538-1427](https://uk.rs-online.com/web/p/mlccs-multilayer-ceramic-capacitors/5381427)
| D1,D2,D3,D4 | 2V 1.8mm rectangular LED                        | [229-2425](https://uk.rs-online.com/web/p/leds/2292425)
| D5          | 2V 3.0mm circular LED                           | [228-5916](https://uk.rs-online.com/web/p/leds/2285916)
| F1          | ECE BU135 1.35A polymer fuse                    | [ECE](https://www.ece.com.tw/images/cgcustom/file020170930043926.pdf)
| J1,J2       | Phoenix Contact FK-MPT terminal block 1x8 3.5mm | [229-2425](https://uk.rs-online.com/web/p/pcb-terminal-blocks/8020169)
| J3          | Phoenix Contact MPT terminal block 1x5 2.54"    | [220-4298](https://uk.rs-online.com/web/p/pcb-terminal-blocks/2204298)
| R1,R10-R13  | 390R 0.25W resistor                             | [707-7634](https://uk.rs-online.com/web/p/through-hole-resistors/7077634)
| R3-R9       | 2K2 0.25W resistor                              | [707-7690](https://uk.rs-online.com/web/p/through-hole-resistors/7077690)
| R14         | 120R 0.25W resistor                             | [707-7599](https://uk.rs-online.com/web/p/through-hole-resistors/7077599)
| SW1         | 6mm momentary push button                       | Sourced from eBay
| SW2         | 2-way SPST DIP switch                           | [177-4261](https://uk.rs-online.com/web/p/dip-sip-switches/1774261)
| SW3         | 8-way SPST DIP switch                           | [756-1347](https://uk.rs-online.com/web/p/dip-sip-switches/7561347)
| U1          | PJRC Teensy 3.2 MCU                             | [PJRC](https://www.pjrc.com/store/teensy32.html)
| U2          | TracoPower TMR-1-1211 DC-DC converter           | [781-3190](https://uk.rs-online.com/web/p/dc-dc-converters/7813190)
| U3          | MCP2551-I/P CAN transceiver                     | [040-2920](https://uk.rs-online.com/web/p/can-interface-ics/0402920)
| SENSORS     | LM335Z - if you choose to make your own sensors | [159-4685](https://uk.rs-online.com/web/p/temperature-humidity-sensor-ics/1594685)

### Suggested hardware

| Component   | Description                                     | Further information
|------------ |------------------------------------------------ |--------------------- |
| ENCLOSURE   | Plastic, general purpose, flange mount box      | [919-0391](https://uk.rs-online.com/web/p/general-purpose-enclosures/9190391)
| J4          | M12 5-pin male NMEA bus connector               | [877-1154](https://uk.rs-online.com/web/p/industrial-circular-connectors/8771154)
| CLIP        | 3mm LED panel clip                              | Sourced from eBay

### Assembly

All components need to be placed and soldered with care taken to
ensure correct orientation and polarity.

The host NMEA bus can be wired directly to J2 or (and preferably)
ENCLOSURE can be drilled to accommodate J? and J?'s flying leads
connected to J2.

D9 through D17 can be soldered with long leads and holes drilled in
ENCLOSURE to expose the LED or (and preferably) preferably, they can
each be mounted with CLIP to ENCLOSURE and trailing leads used to
connect back to the PCB mounting location.
The latter approach means exact positioning of the holes which
expose the PCB mounted LEDs is not required except, of course, that
chassis mounted LEDs must not foul a PCB component or cable path.

## Module configuration

1. It will almost always be simpler to configure the module on the bench
   and then install it in its normal operating location.

2. Begin configuration by exposing the module PCB.

3. Set SW1 switch 'T' to position 'T' if the module is mounted at the end
   of its host NMEA bus backbone, otherwise set SW1 switch 'T' to position
   'D' and connect the module to an NMEA drop cable.

4. Set SW1 switch 'G' to ON to connect the NMEA bus shield to the module
   GND.  Usually it is appropriate to leave SW1 switch 'G' in the OFF
   position.

5. Set SW2 to your chosen, unique, NMEA instance address by entering a binary
   representation of the address on SW2 switches 1 through 8. Switch 1 is
   the binary HI bit (128 decimal); switch 8 is the binary LO bit.

### Connecting switch inputs

Inputs connected to J1.2 through J1.9 must be DC voltages in the range
5VDC through 50VDC relative to a single, common, ground connection
which must be made to J1.1.

Each input must be able to source around 10mA necessary to drive the
opto-isolation input circuitry.

Once a connection is made, the channel LED (D8 through D17) will indicate
the connection state in real time.
