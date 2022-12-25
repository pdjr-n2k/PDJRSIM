# SIM108 - NMEA 2000 switch input module

**SIM108** is a specialisation of
[NOP100](https://github.com/preeve9534/NOP100).
which implements an NMEA 2000 switchbank with support for eight switch
input channels.

The module presents on the NMEA bus as a device with Class Code 30
(Electrical Distribution) and Function Code 130 (Binary Event
Monitor) and reports its status through transmission of
[PGN 127501 Binary Status Report]()
messages.

**SIM108** is powered from the host NMEA bus and has an LEN of 0.5.

The switch input sub-system consists of eight debounced input channels
each of which is optically isolated and reverse polarity protected with
reference to a shared common ground.

An input voltage of between 5VDC and 50VDC is interpreted as an ON
condition and when ON the nominal current draw per input channel is 8mA
at 12VDC, 10mA at 24VDC.

By default **SIM108** transmits a PGN 127501 Binary Status Report once
every four seconds or immediately a state change is detected on an
input channel.
The default reporting interval can be configured by the user.

## Module configuration

**SIM108** uses the basic configuration mechanism provided by NOP100
and must be configured with a module instance number before use.
The following configuration parameter are available.

| Parameter |
| 0x01 MODULE INSTANCE NUMBER | 0xFF | This parameter must be assigned a value in the range 0 through 252. |
| 0x02 PGN 127501 TRANSMISSION INTERVAL | 0x04 | Basic transmission interval in seconds. |

### Setting the module's instance number

Enter the module instance number you wish to use on the ADDR/VALUE DIL
switch a press and release PRG.
The module will immediately begin transmitting status report messages
on the new instance number.

### Setting the module's default transmission interval

In most cases the default transmission interval of four seconds (which
conforms to the requirements of the NMEA 2000 standard) will not need
to be altered.

If you do wish to change the rate, then enter the value 2 on the
ADDR/VALUE DIL switch and press and hold the PRG button for two seconds
and then release.
The module's transmit LED will begin to flash rapidly.
Enter your required default transmission interval in seconds on the
ADDR/VALUE DIL switch and press and release PRG.
The new transmission rate will be applied the next time to module is
power cycled.

## Connecting switch inputs

1. Connect a reference switch input ground to J1[1].

2. Connect up to a maximum of eight switch inputs to J1[2..9].
   Each input must supply an ON voltage in the range 5VDC through 50VDC
   relative to J1[1].
   Each input must be able to source around 10mA necessary to drive the
   opto-isolation input circuitry.
