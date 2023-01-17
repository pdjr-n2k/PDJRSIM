# SIM108 - NMEA 2000 switch input module

**SIM108** is an eight channel NMEA 2000 switch input module.

The module presents on the NMEA bus as a switch bank device with
Class Code 30 (Electrical Distribution) and Function Code 130 (Binary
Event Monitor) and reports its status through transmission of
PGN 127501 Binary Status Report messages.

The module is powered from the host NMEA bus and has an LEN of 0.5.

**SIM108** is a specialisation of
[NOP100](https://github.com/preeve9534/NOP100).

## Switch inputs

**SIM108** supports eight debounced input channels each of which is
optically isolated and reverse polarity protected with reference to
a common ground.

A voltage of between 5VDC and 50VDC on an input channel is interpreted
as an ON condition for that channel.
When ON the nominal current draw per channel from the external source
is 8mA at 12VDC, 10mA at 24VDC.

## Status reporting

**SIM108** uses PGN 127501 to report the switch bank status.

By default a status report is transmitted once every two seconds or
immediately a state change is detected on an input channel.
The transmission interval can be configured by the user.

## Module configuration

See [Appendix I - Module configuration parameters](#appendix-i---module-configuration-parameters).

The module must be configured with a module instance number before use.

### Setting the module's instance number

1. Enter the value 0x01 on the ADDR/VALUE DIL switch.
2. Press and hold the PRG button for 1s and then release.
   The transmit LED will commence flashing.
3. Enter the module instance number you wish to use on the ADDR/VALUE
   DIL switch.
4. Press and release the PRG button.
   The transmit LED will stop flashing.

The module will immediately begin transmitting status report messages
on the new instance number.

Select your instance number with care: the number used must not be in
use by any other switch bank on the host NMEA bus and must be in the
range 0 through 252.

You can disable the module by setting its instance number to 0xff.

### Setting the module's default transmission interval

In most cases the default transmission interval of two seconds will
not need to be altered.
The NMEA 2000 specification proposes two seconds as an appropriate
minimum transmission interval for PGN 127501 and it is sensible to
respect this constraint.

If you do wish to change the transmission rate, then:

1. Enter the value 0x02 on the ADDR/VALUE DIL switch.
2. Press and hold the PRG button for 1s and then release.
   The transmit LED will commence flashisng.
3. Enter your required transmission interval in seconds on the
   ADDR/VALUE DIL switch.
4. Press and release the PRG button.
   The transmit LED will stop flashing.

The module will immediately begin transmitting status report messages
at the new transmission rate.

## Connecting switch inputs

1. Connect a reference switch input ground to J1[1].

2. Connect up to a maximum of eight switch inputs to J1[2..9].
   Each input must supply an ON voltage in the range 5VDC through 50VDC
   relative to J1[1].
   Each input must be able to source around 10mA necessary to drive the
   opto-isolation input circuitry.

## Appendix I - Module configuration parameters

| Address | Name                             | Default value | Description                                        |
| :---:   | :---                             | :---:         | :---                                               |
| 0x00    | CAN SOURCE ADDRESS               | 0x22          | RESERVED                                           |
| 0x01    | MODULE INSTANCE NUMBER           | 0xFF          | Module instance number in the range 0 through 252. |
| 0x02    | PGN 127501 TRANSMISSION INTERVAL | 0x04          | Basic transmission interval in seconds.            |
