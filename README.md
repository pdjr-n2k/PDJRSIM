# SIM108 - NMEA 2000 switch input module

**SIM108** is an NMEA 2000 switch input module that supports eight
SPST input channels.

Channel state information is transmitted over NMEA 2000 using 
[PGN ?????? Switch Input State](https://www.nmea.org/Assets/nmea%202000%20pgn%20130316%20corrigenda%20nmd%20version%202.100%20feb%202015.pdf).

Multiple __SIM108__ modules can be installed on a single NMEA bus.

## State of development

A complete, functional, implementation is available as
[SIM108.1]().
Key features of the design/implementation are: 

1. Easy bus connection by a standard M12 5-pin plug.
2. Installer selectable 120 Ohm termination resistor allows
   connection as either a bus drop or a bus termination node.
3. Powered directly from the NMEA bus with an LEN of 1.
4. Supports the of arbitrary SPST DC inputs with voltages in
   the range 5-50VDC.
5. NMEA connection and input channel status indicated by
   externally visible LEDs.
6. Field configurable through DIL-switch based instance number
   selection.
7. Easy assembly afforded by PCB with well marked component
   locations and 100% through-hole mounting.
8. Support for remote configuration of the module is not currently
   available, but is a work in progress.


## Hardware

Input channels are optically isolated and support signal voltages in
the range 5VDC through 50VDC relative to a single common signal ground.

Channel state output leds are driven by an eight channel shift register.

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

It will almost always be simpler to configure the module on the bench
and then install it in its normal operating location.

Begin configuration by exposing the module PCB.

Make sure that the module is properly terminated for its method of
connection to the NMEA bus by performing any required hardware
configuration (see below).

Connect the module to the host NMEA bus: the module will boot into normal
service and the PWR LED will flash each time a message is transmitted to
the NMEA bus. 

### Hardware configuration

The SW1 switch labelled 'T' allows a 120 Ohm terminating resistor to be
connected across the NMEA data bus.
Switch SW1.T OFF if you install the module via a T-connector and drop
cable or switch it ON if you install the module as a terminating device
on your NMEA bus backbone.

The SW1 switch lagelled 'G' connects the NMEA bus shield to the module
GND when it is in the ON position.
Usually it is appropriate to leave SW1.G OFF.

The module must be assigned a unique NMEA instance address (that is unique
amongst all switch bank devices installed on your NMEA bus). Set this
address by entering a binary representation on SW2.

### Connecting switch inputs

Inputs connected to J1.2 through J1.9 must be DC voltages in the range
5VDC through 50VDC relative to a single, common, ground connection
which must be made to J1.1.

Each input must be able to source around 10mA necessary to drive the
opto-isolation input circuitry.

Once a connection is made, the channel LED (D8 through D17) will indicate
the connection state in real time.