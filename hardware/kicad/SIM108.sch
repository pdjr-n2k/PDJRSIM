EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 9
Title "SIM108 Switch Input Module"
Date "2022-06-11"
Rev "2.0.0"
Comp "PDJR <preeve@pdjr.eu>"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	13250 2450 13800 2450
Wire Wire Line
	12600 2000 12300 2000
Wire Wire Line
	12300 2000 12300 2500
Wire Wire Line
	12600 2100 12500 2100
Wire Wire Line
	12500 2450 13050 2450
Wire Wire Line
	13800 2450 13800 2100
Wire Wire Line
	13800 2100 13700 2100
Text Label 13700 1600 0    50   ~ 0
CAN_RX
Text Label 13700 1700 0    50   ~ 0
CAN_TX
$Comp
L power:GND #PWR025
U 1 1 6336012A
P 12300 2500
F 0 "#PWR025" H 12300 2250 50  0001 C CNN
F 1 "GND" H 12305 2327 50  0000 C CNN
F 2 "" H 12300 2500 50  0001 C CNN
F 3 "" H 12300 2500 50  0001 C CNN
	1    12300 2500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR026
U 1 1 6336012B
P 12500 2500
F 0 "#PWR026" H 12500 2350 50  0001 C CNN
F 1 "+5V" H 12515 2673 50  0000 C CNN
F 2 "" H 12500 2500 50  0001 C CNN
F 3 "" H 12500 2500 50  0001 C CNN
	1    12500 2500
	-1   0    0    1   
$EndComp
Wire Wire Line
	12500 2500 12500 2450
Connection ~ 12500 2450
$Comp
L power:GND #PWR027
U 1 1 6096FBD9
P 13800 2500
F 0 "#PWR027" H 13800 2250 50  0001 C CNN
F 1 "GND" H 13805 2327 50  0000 C CNN
F 2 "" H 13800 2500 50  0001 C CNN
F 3 "" H 13800 2500 50  0001 C CNN
	1    13800 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	13800 2500 13800 2450
Connection ~ 13800 2450
Wire Wire Line
	12500 2100 12500 2450
$Comp
L SIM108-rescue:Teensy_3.2-pdjr U5
U 1 1 60F2AB82
P 13700 2100
F 0 "U5" H 13850 550 50  0000 C CNN
F 1 "Teensy_4.0" H 14000 650 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_LongPads" H 13700 2100 50  0001 C CNN
F 3 "" H 13700 2100 50  0001 C CNN
	1    13700 2100
	-1   0    0    1   
$EndComp
NoConn ~ 13150 600 
NoConn ~ 13050 600 
NoConn ~ 12950 600 
Text Label 12600 1800 2    50   ~ 0
CH0
Text Label 12600 1700 2    50   ~ 0
CH1
Text Label 12600 1600 2    50   ~ 0
CH2
Text Label 12600 1500 2    50   ~ 0
CH3
Text Label 12600 1400 2    50   ~ 0
CH4
Text Label 12600 1300 2    50   ~ 0
CH5
Text Label 12600 1200 2    50   ~ 0
CH6
Text Label 12600 1100 2    50   ~ 0
CH7
$Comp
L Connector:Screw_Terminal_01x09 J1
U 1 1 62D3957B
P 800 2200
F 0 "J1" H 800 2700 50  0000 C CNN
F 1 "Screw_Terminal_01x09" H 800 2700 50  0001 C CNN
F 2 "PDJR_Connectors:CAMDEN_BOSS_CSTBV2-9_TERMINAL" H 800 2200 50  0001 C CNN
F 3 "~" H 800 2200 50  0001 C CNN
	1    800  2200
	-1   0    0    -1  
$EndComp
Text Label 13700 1900 0    50   ~ 0
MPX_LATCH
Text Label 1000 1900 0    50   ~ 0
SPST_CH0
Text Label 1000 1800 0    50   ~ 0
SPST_GND
Text Label 1000 2000 0    50   ~ 0
SPST_CH1
Text Label 1000 2100 0    50   ~ 0
SPST_CH2
Text Label 1000 2200 0    50   ~ 0
SPST_CH3
Text Label 1000 2300 0    50   ~ 0
SPST_CH4
Text Label 1000 2400 0    50   ~ 0
SPST_CH5
Text Label 1000 2500 0    50   ~ 0
SPST_CH6
Text Label 1000 2600 0    50   ~ 0
SPST_CH7
Text Notes 900  1250 0    50   ~ 0
Opto-isolated SPST inputs. Each opto-isolator\nis driven by a constant current source which\noperates the isolator LED at 6mA from voltages\nin the range 5VDC through 50VDC.
$Sheet
S 3750 700  1100 400 
U 62FB7846
F0 "OII_00" 50
F1 "opto_isolated_input.sch" 50
F2 "OII_IN" I L 3750 900 50 
F3 "OII_IN_GND" U L 3750 1000 50 
F4 "OII_OUT" O R 4850 900 50 
F5 "OII_OUT_GND" U R 4850 1000 50 
F6 "OII_OUT_VCC" I R 4850 800 50 
$EndSheet
Text Label 3650 900  2    50   ~ 0
SPST_CH0
Text Label 3650 1000 2    50   ~ 0
SPST_GND
Text Label 4950 900  0    50   ~ 0
CH0
$Comp
L power:GND #PWR06
U 1 1 63004795
P 4950 1000
F 0 "#PWR06" H 4950 750 50  0001 C CNN
F 1 "GND" H 4950 850 50  0000 C CNN
F 2 "" H 4950 1000 50  0001 C CNN
F 3 "" H 4950 1000 50  0001 C CNN
	1    4950 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 1000 4950 1000
Wire Wire Line
	4950 800  4850 800 
Wire Wire Line
	3650 1000 3750 1000
Wire Wire Line
	3650 900  3750 900 
Text Label 3650 1550 2    50   ~ 0
SPST_CH1
Text Label 3650 1650 2    50   ~ 0
SPST_GND
Text Label 4950 1550 0    50   ~ 0
CH1
$Comp
L power:GND #PWR08
U 1 1 630DCFD4
P 4950 1650
F 0 "#PWR08" H 4950 1400 50  0001 C CNN
F 1 "GND" H 4950 1500 50  0000 C CNN
F 2 "" H 4950 1650 50  0001 C CNN
F 3 "" H 4950 1650 50  0001 C CNN
	1    4950 1650
	1    0    0    -1  
$EndComp
$Sheet
S 3750 2000 1100 400 
U 63103CAF
F0 "OII_02" 50
F1 "opto_isolated_input.sch" 50
F2 "OII_IN" I L 3750 2200 50 
F3 "OII_IN_GND" U L 3750 2300 50 
F4 "OII_OUT" O R 4850 2200 50 
F5 "OII_OUT_GND" U R 4850 2300 50 
F6 "OII_OUT_VCC" I R 4850 2100 50 
$EndSheet
Wire Wire Line
	4850 2300 4950 2300
Wire Wire Line
	3750 2300 3650 2300
Wire Wire Line
	3750 2200 3650 2200
Text Label 3650 2200 2    50   ~ 0
SPST_CH2
Text Label 3650 2300 2    50   ~ 0
SPST_GND
Text Label 4950 2200 0    50   ~ 0
CH2
$Comp
L power:GND #PWR010
U 1 1 6316C272
P 4950 2300
F 0 "#PWR010" H 4950 2050 50  0001 C CNN
F 1 "GND" H 4950 2150 50  0000 C CNN
F 2 "" H 4950 2300 50  0001 C CNN
F 3 "" H 4950 2300 50  0001 C CNN
	1    4950 2300
	1    0    0    -1  
$EndComp
$Sheet
S 3750 2650 1100 400 
U 62F64647
F0 "OOI_03" 50
F1 "opto_isolated_input.sch" 50
F2 "OII_IN" I L 3750 2850 50 
F3 "OII_IN_GND" U L 3750 2950 50 
F4 "OII_OUT" O R 4850 2850 50 
F5 "OII_OUT_GND" U R 4850 2950 50 
F6 "OII_OUT_VCC" I R 4850 2750 50 
$EndSheet
Wire Wire Line
	4850 2750 4950 2750
Wire Wire Line
	4850 2850 4950 2850
Wire Wire Line
	3750 2850 3650 2850
Text Label 4950 2850 0    50   ~ 0
CH3
$Comp
L power:GND #PWR012
U 1 1 62FC668A
P 4950 2950
F 0 "#PWR012" H 4950 2700 50  0001 C CNN
F 1 "GND" H 4950 2800 50  0000 C CNN
F 2 "" H 4950 2950 50  0001 C CNN
F 3 "" H 4950 2950 50  0001 C CNN
	1    4950 2950
	1    0    0    -1  
$EndComp
Text Label 3650 2850 2    50   ~ 0
SPST_CH3
Text Label 3650 2950 2    50   ~ 0
SPST_GND
$Sheet
S 5750 700  1100 400 
U 62FD589D
F0 "OOI_04" 50
F1 "opto_isolated_input.sch" 50
F2 "OII_IN" I L 5750 900 50 
F3 "OII_IN_GND" U L 5750 1000 50 
F4 "OII_OUT" O R 6850 900 50 
F5 "OII_OUT_GND" U R 6850 1000 50 
F6 "OII_OUT_VCC" I R 6850 800 50 
$EndSheet
Wire Wire Line
	6850 800  6950 800 
Wire Wire Line
	6850 900  6950 900 
Wire Wire Line
	5750 900  5650 900 
Text Label 5650 900  2    50   ~ 0
SPST_CH4
Text Label 5650 1000 2    50   ~ 0
SPST_GND
Text Label 6950 900  0    50   ~ 0
CH4
$Comp
L power:GND #PWR016
U 1 1 6303B8FF
P 6950 1000
F 0 "#PWR016" H 6950 750 50  0001 C CNN
F 1 "GND" H 6950 850 50  0000 C CNN
F 2 "" H 6950 1000 50  0001 C CNN
F 3 "" H 6950 1000 50  0001 C CNN
	1    6950 1000
	1    0    0    -1  
$EndComp
$Sheet
S 5750 1350 1100 400 
U 63041ECA
F0 "OOI_05" 50
F1 "opto_isolated_input.sch" 50
F2 "OII_IN" I L 5750 1550 50 
F3 "OII_IN_GND" U L 5750 1650 50 
F4 "OII_OUT" O R 6850 1550 50 
F5 "OII_OUT_GND" U R 6850 1650 50 
F6 "OII_OUT_VCC" I R 6850 1450 50 
$EndSheet
Wire Wire Line
	6850 1450 6950 1450
Wire Wire Line
	6850 1550 6950 1550
Wire Wire Line
	5750 1550 5650 1550
Text Label 5650 1550 2    50   ~ 0
SPST_CH5
Text Label 5650 1650 2    50   ~ 0
SPST_GND
Text Label 6950 1550 0    50   ~ 0
CH5
$Comp
L power:GND #PWR018
U 1 1 630A99B3
P 6950 1650
F 0 "#PWR018" H 6950 1400 50  0001 C CNN
F 1 "GND" H 6950 1500 50  0000 C CNN
F 2 "" H 6950 1650 50  0001 C CNN
F 3 "" H 6950 1650 50  0001 C CNN
	1    6950 1650
	1    0    0    -1  
$EndComp
$Sheet
S 5750 2000 1100 400 
U 62F45EE0
F0 "OOI_06" 50
F1 "opto_isolated_input.sch" 50
F2 "OII_IN" I L 5750 2200 50 
F3 "OII_IN_GND" U L 5750 2300 50 
F4 "OII_OUT" O R 6850 2200 50 
F5 "OII_OUT_GND" U R 6850 2300 50 
F6 "OII_OUT_VCC" I R 6850 2100 50 
$EndSheet
Wire Wire Line
	5750 2200 5650 2200
Wire Wire Line
	6850 2100 6950 2100
Wire Wire Line
	6850 2200 6950 2200
Text Label 5650 2200 2    50   ~ 0
SPST_CH6
Text Label 5650 2300 2    50   ~ 0
SPST_GND
Text Label 6950 2200 0    50   ~ 0
CH6
$Comp
L power:GND #PWR020
U 1 1 62FB7767
P 6950 2300
F 0 "#PWR020" H 6950 2050 50  0001 C CNN
F 1 "GND" H 6950 2150 50  0000 C CNN
F 2 "" H 6950 2300 50  0001 C CNN
F 3 "" H 6950 2300 50  0001 C CNN
	1    6950 2300
	1    0    0    -1  
$EndComp
$Sheet
S 5750 2650 1100 400 
U 62FB890E
F0 "OII_07" 50
F1 "opto_isolated_input.sch" 50
F2 "OII_IN" I L 5750 2850 50 
F3 "OII_IN_GND" U L 5750 2950 50 
F4 "OII_OUT" O R 6850 2850 50 
F5 "OII_OUT_GND" U R 6850 2950 50 
F6 "OII_OUT_VCC" I R 6850 2750 50 
$EndSheet
Wire Wire Line
	6850 2750 6950 2750
Wire Wire Line
	6850 2850 6950 2850
Wire Wire Line
	5750 2850 5650 2850
$Comp
L power:GND #PWR022
U 1 1 6302523E
P 6950 2950
F 0 "#PWR022" H 6950 2700 50  0001 C CNN
F 1 "GND" H 6950 2800 50  0000 C CNN
F 2 "" H 6950 2950 50  0001 C CNN
F 3 "" H 6950 2950 50  0001 C CNN
	1    6950 2950
	1    0    0    -1  
$EndComp
Text Label 5650 2850 2    50   ~ 0
SPST_CH7
Text Label 6950 2850 0    50   ~ 0
CH7
$Comp
L Device:R R1
U 1 1 5F1E6C5E
P 1750 6950
F 0 "R1" H 1700 6950 50  0000 R CNN
F 1 "4K7 0.125W" V 1750 6950 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1680 6950 50  0001 C CNN
F 3 "~" H 1750 6950 50  0001 C CNN
	1    1750 6950
	-1   0    0    1   
$EndComp
$Comp
L Device:Polyfuse F1
U 1 1 5F2A4B92
P 3800 4950
F 0 "F1" V 3700 4950 50  0000 C CNN
F 1 "1A" V 3900 4950 39  0000 C CNN
F 2 "Fuse:Fuse_Littelfuse_395Series" H 3850 4750 50  0001 L CNN
F 3 "~" H 3800 4950 50  0001 C CNN
	1    3800 4950
	0    1    1    0   
$EndComp
$Comp
L Interface_CAN_LIN:MCP2551-I-P U1
U 1 1 5F1D12F5
P 2350 6350
F 0 "U1" H 2550 6700 50  0000 C CNN
F 1 "MCP2551-I-P" H 2600 6000 39  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 2350 5850 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/devicedoc/21667d.pdf" H 2350 6350 50  0001 C CNN
	1    2350 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 7100 2350 7100
Connection ~ 1750 7100
Wire Wire Line
	1850 6550 1750 6550
Wire Wire Line
	1750 6550 1750 6800
Wire Wire Line
	1550 6750 2350 6750
Wire Wire Line
	1550 5850 2350 5850
Wire Wire Line
	2350 5850 2350 5950
Connection ~ 1550 5850
Text Label 4200 6250 2    50   ~ 0
CAN_H
Text Label 4200 6450 2    50   ~ 0
CAN_L
Wire Wire Line
	3400 4950 3550 4950
Text Label 4200 5350 2    50   ~ 0
NET_C
Wire Wire Line
	2350 6750 2350 7100
Connection ~ 2350 6750
NoConn ~ 1850 6450
$Comp
L power:+5V #PWR01
U 1 1 5FC3AC81
P 1000 4950
F 0 "#PWR01" H 1000 4800 50  0001 C CNN
F 1 "+5V" V 1015 5078 50  0000 L CNN
F 2 "" H 1000 4950 50  0001 C CNN
F 3 "" H 1000 4950 50  0001 C CNN
	1    1000 4950
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5FC3B74A
P 1000 5350
F 0 "#PWR02" H 1000 5100 50  0001 C CNN
F 1 "GND" V 1005 5222 50  0000 R CNN
F 2 "" H 1000 5350 50  0001 C CNN
F 3 "" H 1000 5350 50  0001 C CNN
	1    1000 5350
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR03
U 1 1 63360127
P 1000 5850
F 0 "#PWR03" H 1000 5700 50  0001 C CNN
F 1 "+5V" V 1015 5978 50  0000 L CNN
F 2 "" H 1000 5850 50  0001 C CNN
F 3 "" H 1000 5850 50  0001 C CNN
	1    1000 5850
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5FC44BAE
P 1000 7100
F 0 "#PWR04" H 1000 6850 50  0001 C CNN
F 1 "GND" V 1000 6900 50  0000 C CNN
F 2 "" H 1000 7100 50  0001 C CNN
F 3 "" H 1000 7100 50  0001 C CNN
	1    1000 7100
	0    1    1    0   
$EndComp
Wire Wire Line
	1000 5850 1550 5850
Text Label 700  6750 0    50   ~ 0
CAN_RX
Text Label 700  6650 0    50   ~ 0
CAN_TX
Wire Wire Line
	3900 7100 3900 6900
Wire Wire Line
	3900 6900 4200 6900
Wire Wire Line
	3900 7100 4600 7100
Text Notes 650  4750 0    50   ~ 10
POWER SUPPLY & CAN INTERFACE
Text Label 4200 6900 0    50   ~ 0
CAN_SCR
Wire Wire Line
	3400 5350 3550 5350
Wire Wire Line
	1550 6350 1550 5850
Wire Wire Line
	1550 6750 1550 6550
$Comp
L power:PWR_FLAG #FLG01
U 1 1 6336012D
P 3550 4950
F 0 "#FLG01" H 3550 5025 50  0001 C CNN
F 1 "PWR_FLAG" H 3550 5123 50  0001 C CNN
F 2 "" H 3550 4950 50  0001 C CNN
F 3 "~" H 3550 4950 50  0001 C CNN
	1    3550 4950
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 6336012E
P 3550 5350
F 0 "#FLG02" H 3550 5425 50  0001 C CNN
F 1 "PWR_FLAG" H 3550 5523 50  0001 C CNN
F 2 "" H 3550 5350 50  0001 C CNN
F 3 "~" H 3550 5350 50  0001 C CNN
	1    3550 5350
	-1   0    0    1   
$EndComp
Connection ~ 3550 4950
Wire Wire Line
	3550 4950 3650 4950
Connection ~ 3550 5350
Wire Wire Line
	3550 5350 4300 5350
$Comp
L Device:R R2
U 1 1 63360130
P 3700 6600
F 0 "R2" V 3600 6650 50  0000 R CNN
F 1 "120R 0.5W" V 3700 6600 20  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3630 6600 50  0001 C CNN
F 3 "~" H 3700 6600 50  0001 C CNN
	1    3700 6600
	0    -1   -1   0   
$EndComp
Text Label 4200 6600 0    50   ~ 0
TERM_A
Wire Wire Line
	4200 6600 3850 6600
Text Label 4200 6750 0    50   ~ 0
TERM_B
Wire Wire Line
	2850 6250 3450 6250
Wire Wire Line
	3550 6600 3450 6600
Wire Wire Line
	3450 6600 3450 6250
Connection ~ 3450 6250
Wire Wire Line
	3450 6250 4400 6250
Wire Wire Line
	4200 6750 3250 6750
Wire Wire Line
	3250 6750 3250 6450
Connection ~ 3250 6450
Wire Wire Line
	3250 6450 4500 6450
Wire Wire Line
	2850 6450 3250 6450
Text Label 5500 6150 2    50   ~ 0
TERM_A
Text Label 6450 6150 0    50   ~ 0
TERM_B
$Comp
L Connector:Screw_Terminal_01x05 J2
U 1 1 63360129
P 4900 5150
F 0 "J2" H 4900 5450 50  0000 C CNN
F 1 "CAN" H 4900 4850 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 4900 5150 50  0001 C CNN
F 3 "~" H 4900 5150 50  0001 C CNN
	1    4900 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 4950 4150 4950
Wire Wire Line
	4150 4950 4150 5050
Wire Wire Line
	4300 4950 4700 4950
Wire Wire Line
	4300 4950 4300 5350
Wire Wire Line
	4150 5050 4700 5050
Wire Wire Line
	4500 5150 4700 5150
Wire Wire Line
	4500 5150 4500 6450
Wire Wire Line
	4700 5250 4600 5250
$Comp
L Device:LED D1
U 1 1 631C329D
P 9800 3050
F 0 "D1" H 9900 3000 50  0000 C CNN
F 1 "LED" H 9793 2886 50  0001 C CNN
F 2 "LED_THT:LED_D1.8mm_W3.3mm_H2.4mm" H 9800 3050 50  0001 C CNN
F 3 "~" H 9800 3050 50  0001 C CNN
	1    9800 3050
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D6
U 1 1 631D7AEF
P 10100 3150
F 0 "D6" H 10200 3100 50  0000 C CNN
F 1 "LED" H 10093 2986 50  0001 C CNN
F 2 "LED_THT:LED_D1.8mm_W3.3mm_H2.4mm" H 10100 3150 50  0001 C CNN
F 3 "~" H 10100 3150 50  0001 C CNN
	1    10100 3150
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D2
U 1 1 631D7EE7
P 9800 3250
F 0 "D2" H 9900 3200 50  0000 C CNN
F 1 "LED" H 9793 3086 50  0001 C CNN
F 2 "LED_THT:LED_D1.8mm_W3.3mm_H2.4mm" H 9800 3250 50  0001 C CNN
F 3 "~" H 9800 3250 50  0001 C CNN
	1    9800 3250
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D7
U 1 1 631D8355
P 10100 3350
F 0 "D7" H 10200 3300 50  0000 C CNN
F 1 "LED" H 10093 3186 50  0001 C CNN
F 2 "LED_THT:LED_D1.8mm_W3.3mm_H2.4mm" H 10100 3350 50  0001 C CNN
F 3 "~" H 10100 3350 50  0001 C CNN
	1    10100 3350
	-1   0    0    1   
$EndComp
$Comp
L SIM108-rescue:TMR_2411-pdjr U2
U 1 1 6327DB22
P 2900 5150
F 0 "U2" H 2900 5500 50  0000 C CNN
F 1 "TMR_2411" H 2900 4800 50  0000 C CNN
F 2 "PDJR_DC-DC_Converters:TMR_2411" H 2900 4800 50  0001 C CNN
F 3 "" H 2900 4650 50  0001 C CNN
	1    2900 5150
	-1   0    0    -1  
$EndComp
Text Label 6450 6250 0    50   ~ 0
CAN_SCR
$Comp
L Switch:SW_DIP_x02 SW3
U 1 1 62A67242
P 5800 6250
F 0 "SW3" H 5800 6100 50  0000 C CNN
F 1 "BUS" H 5800 6500 50  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm_LongPads" H 5800 6250 50  0001 C CNN
F 3 "~" H 5800 6250 50  0001 C CNN
	1    5800 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 5250 4600 7100
Wire Wire Line
	4700 5350 4400 5350
Wire Wire Line
	4400 5350 4400 6250
$Comp
L 74xx:74HC595 U4
U 1 1 6338D277
P 9150 3450
F 0 "U4" H 9400 4000 50  0000 C CNN
F 1 "74HCT595" H 9350 2800 50  0000 C CNN
F 2 "Package_SO:SO-16_3.9x9.9mm_P1.27mm" H 9150 3450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 9150 3450 50  0001 C CNN
	1    9150 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D3
U 1 1 63F004DD
P 9800 3450
F 0 "D3" H 9900 3400 50  0000 C CNN
F 1 "LED" H 9793 3286 50  0001 C CNN
F 2 "LED_THT:LED_D1.8mm_W3.3mm_H2.4mm" H 9800 3450 50  0001 C CNN
F 3 "~" H 9800 3450 50  0001 C CNN
	1    9800 3450
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D8
U 1 1 63F00A5B
P 10100 3550
F 0 "D8" H 10200 3500 50  0000 C CNN
F 1 "LED" H 10093 3386 50  0001 C CNN
F 2 "LED_THT:LED_D1.8mm_W3.3mm_H2.4mm" H 10100 3550 50  0001 C CNN
F 3 "~" H 10100 3550 50  0001 C CNN
	1    10100 3550
	-1   0    0    1   
$EndComp
Wire Wire Line
	9550 3050 9650 3050
Wire Wire Line
	9550 3150 9950 3150
Wire Wire Line
	9550 3250 9650 3250
Wire Wire Line
	9550 3350 9950 3350
Wire Wire Line
	9550 3450 9650 3450
Wire Wire Line
	9550 3550 9950 3550
Wire Wire Line
	9950 3050 10350 3050
Wire Wire Line
	10250 3150 10350 3150
Wire Wire Line
	9950 3250 10350 3250
Wire Wire Line
	10250 3350 10350 3350
Wire Wire Line
	9950 3450 10350 3450
Wire Wire Line
	10250 3550 10350 3550
Text Label 8550 3050 2    50   ~ 0
MPX_DATA
Text Label 8550 3250 2    50   ~ 0
MPX_CLOCK
Text Label 8550 3550 2    50   ~ 0
MPX_LATCH
Wire Wire Line
	9150 4150 9150 4250
Wire Wire Line
	9150 4250 8650 4250
Wire Wire Line
	8650 4250 8650 3650
Wire Wire Line
	8650 3650 8750 3650
Wire Wire Line
	8650 4250 8550 4250
Connection ~ 8650 4250
$Comp
L power:GND #PWR024
U 1 1 640FFD0C
P 8550 4250
F 0 "#PWR024" H 8550 4000 50  0001 C CNN
F 1 "GND" V 8550 4050 50  0000 C CNN
F 2 "" H 8550 4250 50  0001 C CNN
F 3 "" H 8550 4250 50  0001 C CNN
	1    8550 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	8750 3350 8650 3350
Wire Wire Line
	8650 3350 8650 2750
Wire Wire Line
	8650 2750 9150 2750
Wire Wire Line
	9150 2750 9150 2850
Wire Wire Line
	8650 2750 8550 2750
Connection ~ 8650 2750
$Comp
L power:+5V #PWR023
U 1 1 64136A77
P 8550 2750
F 0 "#PWR023" H 8550 2600 50  0001 C CNN
F 1 "+5V" V 8550 2900 50  0000 L CNN
F 2 "" H 8550 2750 50  0001 C CNN
F 3 "" H 8550 2750 50  0001 C CNN
	1    8550 2750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10850 4250 9150 4250
Connection ~ 9150 4250
Wire Wire Line
	8550 3050 8750 3050
Wire Wire Line
	8550 3250 8750 3250
Wire Wire Line
	8550 3550 8750 3550
$Comp
L Device:LED D4
U 1 1 63327BC0
P 9800 3650
F 0 "D4" H 9900 3600 50  0000 C CNN
F 1 "LED" H 9793 3486 50  0001 C CNN
F 2 "LED_THT:LED_D1.8mm_W3.3mm_H2.4mm" H 9800 3650 50  0001 C CNN
F 3 "~" H 9800 3650 50  0001 C CNN
	1    9800 3650
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D9
U 1 1 633284CB
P 10100 3750
F 0 "D9" H 10200 3700 50  0000 C CNN
F 1 "LED" H 10093 3586 50  0001 C CNN
F 2 "LED_THT:LED_D1.8mm_W3.3mm_H2.4mm" H 10100 3750 50  0001 C CNN
F 3 "~" H 10100 3750 50  0001 C CNN
	1    10100 3750
	-1   0    0    1   
$EndComp
Wire Wire Line
	9550 3650 9650 3650
Wire Wire Line
	9550 3750 9950 3750
Wire Wire Line
	9950 3650 10350 3650
Wire Wire Line
	10250 3750 10350 3750
$Comp
L Switch:SW_DIP_x08 SW2
U 1 1 633236F9
P 5800 5350
F 0 "SW2" H 5800 5900 50  0000 C CNN
F 1 "INSTANCE" H 5800 4900 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 5800 5350 50  0001 C CNN
F 3 "~" H 5800 5350 50  0001 C CNN
	1    5800 5350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5200 4950 5200 5050
Wire Wire Line
	5200 6250 5500 6250
Connection ~ 5200 5050
Wire Wire Line
	5200 5050 5200 5150
Connection ~ 5200 5150
Wire Wire Line
	5200 5150 5200 5250
Connection ~ 5200 5250
Wire Wire Line
	5200 5250 5200 5350
Connection ~ 5200 5350
Wire Wire Line
	5200 5350 5200 5450
Connection ~ 5200 5450
Wire Wire Line
	5200 5450 5200 5550
Connection ~ 5200 5550
Wire Wire Line
	5200 5550 5200 5650
Wire Wire Line
	5200 5650 5200 6250
Text Label 6450 4950 0    50   ~ 0
ADDR_0
Text Label 6450 5050 0    50   ~ 0
ADDR_1
Text Label 6450 5150 0    50   ~ 0
ADDR_2
Text Label 6450 5250 0    50   ~ 0
ADDR_3
Text Label 6450 5350 0    50   ~ 0
ADDR_4
Text Label 6450 5450 0    50   ~ 0
ADDR_5
Text Label 6450 5550 0    50   ~ 0
ADDR_6
Text Label 6450 5650 0    50   ~ 0
ADDR_7
Text Label 13700 800  0    50   ~ 0
ADDR_0
Text Label 13700 900  0    50   ~ 0
ADDR_1
Text Label 13700 1000 0    50   ~ 0
ADDR_2
Text Label 13700 1100 0    50   ~ 0
ADDR_3
Text Label 13700 1200 0    50   ~ 0
ADDR_4
Text Label 13700 1300 0    50   ~ 0
ADDR_5
Text Label 13700 1400 0    50   ~ 0
ADDR_6
Text Label 13700 1500 0    50   ~ 0
ADDR_7
Connection ~ 9150 2750
Wire Wire Line
	9150 2750 9700 2750
Wire Wire Line
	9900 2750 10850 2750
Text Label 6450 7100 0    50   ~ 0
PRG
$Comp
L Device:CP_Small C1
U 1 1 635FBF50
P 1550 6450
F 0 "C1" H 1700 6450 50  0000 C CNN
F 1 "100nF" H 1700 6550 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1550 6450 50  0001 C CNN
F 3 "~" H 1550 6450 50  0001 C CNN
	1    1550 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 4950 2400 4950
Wire Wire Line
	1000 5350 2400 5350
Wire Notes Line
	5100 4750 6850 4750
Text Notes 5100 4750 0    50   ~ 10
CONFIGURATION
Wire Notes Line
	14900 4700 14900 6400
Wire Notes Line
	14900 6400 11950 6400
Wire Notes Line
	11950 6400 11950 4700
Wire Notes Line
	8000 2650 10950 2650
Text Notes 8000 2650 0    50   ~ 10
DISPLAY
Wire Notes Line
	650  4750 650  7200
Wire Notes Line
	650  4750 5050 4750
Wire Notes Line
	5050 7200 5050 4750
Wire Notes Line
	650  7200 5050 7200
Wire Notes Line
	5100 7700 6850 7700
Wire Notes Line
	6850 4750 6850 7700
Wire Notes Line
	5100 4750 5100 7700
Connection ~ 5200 5650
Wire Wire Line
	5500 4950 5200 4950
Wire Wire Line
	5500 5050 5200 5050
Wire Wire Line
	5500 5150 5200 5150
Wire Wire Line
	5500 5250 5200 5250
Wire Wire Line
	5500 5350 5200 5350
Wire Wire Line
	5500 5450 5200 5450
Wire Wire Line
	5500 5550 5200 5550
Wire Wire Line
	5500 5650 5200 5650
Connection ~ 5200 6250
$Comp
L power:GND #PWR014
U 1 1 63724529
P 6550 7600
F 0 "#PWR014" H 6550 7350 50  0001 C CNN
F 1 "GND" V 6550 7400 50  0000 C CNN
F 2 "" H 6550 7600 50  0001 C CNN
F 3 "" H 6550 7600 50  0001 C CNN
	1    6550 7600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6100 4950 6450 4950
Wire Wire Line
	6100 5050 6450 5050
Wire Wire Line
	6100 5150 6450 5150
Wire Wire Line
	6100 5250 6450 5250
Wire Wire Line
	6100 5350 6450 5350
Wire Wire Line
	6100 5450 6450 5450
Wire Wire Line
	6100 5550 6450 5550
Wire Wire Line
	6100 5650 6450 5650
Wire Wire Line
	6100 6150 6450 6150
Wire Wire Line
	6100 6250 6450 6250
Text Label 13700 1800 0    50   ~ 0
MPX_DATA
Text Label 13700 2000 0    50   ~ 0
MPX_CLOCK
Text Label 12600 900  2    50   ~ 0
PRG
NoConn ~ 12600 800 
NoConn ~ -3250 8100
Wire Wire Line
	4850 900  4950 900 
$Sheet
S 3750 1350 1100 400 
U 63089671
F0 "OII_01" 50
F1 "opto_isolated_input.sch" 50
F2 "OII_IN" I L 3750 1550 50 
F3 "OII_IN_GND" U L 3750 1650 50 
F4 "OII_OUT" O R 4850 1550 50 
F5 "OII_OUT_GND" U R 4850 1650 50 
F6 "OII_OUT_VCC" I R 4850 1450 50 
$EndSheet
Wire Wire Line
	3650 1550 3750 1550
Wire Wire Line
	3650 1650 3750 1650
Wire Wire Line
	4850 1450 4950 1450
Wire Wire Line
	4850 1550 4950 1550
Wire Wire Line
	4850 1650 4950 1650
Wire Wire Line
	4850 2100 4950 2100
Wire Wire Line
	4850 2200 4950 2200
Wire Wire Line
	4850 2950 4950 2950
Wire Wire Line
	3650 2950 3750 2950
Wire Wire Line
	6850 1000 6950 1000
Wire Wire Line
	5750 1000 5650 1000
Wire Wire Line
	6850 1650 6950 1650
Wire Wire Line
	6850 2300 6950 2300
Wire Wire Line
	6850 2950 6950 2950
Text Label 5650 2950 2    50   ~ 0
SPST_GND
Wire Wire Line
	5650 2950 5750 2950
Wire Wire Line
	5750 2300 5650 2300
Wire Wire Line
	5750 1650 5650 1650
$Comp
L Device:LED D5
U 1 1 6348B352
P 13300 3500
F 0 "D5" H 13400 3450 50  0000 C CNN
F 1 "LED" H 13293 3336 50  0001 C CNN
F 2 "LED_THT:LED_D1.8mm_W3.3mm_H2.4mm" H 13300 3500 50  0001 C CNN
F 3 "~" H 13300 3500 50  0001 C CNN
	1    13300 3500
	-1   0    0    1   
$EndComp
$Comp
L Device:R R3
U 1 1 63493E4A
P 13600 3500
F 0 "R3" V 13650 3400 50  0000 R CNN
F 1 "560R" V 13600 3500 39  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 13530 3500 50  0001 C CNN
F 3 "~" H 13600 3500 50  0001 C CNN
	1    13600 3500
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR028
U 1 1 63496532
P 13850 3600
F 0 "#PWR028" H 13850 3350 50  0001 C CNN
F 1 "GND" H 13855 3427 50  0000 C CNN
F 2 "" H 13850 3600 50  0001 C CNN
F 3 "" H 13850 3600 50  0001 C CNN
	1    13850 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	13750 3500 13850 3500
Wire Wire Line
	13850 3500 13850 3600
Wire Wire Line
	13150 3500 13050 3500
Text Label 13050 3500 2    50   ~ 0
TRANSMIT_LED
Text Label 12600 1000 2    50   ~ 0
TRANSMIT_LED
$Comp
L Device:CP_Small C4
U 1 1 6357107B
P 9800 2750
F 0 "C4" V 9850 2850 50  0000 C CNN
F 1 "100nF" V 9850 2600 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9800 2750 50  0001 C CNN
F 3 "~" H 9800 2750 50  0001 C CNN
	1    9800 2750
	0    -1   1    0   
$EndComp
$Comp
L Device:CP_Small C3
U 1 1 634CCFDB
P 13150 2450
F 0 "C3" V 13200 2550 50  0000 C CNN
F 1 "100nF" V 13200 2300 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 13150 2450 50  0001 C CNN
F 3 "~" H 13150 2450 50  0001 C CNN
	1    13150 2450
	0    -1   1    0   
$EndComp
$Comp
L Device:R R28
U 1 1 634C34EB
P 10500 3050
F 0 "R28" V 10550 2950 50  0000 R CNN
F 1 "560R" V 10500 3050 39  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 10430 3050 50  0001 C CNN
F 3 "~" H 10500 3050 50  0001 C CNN
	1    10500 3050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R29
U 1 1 634C3A8E
P 10500 3150
F 0 "R29" V 10550 3050 50  0000 R CNN
F 1 "560R" V 10500 3150 39  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 10430 3150 50  0001 C CNN
F 3 "~" H 10500 3150 50  0001 C CNN
	1    10500 3150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R30
U 1 1 634C3E87
P 10500 3250
F 0 "R30" V 10550 3150 50  0000 R CNN
F 1 "560R" V 10500 3250 39  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 10430 3250 50  0001 C CNN
F 3 "~" H 10500 3250 50  0001 C CNN
	1    10500 3250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R31
U 1 1 634C42EC
P 10500 3350
F 0 "R31" V 10550 3250 50  0000 R CNN
F 1 "560R" V 10500 3350 39  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 10430 3350 50  0001 C CNN
F 3 "~" H 10500 3350 50  0001 C CNN
	1    10500 3350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R32
U 1 1 634C469C
P 10500 3450
F 0 "R32" V 10550 3350 50  0000 R CNN
F 1 "560R" V 10500 3450 39  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 10430 3450 50  0001 C CNN
F 3 "~" H 10500 3450 50  0001 C CNN
	1    10500 3450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R33
U 1 1 634C4AC7
P 10500 3550
F 0 "R33" V 10550 3450 50  0000 R CNN
F 1 "560R" V 10500 3550 39  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 10430 3550 50  0001 C CNN
F 3 "~" H 10500 3550 50  0001 C CNN
	1    10500 3550
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R34
U 1 1 634C4F7E
P 10500 3650
F 0 "R34" V 10550 3550 50  0000 R CNN
F 1 "560R" V 10500 3650 39  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 10430 3650 50  0001 C CNN
F 3 "~" H 10500 3650 50  0001 C CNN
	1    10500 3650
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R35
U 1 1 634C53BF
P 10500 3750
F 0 "R35" V 10550 3650 50  0000 R CNN
F 1 "560R" V 10500 3750 39  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 10430 3750 50  0001 C CNN
F 3 "~" H 10500 3750 50  0001 C CNN
	1    10500 3750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10650 3050 10850 3050
Wire Wire Line
	10850 3750 10650 3750
Wire Wire Line
	10850 2750 10850 3050
Wire Wire Line
	10650 3150 10850 3150
Wire Wire Line
	10650 3250 10850 3250
Wire Wire Line
	10650 3350 10850 3350
Wire Wire Line
	10650 3450 10850 3450
Wire Wire Line
	10650 3550 10850 3550
Wire Wire Line
	10650 3650 10850 3650
$Comp
L Device:R R38
U 1 1 638A66B7
P 1300 6450
F 0 "R38" H 1450 6600 50  0000 R CNN
F 1 "2K2 0.125W" V 1300 6450 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1230 6450 50  0001 C CNN
F 3 "~" H 1300 6450 50  0001 C CNN
	1    1300 6450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R39
U 1 1 638A701E
P 1300 6950
F 0 "R39" H 1300 6800 50  0000 R CNN
F 1 "3K3 0.125W" V 1300 6950 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1230 6950 50  0001 C CNN
F 3 "~" H 1300 6950 50  0001 C CNN
	1    1300 6950
	-1   0    0    1   
$EndComp
Wire Wire Line
	1300 6300 1300 6150
Wire Wire Line
	1300 6150 1850 6150
Wire Wire Line
	1300 6600 1300 6650
Wire Wire Line
	700  6650 1300 6650
Connection ~ 1300 6650
Wire Wire Line
	1300 6650 1300 6800
$Comp
L Device:R R36
U 1 1 638DB685
P 1150 6450
F 0 "R36" H 1150 6600 50  0000 R CNN
F 1 "2K2 0.125W" V 1150 6450 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1080 6450 50  0001 C CNN
F 3 "~" H 1150 6450 50  0001 C CNN
	1    1150 6450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R37
U 1 1 638DBDD6
P 1150 6950
F 0 "R37" H 1300 6800 50  0000 R CNN
F 1 "3K3 0.125W" V 1150 6950 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1080 6950 50  0001 C CNN
F 3 "~" H 1150 6950 50  0001 C CNN
	1    1150 6950
	-1   0    0    1   
$EndComp
Wire Wire Line
	1150 6600 1150 6750
Wire Wire Line
	1150 6750 700  6750
Connection ~ 1150 6750
Wire Wire Line
	1150 6750 1150 6800
Wire Wire Line
	1150 6300 1150 6250
Wire Wire Line
	1150 6250 1850 6250
Wire Wire Line
	6000 7100 6450 7100
Wire Wire Line
	5200 7600 6550 7600
Connection ~ 1300 7100
Wire Wire Line
	1300 7100 1750 7100
Wire Wire Line
	1000 7100 1150 7100
Connection ~ 1150 7100
Wire Wire Line
	1150 7100 1300 7100
Text Label 12600 1900 2    50   ~ 0
3V3
Text Label 6950 800  0    50   ~ 0
3V3
Text Label 6950 1450 0    50   ~ 0
3V3
Text Label 6950 2100 0    50   ~ 0
3V3
Text Label 6950 2750 0    50   ~ 0
3V3
Text Label 4950 2750 0    50   ~ 0
3V3
Text Label 4950 2100 0    50   ~ 0
3V3
Text Label 4950 1450 0    50   ~ 0
3V3
Text Label 4950 800  0    50   ~ 0
3V3
$Comp
L Switch:SW_MEC_5E SW1
U 1 1 638DE6DD
P 5800 7200
F 0 "SW1" H 5800 7585 50  0000 C CNN
F 1 "PRG" H 5800 7494 50  0000 C CNN
F 2 "Button_Switch_THT:SW_TH_Tactile_Omron_B3F-10xx" H 5800 7500 50  0001 C CNN
F 3 "http://www.apem.com/int/index.php?controller=attachment&id_attachment=1371" H 5800 7500 50  0001 C CNN
	1    5800 7200
	-1   0    0    -1  
$EndComp
NoConn ~ 6000 7200
NoConn ~ 5600 7100
Wire Wire Line
	5200 6250 5200 7200
Wire Wire Line
	5600 7200 5200 7200
Connection ~ 5200 7200
Wire Wire Line
	5200 7200 5200 7600
$Comp
L Device:LED D18
U 1 1 6399F1CF
P 9800 4750
F 0 "D18" H 9900 4700 50  0000 C CNN
F 1 "LED" H 9793 4586 50  0001 C CNN
F 2 "LED_THT:LED_D1.8mm_W3.3mm_H2.4mm" H 9800 4750 50  0001 C CNN
F 3 "~" H 9800 4750 50  0001 C CNN
	1    9800 4750
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D22
U 1 1 6399F1D5
P 10100 4850
F 0 "D22" H 10200 4800 50  0000 C CNN
F 1 "LED" H 10093 4686 50  0001 C CNN
F 2 "LED_THT:LED_D1.8mm_W3.3mm_H2.4mm" H 10100 4850 50  0001 C CNN
F 3 "~" H 10100 4850 50  0001 C CNN
	1    10100 4850
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D19
U 1 1 6399F1DB
P 9800 4950
F 0 "D19" H 9900 4900 50  0000 C CNN
F 1 "LED" H 9793 4786 50  0001 C CNN
F 2 "LED_THT:LED_D1.8mm_W3.3mm_H2.4mm" H 9800 4950 50  0001 C CNN
F 3 "~" H 9800 4950 50  0001 C CNN
	1    9800 4950
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D23
U 1 1 6399F1E1
P 10100 5050
F 0 "D23" H 10200 5000 50  0000 C CNN
F 1 "LED" H 10093 4886 50  0001 C CNN
F 2 "LED_THT:LED_D1.8mm_W3.3mm_H2.4mm" H 10100 5050 50  0001 C CNN
F 3 "~" H 10100 5050 50  0001 C CNN
	1    10100 5050
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74HC595 U3
U 1 1 6399F1E7
P 9150 5150
F 0 "U3" H 9400 5700 50  0000 C CNN
F 1 "74HCT595" H 9350 4500 50  0000 C CNN
F 2 "Package_SO:SO-16_3.9x9.9mm_P1.27mm" H 9150 5150 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 9150 5150 50  0001 C CNN
	1    9150 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D20
U 1 1 6399F1ED
P 9800 5150
F 0 "D20" H 9900 5100 50  0000 C CNN
F 1 "LED" H 9793 4986 50  0001 C CNN
F 2 "LED_THT:LED_D1.8mm_W3.3mm_H2.4mm" H 9800 5150 50  0001 C CNN
F 3 "~" H 9800 5150 50  0001 C CNN
	1    9800 5150
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D24
U 1 1 6399F1F3
P 10100 5250
F 0 "D24" H 10200 5200 50  0000 C CNN
F 1 "LED" H 10093 5086 50  0001 C CNN
F 2 "LED_THT:LED_D1.8mm_W3.3mm_H2.4mm" H 10100 5250 50  0001 C CNN
F 3 "~" H 10100 5250 50  0001 C CNN
	1    10100 5250
	-1   0    0    1   
$EndComp
Wire Wire Line
	9550 4750 9650 4750
Wire Wire Line
	9550 4850 9950 4850
Wire Wire Line
	9550 4950 9650 4950
Wire Wire Line
	9550 5050 9950 5050
Wire Wire Line
	9550 5150 9650 5150
Wire Wire Line
	9550 5250 9950 5250
Wire Wire Line
	9950 4750 10350 4750
Wire Wire Line
	10250 4850 10350 4850
Wire Wire Line
	9950 4950 10350 4950
Wire Wire Line
	10250 5050 10350 5050
Wire Wire Line
	9950 5150 10350 5150
Wire Wire Line
	10250 5250 10350 5250
NoConn ~ 9550 5650
Text Label 8550 4950 2    50   ~ 0
MPX_CLOCK
Text Label 8550 5250 2    50   ~ 0
MPX_LATCH
Wire Wire Line
	9150 5850 9150 5950
Wire Wire Line
	9150 5950 8650 5950
Wire Wire Line
	8650 5950 8650 5350
Wire Wire Line
	8650 5350 8750 5350
Wire Wire Line
	8650 5950 8550 5950
Connection ~ 8650 5950
$Comp
L power:GND #PWR0101
U 1 1 6399F20F
P 8550 5950
F 0 "#PWR0101" H 8550 5700 50  0001 C CNN
F 1 "GND" V 8550 5750 50  0000 C CNN
F 2 "" H 8550 5950 50  0001 C CNN
F 3 "" H 8550 5950 50  0001 C CNN
	1    8550 5950
	0    1    1    0   
$EndComp
Wire Wire Line
	8750 5050 8650 5050
Wire Wire Line
	8650 5050 8650 4450
Wire Wire Line
	8650 4450 9150 4450
Wire Wire Line
	9150 4450 9150 4550
Wire Wire Line
	8650 4450 8550 4450
Connection ~ 8650 4450
$Comp
L power:+5V #PWR0102
U 1 1 6399F21B
P 8550 4450
F 0 "#PWR0102" H 8550 4300 50  0001 C CNN
F 1 "+5V" V 8550 4600 50  0000 L CNN
F 2 "" H 8550 4450 50  0001 C CNN
F 3 "" H 8550 4450 50  0001 C CNN
	1    8550 4450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10850 5950 9150 5950
Connection ~ 9150 5950
Wire Wire Line
	8550 4950 8750 4950
Wire Wire Line
	8550 5250 8750 5250
$Comp
L Device:LED D21
U 1 1 6399F226
P 9800 5350
F 0 "D21" H 9900 5300 50  0000 C CNN
F 1 "LED" H 9793 5186 50  0001 C CNN
F 2 "LED_THT:LED_D1.8mm_W3.3mm_H2.4mm" H 9800 5350 50  0001 C CNN
F 3 "~" H 9800 5350 50  0001 C CNN
	1    9800 5350
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D25
U 1 1 6399F22C
P 10100 5450
F 0 "D25" H 10200 5400 50  0000 C CNN
F 1 "LED" H 10093 5286 50  0001 C CNN
F 2 "LED_THT:LED_D1.8mm_W3.3mm_H2.4mm" H 10100 5450 50  0001 C CNN
F 3 "~" H 10100 5450 50  0001 C CNN
	1    10100 5450
	-1   0    0    1   
$EndComp
Wire Wire Line
	9550 5350 9650 5350
Wire Wire Line
	9550 5450 9950 5450
Wire Wire Line
	9950 5350 10350 5350
Wire Wire Line
	10250 5450 10350 5450
Connection ~ 9150 4450
Wire Wire Line
	9150 4450 9700 4450
Wire Wire Line
	9900 4450 10850 4450
$Comp
L Device:CP_Small C2
U 1 1 6399F239
P 9800 4450
F 0 "C2" V 9850 4550 50  0000 C CNN
F 1 "100nF" V 9850 4300 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9800 4450 50  0001 C CNN
F 3 "~" H 9800 4450 50  0001 C CNN
	1    9800 4450
	0    -1   1    0   
$EndComp
$Comp
L Device:R R40
U 1 1 6399F23F
P 10500 4750
F 0 "R40" V 10550 4650 50  0000 R CNN
F 1 "560R" V 10500 4750 39  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 10430 4750 50  0001 C CNN
F 3 "~" H 10500 4750 50  0001 C CNN
	1    10500 4750
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R41
U 1 1 6399F245
P 10500 4850
F 0 "R41" V 10550 4750 50  0000 R CNN
F 1 "560R" V 10500 4850 39  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 10430 4850 50  0001 C CNN
F 3 "~" H 10500 4850 50  0001 C CNN
	1    10500 4850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R42
U 1 1 6399F24B
P 10500 4950
F 0 "R42" V 10550 4850 50  0000 R CNN
F 1 "560R" V 10500 4950 39  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 10430 4950 50  0001 C CNN
F 3 "~" H 10500 4950 50  0001 C CNN
	1    10500 4950
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R43
U 1 1 6399F251
P 10500 5050
F 0 "R43" V 10550 4950 50  0000 R CNN
F 1 "560R" V 10500 5050 39  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 10430 5050 50  0001 C CNN
F 3 "~" H 10500 5050 50  0001 C CNN
	1    10500 5050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R44
U 1 1 6399F257
P 10500 5150
F 0 "R44" V 10550 5050 50  0000 R CNN
F 1 "560R" V 10500 5150 39  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 10430 5150 50  0001 C CNN
F 3 "~" H 10500 5150 50  0001 C CNN
	1    10500 5150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R45
U 1 1 6399F25D
P 10500 5250
F 0 "R45" V 10550 5150 50  0000 R CNN
F 1 "560R" V 10500 5250 39  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 10430 5250 50  0001 C CNN
F 3 "~" H 10500 5250 50  0001 C CNN
	1    10500 5250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R46
U 1 1 6399F263
P 10500 5350
F 0 "R46" V 10550 5250 50  0000 R CNN
F 1 "560R" V 10500 5350 39  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 10430 5350 50  0001 C CNN
F 3 "~" H 10500 5350 50  0001 C CNN
	1    10500 5350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R47
U 1 1 6399F269
P 10500 5450
F 0 "R47" V 10550 5350 50  0000 R CNN
F 1 "560R" V 10500 5450 39  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 10430 5450 50  0001 C CNN
F 3 "~" H 10500 5450 50  0001 C CNN
	1    10500 5450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10650 4750 10850 4750
Wire Wire Line
	10850 5450 10650 5450
Wire Wire Line
	10850 4450 10850 4750
Wire Wire Line
	10650 4850 10850 4850
Wire Wire Line
	10650 4950 10850 4950
Wire Wire Line
	10650 5050 10850 5050
Wire Wire Line
	10650 5150 10850 5150
Wire Wire Line
	10650 5250 10850 5250
Wire Wire Line
	10650 5350 10850 5350
Wire Wire Line
	8550 4750 8750 4750
Connection ~ 10850 4750
Wire Wire Line
	10850 4750 10850 4850
Connection ~ 10850 4850
Wire Wire Line
	10850 4850 10850 4950
Connection ~ 10850 4950
Wire Wire Line
	10850 4950 10850 5050
Connection ~ 10850 5050
Wire Wire Line
	10850 5050 10850 5150
Connection ~ 10850 5150
Wire Wire Line
	10850 5150 10850 5250
Connection ~ 10850 5250
Wire Wire Line
	10850 5250 10850 5350
Connection ~ 10850 5350
Wire Wire Line
	10850 5350 10850 5450
Connection ~ 10850 5450
Wire Wire Line
	10850 5450 10850 5950
Connection ~ 10850 3050
Wire Wire Line
	10850 3050 10850 3150
Connection ~ 10850 3150
Wire Wire Line
	10850 3150 10850 3250
Connection ~ 10850 3250
Wire Wire Line
	10850 3250 10850 3350
Connection ~ 10850 3350
Wire Wire Line
	10850 3350 10850 3450
Connection ~ 10850 3450
Wire Wire Line
	10850 3450 10850 3550
Connection ~ 10850 3550
Wire Wire Line
	10850 3550 10850 3650
Connection ~ 10850 3650
Wire Wire Line
	10850 3650 10850 3750
Connection ~ 10850 3750
Wire Wire Line
	10850 3750 10850 4250
Text Label 9550 3950 0    50   ~ 0
MPX_SER
Text Label 8550 4750 2    50   ~ 0
MPX_SER
$EndSCHEMATC
