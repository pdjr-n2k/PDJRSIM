EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "SIM108 Switch Input Module"
Date "2022-06-11"
Rev "2.0.0"
Comp "PDJR <preeve@pdjr.eu>"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Screw_Terminal_01x09 J1
U 1 1 62D3957B
P 900 5150
F 0 "J1" H 900 5650 50  0000 C CNN
F 1 "Screw_Terminal_01x09" H 900 5650 50  0001 C CNN
F 2 "PDJR_Connectors:CAMDEN_BOSS_CSTBV2-9_TERMINAL" H 900 5150 50  0001 C CNN
F 3 "~" H 900 5150 50  0001 C CNN
	1    900  5150
	-1   0    0    -1  
$EndComp
NoConn ~ -3250 8100
$Comp
L power:+3.3V #PWR01
U 1 1 63A28085
P 800 750
F 0 "#PWR01" H 800 600 50  0001 C CNN
F 1 "+3.3V" H 815 923 50  0000 C CNN
F 2 "" H 800 750 50  0001 C CNN
F 3 "" H 800 750 50  0001 C CNN
	1    800  750 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 63A2A251
P 800 1100
F 0 "#PWR02" H 800 850 50  0001 C CNN
F 1 "GND" H 805 927 50  0000 C CNN
F 2 "" H 800 1100 50  0001 C CNN
F 3 "" H 800 1100 50  0001 C CNN
	1    800  1100
	1    0    0    -1  
$EndComp
Text Label 10150 1450 0    50   ~ 0
D23
Text Label 10150 1550 0    50   ~ 0
D22
Text Label 10150 1650 0    50   ~ 0
D21
Text Label 10150 1750 0    50   ~ 0
D20
Text Label 10150 1850 0    50   ~ 0
D19
Text Label 10150 1950 0    50   ~ 0
D7
Text Label 10150 2050 0    50   ~ 0
D6
Text Label 10150 2150 0    50   ~ 0
D5
Wire Wire Line
	1100 4850 2500 4850
Wire Wire Line
	1100 4950 3400 4950
Wire Wire Line
	1100 5050 4300 5050
Wire Wire Line
	1100 5150 5200 5150
Wire Wire Line
	1100 5250 6100 5250
Wire Wire Line
	1100 5350 7000 5350
Wire Wire Line
	1100 5450 7900 5450
Wire Wire Line
	1100 5550 8800 5550
$Comp
L Isolator:SFH617A-1 U?
U 1 1 63A1D05D
P 2800 3050
AR Path="/62FB7846/63A1D05D" Ref="U?"  Part="1" 
AR Path="/63089671/63A1D05D" Ref="U?"  Part="1" 
AR Path="/63103CAF/63A1D05D" Ref="U?"  Part="1" 
AR Path="/62F64647/63A1D05D" Ref="U?"  Part="1" 
AR Path="/62FD589D/63A1D05D" Ref="U?"  Part="1" 
AR Path="/63041ECA/63A1D05D" Ref="U?"  Part="1" 
AR Path="/62F45EE0/63A1D05D" Ref="U?"  Part="1" 
AR Path="/62FB890E/63A1D05D" Ref="U?"  Part="1" 
AR Path="/63A4C39E/63A1D05D" Ref="U?"  Part="1" 
AR Path="/63A0C125/63A1D05D" Ref="U?"  Part="1" 
AR Path="/63A0DEDA/63A1D05D" Ref="U?"  Part="1" 
AR Path="/63A1004D/63A1D05D" Ref="U?"  Part="1" 
AR Path="/63A11746/63A1D05D" Ref="U?"  Part="1" 
AR Path="/63A12F68/63A1D05D" Ref="U?"  Part="1" 
AR Path="/63A14AD1/63A1D05D" Ref="U?"  Part="1" 
AR Path="/63A169E8/63A1D05D" Ref="U?"  Part="1" 
AR Path="/63A1D05D" Ref="U1"  Part="1" 
F 0 "U1" H 2800 2850 50  0000 C CNN
F 1 "SFH617A-1" H 2800 3250 50  0000 C CNN
F 2 "Package_DIP:SMDIP-4_W7.62mm" H 2600 2850 50  0001 L CIN
F 3 "http://www.vishay.com/docs/83740/sfh617a.pdf" H 2800 3050 50  0001 L CNN
	1    2800 3050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 63A1D065
P 2700 3550
AR Path="/62FB7846/63A1D065" Ref="R?"  Part="1" 
AR Path="/63089671/63A1D065" Ref="R?"  Part="1" 
AR Path="/63103CAF/63A1D065" Ref="R?"  Part="1" 
AR Path="/62F64647/63A1D065" Ref="R?"  Part="1" 
AR Path="/62FD589D/63A1D065" Ref="R?"  Part="1" 
AR Path="/63041ECA/63A1D065" Ref="R?"  Part="1" 
AR Path="/62F45EE0/63A1D065" Ref="R?"  Part="1" 
AR Path="/62FB890E/63A1D065" Ref="R?"  Part="1" 
AR Path="/63A4C39E/63A1D065" Ref="R?"  Part="1" 
AR Path="/63A0C125/63A1D065" Ref="R?"  Part="1" 
AR Path="/63A0DEDA/63A1D065" Ref="R?"  Part="1" 
AR Path="/63A1004D/63A1D065" Ref="R?"  Part="1" 
AR Path="/63A11746/63A1D065" Ref="R?"  Part="1" 
AR Path="/63A12F68/63A1D065" Ref="R?"  Part="1" 
AR Path="/63A14AD1/63A1D065" Ref="R?"  Part="1" 
AR Path="/63A169E8/63A1D065" Ref="R?"  Part="1" 
AR Path="/63A1D065" Ref="R2"  Part="1" 
F 0 "R2" H 2750 3550 50  0000 L CNN
F 1 "10K 0.5W" V 2700 3550 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2630 3550 50  0001 C CNN
F 3 "~" H 2700 3550 50  0001 C CNN
F 4 "0.125W" V 2800 3550 50  0001 C CNN "Power"
	1    2700 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 3400 2700 3350
Wire Wire Line
	2700 3700 2700 3750
Wire Wire Line
	2700 3750 2800 3750
$Comp
L Device:R R?
U 1 1 63A1D072
P 3100 4100
AR Path="/62FB7846/63A1D072" Ref="R?"  Part="1" 
AR Path="/63089671/63A1D072" Ref="R?"  Part="1" 
AR Path="/63103CAF/63A1D072" Ref="R?"  Part="1" 
AR Path="/62F64647/63A1D072" Ref="R?"  Part="1" 
AR Path="/62FD589D/63A1D072" Ref="R?"  Part="1" 
AR Path="/63041ECA/63A1D072" Ref="R?"  Part="1" 
AR Path="/62F45EE0/63A1D072" Ref="R?"  Part="1" 
AR Path="/62FB890E/63A1D072" Ref="R?"  Part="1" 
AR Path="/63A4C39E/63A1D072" Ref="R?"  Part="1" 
AR Path="/63A0C125/63A1D072" Ref="R?"  Part="1" 
AR Path="/63A0DEDA/63A1D072" Ref="R?"  Part="1" 
AR Path="/63A1004D/63A1D072" Ref="R?"  Part="1" 
AR Path="/63A11746/63A1D072" Ref="R?"  Part="1" 
AR Path="/63A12F68/63A1D072" Ref="R?"  Part="1" 
AR Path="/63A14AD1/63A1D072" Ref="R?"  Part="1" 
AR Path="/63A169E8/63A1D072" Ref="R?"  Part="1" 
AR Path="/63A1D072" Ref="R3"  Part="1" 
F 0 "R3" H 3150 4100 50  0000 L CNN
F 1 "100R 0.25W" V 3100 4100 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3030 4100 50  0001 C CNN
F 3 "~" H 3100 4100 50  0001 C CNN
F 4 "0.125W" V 3200 4100 50  0001 C CNN "Power"
	1    3100 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 4150 2700 4250
$Comp
L Transistor_BJT:BC337 Q?
U 1 1 63A1D079
P 3000 3750
AR Path="/62FB7846/63A1D079" Ref="Q?"  Part="1" 
AR Path="/63089671/63A1D079" Ref="Q?"  Part="1" 
AR Path="/63103CAF/63A1D079" Ref="Q?"  Part="1" 
AR Path="/62F64647/63A1D079" Ref="Q?"  Part="1" 
AR Path="/62FD589D/63A1D079" Ref="Q?"  Part="1" 
AR Path="/63041ECA/63A1D079" Ref="Q?"  Part="1" 
AR Path="/62F45EE0/63A1D079" Ref="Q?"  Part="1" 
AR Path="/62FB890E/63A1D079" Ref="Q?"  Part="1" 
AR Path="/63A4C39E/63A1D079" Ref="Q?"  Part="1" 
AR Path="/63A0C125/63A1D079" Ref="Q?"  Part="1" 
AR Path="/63A0DEDA/63A1D079" Ref="Q?"  Part="1" 
AR Path="/63A1004D/63A1D079" Ref="Q?"  Part="1" 
AR Path="/63A11746/63A1D079" Ref="Q?"  Part="1" 
AR Path="/63A12F68/63A1D079" Ref="Q?"  Part="1" 
AR Path="/63A14AD1/63A1D079" Ref="Q?"  Part="1" 
AR Path="/63A169E8/63A1D079" Ref="Q?"  Part="1" 
AR Path="/63A1D079" Ref="Q2"  Part="1" 
F 0 "Q2" H 3191 3796 50  0000 L CNN
F 1 "BC337-40" H 3191 3705 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TSOT-23" H 3200 3675 50  0001 L CIN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bc337.pdf" H 3000 3750 50  0001 L CNN
	1    3000 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 3950 3100 3950
Connection ~ 3100 3950
Wire Wire Line
	3100 4250 2700 4250
$Comp
L Simulation_SPICE:DIODE D?
U 1 1 63A1D085
P 2500 3550
AR Path="/62FB7846/63A1D085" Ref="D?"  Part="1" 
AR Path="/63089671/63A1D085" Ref="D?"  Part="1" 
AR Path="/63103CAF/63A1D085" Ref="D?"  Part="1" 
AR Path="/62F64647/63A1D085" Ref="D?"  Part="1" 
AR Path="/62FD589D/63A1D085" Ref="D?"  Part="1" 
AR Path="/63041ECA/63A1D085" Ref="D?"  Part="1" 
AR Path="/62F45EE0/63A1D085" Ref="D?"  Part="1" 
AR Path="/62FB890E/63A1D085" Ref="D?"  Part="1" 
AR Path="/63A4C39E/63A1D085" Ref="D?"  Part="1" 
AR Path="/63A0C125/63A1D085" Ref="D?"  Part="1" 
AR Path="/63A0DEDA/63A1D085" Ref="D?"  Part="1" 
AR Path="/63A1004D/63A1D085" Ref="D?"  Part="1" 
AR Path="/63A11746/63A1D085" Ref="D?"  Part="1" 
AR Path="/63A12F68/63A1D085" Ref="D?"  Part="1" 
AR Path="/63A14AD1/63A1D085" Ref="D?"  Part="1" 
AR Path="/63A169E8/63A1D085" Ref="D?"  Part="1" 
AR Path="/63A1D085" Ref="D1"  Part="1" 
F 0 "D1" H 2300 3500 50  0000 L CNN
F 1 "IN4007" H 2550 3500 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 2500 3550 50  0001 C CNN
F 3 "~" H 2500 3550 50  0001 C CNN
F 4 "Y" H 2500 3550 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "D" H 2500 3550 50  0001 L CNN "Spice_Primitive"
	1    2500 3550
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_BJT:BC547 Q?
U 1 1 63A1D08B
P 2800 3950
AR Path="/62FB7846/63A1D08B" Ref="Q?"  Part="1" 
AR Path="/63089671/63A1D08B" Ref="Q?"  Part="1" 
AR Path="/63103CAF/63A1D08B" Ref="Q?"  Part="1" 
AR Path="/62F64647/63A1D08B" Ref="Q?"  Part="1" 
AR Path="/62FD589D/63A1D08B" Ref="Q?"  Part="1" 
AR Path="/63041ECA/63A1D08B" Ref="Q?"  Part="1" 
AR Path="/62F45EE0/63A1D08B" Ref="Q?"  Part="1" 
AR Path="/62FB890E/63A1D08B" Ref="Q?"  Part="1" 
AR Path="/63A4C39E/63A1D08B" Ref="Q?"  Part="1" 
AR Path="/63A0C125/63A1D08B" Ref="Q?"  Part="1" 
AR Path="/63A0DEDA/63A1D08B" Ref="Q?"  Part="1" 
AR Path="/63A1004D/63A1D08B" Ref="Q?"  Part="1" 
AR Path="/63A11746/63A1D08B" Ref="Q?"  Part="1" 
AR Path="/63A12F68/63A1D08B" Ref="Q?"  Part="1" 
AR Path="/63A14AD1/63A1D08B" Ref="Q?"  Part="1" 
AR Path="/63A169E8/63A1D08B" Ref="Q?"  Part="1" 
AR Path="/63A1D08B" Ref="Q1"  Part="1" 
F 0 "Q1" H 2991 3996 50  0000 L CNN
F 1 "BC547" H 2991 3905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TSOT-23" H 3000 3875 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 2800 3950 50  0001 L CNN
	1    2800 3950
	-1   0    0    -1  
$EndComp
Connection ~ 2700 3750
Wire Wire Line
	2700 2750 2700 2650
$Comp
L Device:R R?
U 1 1 63A1D09A
P 2700 2400
AR Path="/62FB7846/63A1D09A" Ref="R?"  Part="1" 
AR Path="/63089671/63A1D09A" Ref="R?"  Part="1" 
AR Path="/63103CAF/63A1D09A" Ref="R?"  Part="1" 
AR Path="/62F64647/63A1D09A" Ref="R?"  Part="1" 
AR Path="/62FD589D/63A1D09A" Ref="R?"  Part="1" 
AR Path="/63041ECA/63A1D09A" Ref="R?"  Part="1" 
AR Path="/62F45EE0/63A1D09A" Ref="R?"  Part="1" 
AR Path="/62FB890E/63A1D09A" Ref="R?"  Part="1" 
AR Path="/63A4C39E/63A1D09A" Ref="R?"  Part="1" 
AR Path="/63A0C125/63A1D09A" Ref="R?"  Part="1" 
AR Path="/63A0DEDA/63A1D09A" Ref="R?"  Part="1" 
AR Path="/63A1004D/63A1D09A" Ref="R?"  Part="1" 
AR Path="/63A11746/63A1D09A" Ref="R?"  Part="1" 
AR Path="/63A12F68/63A1D09A" Ref="R?"  Part="1" 
AR Path="/63A14AD1/63A1D09A" Ref="R?"  Part="1" 
AR Path="/63A169E8/63A1D09A" Ref="R?"  Part="1" 
AR Path="/63A1D09A" Ref="R1"  Part="1" 
F 0 "R1" H 2750 2400 50  0000 L CNN
F 1 "4K7 0.125W" V 2700 2400 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2630 2400 50  0001 C CNN
F 3 "~" H 2700 2400 50  0001 C CNN
F 4 "0.125W" V 2800 2400 50  0001 C CNN "Power"
	1    2700 2400
	1    0    0    -1  
$EndComp
Connection ~ 2700 2650
Wire Wire Line
	2700 2650 2800 2650
Wire Wire Line
	2700 2650 2700 2550
Wire Wire Line
	3100 3550 3100 3350
Wire Wire Line
	3100 3350 2900 3350
Wire Wire Line
	3100 4250 3100 4750
Connection ~ 3100 4250
Wire Wire Line
	2500 3350 2500 3400
Connection ~ 2700 3350
Wire Wire Line
	2500 3350 2700 3350
Wire Wire Line
	800  750  2700 750 
Wire Wire Line
	800  1100 2900 1100
Wire Wire Line
	1100 4750 3100 4750
Wire Wire Line
	2500 3700 2500 4850
Connection ~ 3100 4750
Wire Wire Line
	2800 1450 2800 2650
Wire Wire Line
	2700 750  2700 2250
Connection ~ 2700 750 
Wire Wire Line
	2900 1100 2900 2750
Connection ~ 2900 1100
Wire Wire Line
	2700 750  3600 750 
Wire Wire Line
	2900 1100 3800 1100
Wire Wire Line
	3100 4750 4000 4750
$Comp
L Isolator:SFH617A-1 U?
U 1 1 63B1F536
P 3700 3050
AR Path="/62FB7846/63B1F536" Ref="U?"  Part="1" 
AR Path="/63089671/63B1F536" Ref="U?"  Part="1" 
AR Path="/63103CAF/63B1F536" Ref="U?"  Part="1" 
AR Path="/62F64647/63B1F536" Ref="U?"  Part="1" 
AR Path="/62FD589D/63B1F536" Ref="U?"  Part="1" 
AR Path="/63041ECA/63B1F536" Ref="U?"  Part="1" 
AR Path="/62F45EE0/63B1F536" Ref="U?"  Part="1" 
AR Path="/62FB890E/63B1F536" Ref="U?"  Part="1" 
AR Path="/63A4C39E/63B1F536" Ref="U?"  Part="1" 
AR Path="/63A0C125/63B1F536" Ref="U?"  Part="1" 
AR Path="/63A0DEDA/63B1F536" Ref="U?"  Part="1" 
AR Path="/63A1004D/63B1F536" Ref="U?"  Part="1" 
AR Path="/63A11746/63B1F536" Ref="U?"  Part="1" 
AR Path="/63A12F68/63B1F536" Ref="U?"  Part="1" 
AR Path="/63A14AD1/63B1F536" Ref="U?"  Part="1" 
AR Path="/63A169E8/63B1F536" Ref="U?"  Part="1" 
AR Path="/63B1F536" Ref="U2"  Part="1" 
F 0 "U2" H 3700 2850 50  0000 C CNN
F 1 "SFH617A-1" H 3700 3250 50  0000 C CNN
F 2 "Package_DIP:SMDIP-4_W7.62mm" H 3500 2850 50  0001 L CIN
F 3 "http://www.vishay.com/docs/83740/sfh617a.pdf" H 3700 3050 50  0001 L CNN
	1    3700 3050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 63B1F541
P 3600 3550
AR Path="/62FB7846/63B1F541" Ref="R?"  Part="1" 
AR Path="/63089671/63B1F541" Ref="R?"  Part="1" 
AR Path="/63103CAF/63B1F541" Ref="R?"  Part="1" 
AR Path="/62F64647/63B1F541" Ref="R?"  Part="1" 
AR Path="/62FD589D/63B1F541" Ref="R?"  Part="1" 
AR Path="/63041ECA/63B1F541" Ref="R?"  Part="1" 
AR Path="/62F45EE0/63B1F541" Ref="R?"  Part="1" 
AR Path="/62FB890E/63B1F541" Ref="R?"  Part="1" 
AR Path="/63A4C39E/63B1F541" Ref="R?"  Part="1" 
AR Path="/63A0C125/63B1F541" Ref="R?"  Part="1" 
AR Path="/63A0DEDA/63B1F541" Ref="R?"  Part="1" 
AR Path="/63A1004D/63B1F541" Ref="R?"  Part="1" 
AR Path="/63A11746/63B1F541" Ref="R?"  Part="1" 
AR Path="/63A12F68/63B1F541" Ref="R?"  Part="1" 
AR Path="/63A14AD1/63B1F541" Ref="R?"  Part="1" 
AR Path="/63A169E8/63B1F541" Ref="R?"  Part="1" 
AR Path="/63B1F541" Ref="R5"  Part="1" 
F 0 "R5" H 3650 3550 50  0000 L CNN
F 1 "10K 0.5W" V 3600 3550 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3530 3550 50  0001 C CNN
F 3 "~" H 3600 3550 50  0001 C CNN
F 4 "0.125W" V 3700 3550 50  0001 C CNN "Power"
	1    3600 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 3400 3600 3350
Wire Wire Line
	3600 3700 3600 3750
Wire Wire Line
	3600 3750 3700 3750
$Comp
L Device:R R?
U 1 1 63B1F54F
P 4000 4100
AR Path="/62FB7846/63B1F54F" Ref="R?"  Part="1" 
AR Path="/63089671/63B1F54F" Ref="R?"  Part="1" 
AR Path="/63103CAF/63B1F54F" Ref="R?"  Part="1" 
AR Path="/62F64647/63B1F54F" Ref="R?"  Part="1" 
AR Path="/62FD589D/63B1F54F" Ref="R?"  Part="1" 
AR Path="/63041ECA/63B1F54F" Ref="R?"  Part="1" 
AR Path="/62F45EE0/63B1F54F" Ref="R?"  Part="1" 
AR Path="/62FB890E/63B1F54F" Ref="R?"  Part="1" 
AR Path="/63A4C39E/63B1F54F" Ref="R?"  Part="1" 
AR Path="/63A0C125/63B1F54F" Ref="R?"  Part="1" 
AR Path="/63A0DEDA/63B1F54F" Ref="R?"  Part="1" 
AR Path="/63A1004D/63B1F54F" Ref="R?"  Part="1" 
AR Path="/63A11746/63B1F54F" Ref="R?"  Part="1" 
AR Path="/63A12F68/63B1F54F" Ref="R?"  Part="1" 
AR Path="/63A14AD1/63B1F54F" Ref="R?"  Part="1" 
AR Path="/63A169E8/63B1F54F" Ref="R?"  Part="1" 
AR Path="/63B1F54F" Ref="R6"  Part="1" 
F 0 "R6" H 4050 4100 50  0000 L CNN
F 1 "100R 0.25W" V 4000 4100 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3930 4100 50  0001 C CNN
F 3 "~" H 4000 4100 50  0001 C CNN
F 4 "0.125W" V 4100 4100 50  0001 C CNN "Power"
	1    4000 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 4150 3600 4250
$Comp
L Transistor_BJT:BC337 Q?
U 1 1 63B1F55A
P 3900 3750
AR Path="/62FB7846/63B1F55A" Ref="Q?"  Part="1" 
AR Path="/63089671/63B1F55A" Ref="Q?"  Part="1" 
AR Path="/63103CAF/63B1F55A" Ref="Q?"  Part="1" 
AR Path="/62F64647/63B1F55A" Ref="Q?"  Part="1" 
AR Path="/62FD589D/63B1F55A" Ref="Q?"  Part="1" 
AR Path="/63041ECA/63B1F55A" Ref="Q?"  Part="1" 
AR Path="/62F45EE0/63B1F55A" Ref="Q?"  Part="1" 
AR Path="/62FB890E/63B1F55A" Ref="Q?"  Part="1" 
AR Path="/63A4C39E/63B1F55A" Ref="Q?"  Part="1" 
AR Path="/63A0C125/63B1F55A" Ref="Q?"  Part="1" 
AR Path="/63A0DEDA/63B1F55A" Ref="Q?"  Part="1" 
AR Path="/63A1004D/63B1F55A" Ref="Q?"  Part="1" 
AR Path="/63A11746/63B1F55A" Ref="Q?"  Part="1" 
AR Path="/63A12F68/63B1F55A" Ref="Q?"  Part="1" 
AR Path="/63A14AD1/63B1F55A" Ref="Q?"  Part="1" 
AR Path="/63A169E8/63B1F55A" Ref="Q?"  Part="1" 
AR Path="/63B1F55A" Ref="Q4"  Part="1" 
F 0 "Q4" H 4091 3796 50  0000 L CNN
F 1 "BC337-40" H 4091 3705 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TSOT-23" H 4100 3675 50  0001 L CIN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bc337.pdf" H 3900 3750 50  0001 L CNN
	1    3900 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 3950 4000 3950
Connection ~ 4000 3950
Wire Wire Line
	4000 4250 3600 4250
$Comp
L Simulation_SPICE:DIODE D?
U 1 1 63B1F569
P 3400 3550
AR Path="/62FB7846/63B1F569" Ref="D?"  Part="1" 
AR Path="/63089671/63B1F569" Ref="D?"  Part="1" 
AR Path="/63103CAF/63B1F569" Ref="D?"  Part="1" 
AR Path="/62F64647/63B1F569" Ref="D?"  Part="1" 
AR Path="/62FD589D/63B1F569" Ref="D?"  Part="1" 
AR Path="/63041ECA/63B1F569" Ref="D?"  Part="1" 
AR Path="/62F45EE0/63B1F569" Ref="D?"  Part="1" 
AR Path="/62FB890E/63B1F569" Ref="D?"  Part="1" 
AR Path="/63A4C39E/63B1F569" Ref="D?"  Part="1" 
AR Path="/63A0C125/63B1F569" Ref="D?"  Part="1" 
AR Path="/63A0DEDA/63B1F569" Ref="D?"  Part="1" 
AR Path="/63A1004D/63B1F569" Ref="D?"  Part="1" 
AR Path="/63A11746/63B1F569" Ref="D?"  Part="1" 
AR Path="/63A12F68/63B1F569" Ref="D?"  Part="1" 
AR Path="/63A14AD1/63B1F569" Ref="D?"  Part="1" 
AR Path="/63A169E8/63B1F569" Ref="D?"  Part="1" 
AR Path="/63B1F569" Ref="D2"  Part="1" 
F 0 "D2" H 3200 3500 50  0000 L CNN
F 1 "IN4007" H 3450 3500 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 3400 3550 50  0001 C CNN
F 3 "~" H 3400 3550 50  0001 C CNN
F 4 "Y" H 3400 3550 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "D" H 3400 3550 50  0001 L CNN "Spice_Primitive"
	1    3400 3550
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_BJT:BC547 Q?
U 1 1 63B1F573
P 3700 3950
AR Path="/62FB7846/63B1F573" Ref="Q?"  Part="1" 
AR Path="/63089671/63B1F573" Ref="Q?"  Part="1" 
AR Path="/63103CAF/63B1F573" Ref="Q?"  Part="1" 
AR Path="/62F64647/63B1F573" Ref="Q?"  Part="1" 
AR Path="/62FD589D/63B1F573" Ref="Q?"  Part="1" 
AR Path="/63041ECA/63B1F573" Ref="Q?"  Part="1" 
AR Path="/62F45EE0/63B1F573" Ref="Q?"  Part="1" 
AR Path="/62FB890E/63B1F573" Ref="Q?"  Part="1" 
AR Path="/63A4C39E/63B1F573" Ref="Q?"  Part="1" 
AR Path="/63A0C125/63B1F573" Ref="Q?"  Part="1" 
AR Path="/63A0DEDA/63B1F573" Ref="Q?"  Part="1" 
AR Path="/63A1004D/63B1F573" Ref="Q?"  Part="1" 
AR Path="/63A11746/63B1F573" Ref="Q?"  Part="1" 
AR Path="/63A12F68/63B1F573" Ref="Q?"  Part="1" 
AR Path="/63A14AD1/63B1F573" Ref="Q?"  Part="1" 
AR Path="/63A169E8/63B1F573" Ref="Q?"  Part="1" 
AR Path="/63B1F573" Ref="Q3"  Part="1" 
F 0 "Q3" H 3891 3996 50  0000 L CNN
F 1 "BC547" H 3891 3905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TSOT-23" H 3900 3875 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 3700 3950 50  0001 L CNN
	1    3700 3950
	-1   0    0    -1  
$EndComp
Connection ~ 3600 3750
Wire Wire Line
	3600 2750 3600 2650
$Comp
L Device:R R?
U 1 1 63B1F580
P 3600 2400
AR Path="/62FB7846/63B1F580" Ref="R?"  Part="1" 
AR Path="/63089671/63B1F580" Ref="R?"  Part="1" 
AR Path="/63103CAF/63B1F580" Ref="R?"  Part="1" 
AR Path="/62F64647/63B1F580" Ref="R?"  Part="1" 
AR Path="/62FD589D/63B1F580" Ref="R?"  Part="1" 
AR Path="/63041ECA/63B1F580" Ref="R?"  Part="1" 
AR Path="/62F45EE0/63B1F580" Ref="R?"  Part="1" 
AR Path="/62FB890E/63B1F580" Ref="R?"  Part="1" 
AR Path="/63A4C39E/63B1F580" Ref="R?"  Part="1" 
AR Path="/63A0C125/63B1F580" Ref="R?"  Part="1" 
AR Path="/63A0DEDA/63B1F580" Ref="R?"  Part="1" 
AR Path="/63A1004D/63B1F580" Ref="R?"  Part="1" 
AR Path="/63A11746/63B1F580" Ref="R?"  Part="1" 
AR Path="/63A12F68/63B1F580" Ref="R?"  Part="1" 
AR Path="/63A14AD1/63B1F580" Ref="R?"  Part="1" 
AR Path="/63A169E8/63B1F580" Ref="R?"  Part="1" 
AR Path="/63B1F580" Ref="R4"  Part="1" 
F 0 "R4" H 3650 2400 50  0000 L CNN
F 1 "4K7 0.125W" V 3600 2400 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3530 2400 50  0001 C CNN
F 3 "~" H 3600 2400 50  0001 C CNN
F 4 "0.125W" V 3700 2400 50  0001 C CNN "Power"
	1    3600 2400
	1    0    0    -1  
$EndComp
Connection ~ 3600 2650
Wire Wire Line
	3600 2650 3700 2650
Wire Wire Line
	3600 2650 3600 2550
Wire Wire Line
	4000 3550 4000 3350
Wire Wire Line
	4000 3350 3800 3350
Wire Wire Line
	4000 4250 4000 4750
Connection ~ 4000 4250
Wire Wire Line
	3400 3350 3400 3400
Connection ~ 3600 3350
Wire Wire Line
	3400 3350 3600 3350
Wire Wire Line
	3600 750  3600 2250
Wire Wire Line
	3800 1100 3800 2750
Connection ~ 3600 750 
Wire Wire Line
	3600 750  4500 750 
Connection ~ 3800 1100
Wire Wire Line
	3800 1100 4700 1100
Connection ~ 4000 4750
Wire Wire Line
	3400 3700 3400 4950
Wire Wire Line
	3700 1550 10150 1550
Wire Wire Line
	3700 1550 3700 2650
Wire Wire Line
	2800 1450 10150 1450
$Comp
L Isolator:SFH617A-1 U?
U 1 1 63B3A67F
P 4600 3050
AR Path="/62FB7846/63B3A67F" Ref="U?"  Part="1" 
AR Path="/63089671/63B3A67F" Ref="U?"  Part="1" 
AR Path="/63103CAF/63B3A67F" Ref="U?"  Part="1" 
AR Path="/62F64647/63B3A67F" Ref="U?"  Part="1" 
AR Path="/62FD589D/63B3A67F" Ref="U?"  Part="1" 
AR Path="/63041ECA/63B3A67F" Ref="U?"  Part="1" 
AR Path="/62F45EE0/63B3A67F" Ref="U?"  Part="1" 
AR Path="/62FB890E/63B3A67F" Ref="U?"  Part="1" 
AR Path="/63A4C39E/63B3A67F" Ref="U?"  Part="1" 
AR Path="/63A0C125/63B3A67F" Ref="U?"  Part="1" 
AR Path="/63A0DEDA/63B3A67F" Ref="U?"  Part="1" 
AR Path="/63A1004D/63B3A67F" Ref="U?"  Part="1" 
AR Path="/63A11746/63B3A67F" Ref="U?"  Part="1" 
AR Path="/63A12F68/63B3A67F" Ref="U?"  Part="1" 
AR Path="/63A14AD1/63B3A67F" Ref="U?"  Part="1" 
AR Path="/63A169E8/63B3A67F" Ref="U?"  Part="1" 
AR Path="/63B3A67F" Ref="U3"  Part="1" 
F 0 "U3" H 4600 2850 50  0000 C CNN
F 1 "SFH617A-1" H 4600 3250 50  0000 C CNN
F 2 "Package_DIP:SMDIP-4_W7.62mm" H 4400 2850 50  0001 L CIN
F 3 "http://www.vishay.com/docs/83740/sfh617a.pdf" H 4600 3050 50  0001 L CNN
	1    4600 3050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 63B3A686
P 4500 3550
AR Path="/62FB7846/63B3A686" Ref="R?"  Part="1" 
AR Path="/63089671/63B3A686" Ref="R?"  Part="1" 
AR Path="/63103CAF/63B3A686" Ref="R?"  Part="1" 
AR Path="/62F64647/63B3A686" Ref="R?"  Part="1" 
AR Path="/62FD589D/63B3A686" Ref="R?"  Part="1" 
AR Path="/63041ECA/63B3A686" Ref="R?"  Part="1" 
AR Path="/62F45EE0/63B3A686" Ref="R?"  Part="1" 
AR Path="/62FB890E/63B3A686" Ref="R?"  Part="1" 
AR Path="/63A4C39E/63B3A686" Ref="R?"  Part="1" 
AR Path="/63A0C125/63B3A686" Ref="R?"  Part="1" 
AR Path="/63A0DEDA/63B3A686" Ref="R?"  Part="1" 
AR Path="/63A1004D/63B3A686" Ref="R?"  Part="1" 
AR Path="/63A11746/63B3A686" Ref="R?"  Part="1" 
AR Path="/63A12F68/63B3A686" Ref="R?"  Part="1" 
AR Path="/63A14AD1/63B3A686" Ref="R?"  Part="1" 
AR Path="/63A169E8/63B3A686" Ref="R?"  Part="1" 
AR Path="/63B3A686" Ref="R8"  Part="1" 
F 0 "R8" H 4550 3550 50  0000 L CNN
F 1 "10K 0.5W" V 4500 3550 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4430 3550 50  0001 C CNN
F 3 "~" H 4500 3550 50  0001 C CNN
F 4 "0.125W" V 4600 3550 50  0001 C CNN "Power"
	1    4500 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3400 4500 3350
Wire Wire Line
	4500 3700 4500 3750
Wire Wire Line
	4500 3750 4600 3750
$Comp
L Device:R R?
U 1 1 63B3A690
P 4900 4100
AR Path="/62FB7846/63B3A690" Ref="R?"  Part="1" 
AR Path="/63089671/63B3A690" Ref="R?"  Part="1" 
AR Path="/63103CAF/63B3A690" Ref="R?"  Part="1" 
AR Path="/62F64647/63B3A690" Ref="R?"  Part="1" 
AR Path="/62FD589D/63B3A690" Ref="R?"  Part="1" 
AR Path="/63041ECA/63B3A690" Ref="R?"  Part="1" 
AR Path="/62F45EE0/63B3A690" Ref="R?"  Part="1" 
AR Path="/62FB890E/63B3A690" Ref="R?"  Part="1" 
AR Path="/63A4C39E/63B3A690" Ref="R?"  Part="1" 
AR Path="/63A0C125/63B3A690" Ref="R?"  Part="1" 
AR Path="/63A0DEDA/63B3A690" Ref="R?"  Part="1" 
AR Path="/63A1004D/63B3A690" Ref="R?"  Part="1" 
AR Path="/63A11746/63B3A690" Ref="R?"  Part="1" 
AR Path="/63A12F68/63B3A690" Ref="R?"  Part="1" 
AR Path="/63A14AD1/63B3A690" Ref="R?"  Part="1" 
AR Path="/63A169E8/63B3A690" Ref="R?"  Part="1" 
AR Path="/63B3A690" Ref="R9"  Part="1" 
F 0 "R9" H 4950 4100 50  0000 L CNN
F 1 "100R 0.25W" V 4900 4100 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4830 4100 50  0001 C CNN
F 3 "~" H 4900 4100 50  0001 C CNN
F 4 "0.125W" V 5000 4100 50  0001 C CNN "Power"
	1    4900 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 4150 4500 4250
$Comp
L Transistor_BJT:BC337 Q?
U 1 1 63B3A697
P 4800 3750
AR Path="/62FB7846/63B3A697" Ref="Q?"  Part="1" 
AR Path="/63089671/63B3A697" Ref="Q?"  Part="1" 
AR Path="/63103CAF/63B3A697" Ref="Q?"  Part="1" 
AR Path="/62F64647/63B3A697" Ref="Q?"  Part="1" 
AR Path="/62FD589D/63B3A697" Ref="Q?"  Part="1" 
AR Path="/63041ECA/63B3A697" Ref="Q?"  Part="1" 
AR Path="/62F45EE0/63B3A697" Ref="Q?"  Part="1" 
AR Path="/62FB890E/63B3A697" Ref="Q?"  Part="1" 
AR Path="/63A4C39E/63B3A697" Ref="Q?"  Part="1" 
AR Path="/63A0C125/63B3A697" Ref="Q?"  Part="1" 
AR Path="/63A0DEDA/63B3A697" Ref="Q?"  Part="1" 
AR Path="/63A1004D/63B3A697" Ref="Q?"  Part="1" 
AR Path="/63A11746/63B3A697" Ref="Q?"  Part="1" 
AR Path="/63A12F68/63B3A697" Ref="Q?"  Part="1" 
AR Path="/63A14AD1/63B3A697" Ref="Q?"  Part="1" 
AR Path="/63A169E8/63B3A697" Ref="Q?"  Part="1" 
AR Path="/63B3A697" Ref="Q6"  Part="1" 
F 0 "Q6" H 4991 3796 50  0000 L CNN
F 1 "BC337-40" H 4991 3705 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TSOT-23" H 5000 3675 50  0001 L CIN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bc337.pdf" H 4800 3750 50  0001 L CNN
	1    4800 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 3950 4900 3950
Connection ~ 4900 3950
Wire Wire Line
	4900 4250 4500 4250
$Comp
L Simulation_SPICE:DIODE D?
U 1 1 63B3A6A2
P 4300 3550
AR Path="/62FB7846/63B3A6A2" Ref="D?"  Part="1" 
AR Path="/63089671/63B3A6A2" Ref="D?"  Part="1" 
AR Path="/63103CAF/63B3A6A2" Ref="D?"  Part="1" 
AR Path="/62F64647/63B3A6A2" Ref="D?"  Part="1" 
AR Path="/62FD589D/63B3A6A2" Ref="D?"  Part="1" 
AR Path="/63041ECA/63B3A6A2" Ref="D?"  Part="1" 
AR Path="/62F45EE0/63B3A6A2" Ref="D?"  Part="1" 
AR Path="/62FB890E/63B3A6A2" Ref="D?"  Part="1" 
AR Path="/63A4C39E/63B3A6A2" Ref="D?"  Part="1" 
AR Path="/63A0C125/63B3A6A2" Ref="D?"  Part="1" 
AR Path="/63A0DEDA/63B3A6A2" Ref="D?"  Part="1" 
AR Path="/63A1004D/63B3A6A2" Ref="D?"  Part="1" 
AR Path="/63A11746/63B3A6A2" Ref="D?"  Part="1" 
AR Path="/63A12F68/63B3A6A2" Ref="D?"  Part="1" 
AR Path="/63A14AD1/63B3A6A2" Ref="D?"  Part="1" 
AR Path="/63A169E8/63B3A6A2" Ref="D?"  Part="1" 
AR Path="/63B3A6A2" Ref="D3"  Part="1" 
F 0 "D3" H 4100 3500 50  0000 L CNN
F 1 "IN4007" H 4350 3500 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 4300 3550 50  0001 C CNN
F 3 "~" H 4300 3550 50  0001 C CNN
F 4 "Y" H 4300 3550 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "D" H 4300 3550 50  0001 L CNN "Spice_Primitive"
	1    4300 3550
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_BJT:BC547 Q?
U 1 1 63B3A6A8
P 4600 3950
AR Path="/62FB7846/63B3A6A8" Ref="Q?"  Part="1" 
AR Path="/63089671/63B3A6A8" Ref="Q?"  Part="1" 
AR Path="/63103CAF/63B3A6A8" Ref="Q?"  Part="1" 
AR Path="/62F64647/63B3A6A8" Ref="Q?"  Part="1" 
AR Path="/62FD589D/63B3A6A8" Ref="Q?"  Part="1" 
AR Path="/63041ECA/63B3A6A8" Ref="Q?"  Part="1" 
AR Path="/62F45EE0/63B3A6A8" Ref="Q?"  Part="1" 
AR Path="/62FB890E/63B3A6A8" Ref="Q?"  Part="1" 
AR Path="/63A4C39E/63B3A6A8" Ref="Q?"  Part="1" 
AR Path="/63A0C125/63B3A6A8" Ref="Q?"  Part="1" 
AR Path="/63A0DEDA/63B3A6A8" Ref="Q?"  Part="1" 
AR Path="/63A1004D/63B3A6A8" Ref="Q?"  Part="1" 
AR Path="/63A11746/63B3A6A8" Ref="Q?"  Part="1" 
AR Path="/63A12F68/63B3A6A8" Ref="Q?"  Part="1" 
AR Path="/63A14AD1/63B3A6A8" Ref="Q?"  Part="1" 
AR Path="/63A169E8/63B3A6A8" Ref="Q?"  Part="1" 
AR Path="/63B3A6A8" Ref="Q5"  Part="1" 
F 0 "Q5" H 4791 3996 50  0000 L CNN
F 1 "BC547" H 4791 3905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TSOT-23" H 4800 3875 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 4600 3950 50  0001 L CNN
	1    4600 3950
	-1   0    0    -1  
$EndComp
Connection ~ 4500 3750
Wire Wire Line
	4500 2750 4500 2650
$Comp
L Device:R R?
U 1 1 63B3A6B1
P 4500 2400
AR Path="/62FB7846/63B3A6B1" Ref="R?"  Part="1" 
AR Path="/63089671/63B3A6B1" Ref="R?"  Part="1" 
AR Path="/63103CAF/63B3A6B1" Ref="R?"  Part="1" 
AR Path="/62F64647/63B3A6B1" Ref="R?"  Part="1" 
AR Path="/62FD589D/63B3A6B1" Ref="R?"  Part="1" 
AR Path="/63041ECA/63B3A6B1" Ref="R?"  Part="1" 
AR Path="/62F45EE0/63B3A6B1" Ref="R?"  Part="1" 
AR Path="/62FB890E/63B3A6B1" Ref="R?"  Part="1" 
AR Path="/63A4C39E/63B3A6B1" Ref="R?"  Part="1" 
AR Path="/63A0C125/63B3A6B1" Ref="R?"  Part="1" 
AR Path="/63A0DEDA/63B3A6B1" Ref="R?"  Part="1" 
AR Path="/63A1004D/63B3A6B1" Ref="R?"  Part="1" 
AR Path="/63A11746/63B3A6B1" Ref="R?"  Part="1" 
AR Path="/63A12F68/63B3A6B1" Ref="R?"  Part="1" 
AR Path="/63A14AD1/63B3A6B1" Ref="R?"  Part="1" 
AR Path="/63A169E8/63B3A6B1" Ref="R?"  Part="1" 
AR Path="/63B3A6B1" Ref="R7"  Part="1" 
F 0 "R7" H 4550 2400 50  0000 L CNN
F 1 "4K7 0.125W" V 4500 2400 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4430 2400 50  0001 C CNN
F 3 "~" H 4500 2400 50  0001 C CNN
F 4 "0.125W" V 4600 2400 50  0001 C CNN "Power"
	1    4500 2400
	1    0    0    -1  
$EndComp
Connection ~ 4500 2650
Wire Wire Line
	4500 2650 4600 2650
Wire Wire Line
	4500 2650 4500 2550
Wire Wire Line
	4900 3550 4900 3350
Wire Wire Line
	4900 3350 4700 3350
Wire Wire Line
	4900 4250 4900 4750
Connection ~ 4900 4250
Wire Wire Line
	4300 3350 4300 3400
Connection ~ 4500 3350
Wire Wire Line
	4300 3350 4500 3350
Wire Wire Line
	4500 750  4500 2250
Wire Wire Line
	4700 1100 4700 2750
$Comp
L Isolator:SFH617A-1 U?
U 1 1 63B439B3
P 5500 3050
AR Path="/62FB7846/63B439B3" Ref="U?"  Part="1" 
AR Path="/63089671/63B439B3" Ref="U?"  Part="1" 
AR Path="/63103CAF/63B439B3" Ref="U?"  Part="1" 
AR Path="/62F64647/63B439B3" Ref="U?"  Part="1" 
AR Path="/62FD589D/63B439B3" Ref="U?"  Part="1" 
AR Path="/63041ECA/63B439B3" Ref="U?"  Part="1" 
AR Path="/62F45EE0/63B439B3" Ref="U?"  Part="1" 
AR Path="/62FB890E/63B439B3" Ref="U?"  Part="1" 
AR Path="/63A4C39E/63B439B3" Ref="U?"  Part="1" 
AR Path="/63A0C125/63B439B3" Ref="U?"  Part="1" 
AR Path="/63A0DEDA/63B439B3" Ref="U?"  Part="1" 
AR Path="/63A1004D/63B439B3" Ref="U?"  Part="1" 
AR Path="/63A11746/63B439B3" Ref="U?"  Part="1" 
AR Path="/63A12F68/63B439B3" Ref="U?"  Part="1" 
AR Path="/63A14AD1/63B439B3" Ref="U?"  Part="1" 
AR Path="/63A169E8/63B439B3" Ref="U?"  Part="1" 
AR Path="/63B439B3" Ref="U4"  Part="1" 
F 0 "U4" H 5500 2850 50  0000 C CNN
F 1 "SFH617A-1" H 5500 3250 50  0000 C CNN
F 2 "Package_DIP:SMDIP-4_W7.62mm" H 5300 2850 50  0001 L CIN
F 3 "http://www.vishay.com/docs/83740/sfh617a.pdf" H 5500 3050 50  0001 L CNN
	1    5500 3050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 63B439BA
P 5400 3550
AR Path="/62FB7846/63B439BA" Ref="R?"  Part="1" 
AR Path="/63089671/63B439BA" Ref="R?"  Part="1" 
AR Path="/63103CAF/63B439BA" Ref="R?"  Part="1" 
AR Path="/62F64647/63B439BA" Ref="R?"  Part="1" 
AR Path="/62FD589D/63B439BA" Ref="R?"  Part="1" 
AR Path="/63041ECA/63B439BA" Ref="R?"  Part="1" 
AR Path="/62F45EE0/63B439BA" Ref="R?"  Part="1" 
AR Path="/62FB890E/63B439BA" Ref="R?"  Part="1" 
AR Path="/63A4C39E/63B439BA" Ref="R?"  Part="1" 
AR Path="/63A0C125/63B439BA" Ref="R?"  Part="1" 
AR Path="/63A0DEDA/63B439BA" Ref="R?"  Part="1" 
AR Path="/63A1004D/63B439BA" Ref="R?"  Part="1" 
AR Path="/63A11746/63B439BA" Ref="R?"  Part="1" 
AR Path="/63A12F68/63B439BA" Ref="R?"  Part="1" 
AR Path="/63A14AD1/63B439BA" Ref="R?"  Part="1" 
AR Path="/63A169E8/63B439BA" Ref="R?"  Part="1" 
AR Path="/63B439BA" Ref="R11"  Part="1" 
F 0 "R11" H 5450 3550 50  0000 L CNN
F 1 "10K 0.5W" V 5400 3550 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5330 3550 50  0001 C CNN
F 3 "~" H 5400 3550 50  0001 C CNN
F 4 "0.125W" V 5500 3550 50  0001 C CNN "Power"
	1    5400 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 3400 5400 3350
Wire Wire Line
	5400 3700 5400 3750
Wire Wire Line
	5400 3750 5500 3750
$Comp
L Device:R R?
U 1 1 63B439C4
P 5800 4100
AR Path="/62FB7846/63B439C4" Ref="R?"  Part="1" 
AR Path="/63089671/63B439C4" Ref="R?"  Part="1" 
AR Path="/63103CAF/63B439C4" Ref="R?"  Part="1" 
AR Path="/62F64647/63B439C4" Ref="R?"  Part="1" 
AR Path="/62FD589D/63B439C4" Ref="R?"  Part="1" 
AR Path="/63041ECA/63B439C4" Ref="R?"  Part="1" 
AR Path="/62F45EE0/63B439C4" Ref="R?"  Part="1" 
AR Path="/62FB890E/63B439C4" Ref="R?"  Part="1" 
AR Path="/63A4C39E/63B439C4" Ref="R?"  Part="1" 
AR Path="/63A0C125/63B439C4" Ref="R?"  Part="1" 
AR Path="/63A0DEDA/63B439C4" Ref="R?"  Part="1" 
AR Path="/63A1004D/63B439C4" Ref="R?"  Part="1" 
AR Path="/63A11746/63B439C4" Ref="R?"  Part="1" 
AR Path="/63A12F68/63B439C4" Ref="R?"  Part="1" 
AR Path="/63A14AD1/63B439C4" Ref="R?"  Part="1" 
AR Path="/63A169E8/63B439C4" Ref="R?"  Part="1" 
AR Path="/63B439C4" Ref="R12"  Part="1" 
F 0 "R12" H 5850 4100 50  0000 L CNN
F 1 "100R 0.25W" V 5800 4100 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5730 4100 50  0001 C CNN
F 3 "~" H 5800 4100 50  0001 C CNN
F 4 "0.125W" V 5900 4100 50  0001 C CNN "Power"
	1    5800 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 4150 5400 4250
$Comp
L Transistor_BJT:BC337 Q?
U 1 1 63B439CB
P 5700 3750
AR Path="/62FB7846/63B439CB" Ref="Q?"  Part="1" 
AR Path="/63089671/63B439CB" Ref="Q?"  Part="1" 
AR Path="/63103CAF/63B439CB" Ref="Q?"  Part="1" 
AR Path="/62F64647/63B439CB" Ref="Q?"  Part="1" 
AR Path="/62FD589D/63B439CB" Ref="Q?"  Part="1" 
AR Path="/63041ECA/63B439CB" Ref="Q?"  Part="1" 
AR Path="/62F45EE0/63B439CB" Ref="Q?"  Part="1" 
AR Path="/62FB890E/63B439CB" Ref="Q?"  Part="1" 
AR Path="/63A4C39E/63B439CB" Ref="Q?"  Part="1" 
AR Path="/63A0C125/63B439CB" Ref="Q?"  Part="1" 
AR Path="/63A0DEDA/63B439CB" Ref="Q?"  Part="1" 
AR Path="/63A1004D/63B439CB" Ref="Q?"  Part="1" 
AR Path="/63A11746/63B439CB" Ref="Q?"  Part="1" 
AR Path="/63A12F68/63B439CB" Ref="Q?"  Part="1" 
AR Path="/63A14AD1/63B439CB" Ref="Q?"  Part="1" 
AR Path="/63A169E8/63B439CB" Ref="Q?"  Part="1" 
AR Path="/63B439CB" Ref="Q8"  Part="1" 
F 0 "Q8" H 5891 3796 50  0000 L CNN
F 1 "BC337-40" H 5891 3705 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TSOT-23" H 5900 3675 50  0001 L CIN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bc337.pdf" H 5700 3750 50  0001 L CNN
	1    5700 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 3950 5800 3950
Connection ~ 5800 3950
Wire Wire Line
	5800 4250 5400 4250
$Comp
L Simulation_SPICE:DIODE D?
U 1 1 63B439D6
P 5200 3550
AR Path="/62FB7846/63B439D6" Ref="D?"  Part="1" 
AR Path="/63089671/63B439D6" Ref="D?"  Part="1" 
AR Path="/63103CAF/63B439D6" Ref="D?"  Part="1" 
AR Path="/62F64647/63B439D6" Ref="D?"  Part="1" 
AR Path="/62FD589D/63B439D6" Ref="D?"  Part="1" 
AR Path="/63041ECA/63B439D6" Ref="D?"  Part="1" 
AR Path="/62F45EE0/63B439D6" Ref="D?"  Part="1" 
AR Path="/62FB890E/63B439D6" Ref="D?"  Part="1" 
AR Path="/63A4C39E/63B439D6" Ref="D?"  Part="1" 
AR Path="/63A0C125/63B439D6" Ref="D?"  Part="1" 
AR Path="/63A0DEDA/63B439D6" Ref="D?"  Part="1" 
AR Path="/63A1004D/63B439D6" Ref="D?"  Part="1" 
AR Path="/63A11746/63B439D6" Ref="D?"  Part="1" 
AR Path="/63A12F68/63B439D6" Ref="D?"  Part="1" 
AR Path="/63A14AD1/63B439D6" Ref="D?"  Part="1" 
AR Path="/63A169E8/63B439D6" Ref="D?"  Part="1" 
AR Path="/63B439D6" Ref="D4"  Part="1" 
F 0 "D4" H 5000 3500 50  0000 L CNN
F 1 "IN4007" H 5250 3500 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 5200 3550 50  0001 C CNN
F 3 "~" H 5200 3550 50  0001 C CNN
F 4 "Y" H 5200 3550 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "D" H 5200 3550 50  0001 L CNN "Spice_Primitive"
	1    5200 3550
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_BJT:BC547 Q?
U 1 1 63B439DC
P 5500 3950
AR Path="/62FB7846/63B439DC" Ref="Q?"  Part="1" 
AR Path="/63089671/63B439DC" Ref="Q?"  Part="1" 
AR Path="/63103CAF/63B439DC" Ref="Q?"  Part="1" 
AR Path="/62F64647/63B439DC" Ref="Q?"  Part="1" 
AR Path="/62FD589D/63B439DC" Ref="Q?"  Part="1" 
AR Path="/63041ECA/63B439DC" Ref="Q?"  Part="1" 
AR Path="/62F45EE0/63B439DC" Ref="Q?"  Part="1" 
AR Path="/62FB890E/63B439DC" Ref="Q?"  Part="1" 
AR Path="/63A4C39E/63B439DC" Ref="Q?"  Part="1" 
AR Path="/63A0C125/63B439DC" Ref="Q?"  Part="1" 
AR Path="/63A0DEDA/63B439DC" Ref="Q?"  Part="1" 
AR Path="/63A1004D/63B439DC" Ref="Q?"  Part="1" 
AR Path="/63A11746/63B439DC" Ref="Q?"  Part="1" 
AR Path="/63A12F68/63B439DC" Ref="Q?"  Part="1" 
AR Path="/63A14AD1/63B439DC" Ref="Q?"  Part="1" 
AR Path="/63A169E8/63B439DC" Ref="Q?"  Part="1" 
AR Path="/63B439DC" Ref="Q7"  Part="1" 
F 0 "Q7" H 5691 3996 50  0000 L CNN
F 1 "BC547" H 5691 3905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TSOT-23" H 5700 3875 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 5500 3950 50  0001 L CNN
	1    5500 3950
	-1   0    0    -1  
$EndComp
Connection ~ 5400 3750
Wire Wire Line
	5400 2750 5400 2650
$Comp
L Device:R R?
U 1 1 63B439E5
P 5400 2400
AR Path="/62FB7846/63B439E5" Ref="R?"  Part="1" 
AR Path="/63089671/63B439E5" Ref="R?"  Part="1" 
AR Path="/63103CAF/63B439E5" Ref="R?"  Part="1" 
AR Path="/62F64647/63B439E5" Ref="R?"  Part="1" 
AR Path="/62FD589D/63B439E5" Ref="R?"  Part="1" 
AR Path="/63041ECA/63B439E5" Ref="R?"  Part="1" 
AR Path="/62F45EE0/63B439E5" Ref="R?"  Part="1" 
AR Path="/62FB890E/63B439E5" Ref="R?"  Part="1" 
AR Path="/63A4C39E/63B439E5" Ref="R?"  Part="1" 
AR Path="/63A0C125/63B439E5" Ref="R?"  Part="1" 
AR Path="/63A0DEDA/63B439E5" Ref="R?"  Part="1" 
AR Path="/63A1004D/63B439E5" Ref="R?"  Part="1" 
AR Path="/63A11746/63B439E5" Ref="R?"  Part="1" 
AR Path="/63A12F68/63B439E5" Ref="R?"  Part="1" 
AR Path="/63A14AD1/63B439E5" Ref="R?"  Part="1" 
AR Path="/63A169E8/63B439E5" Ref="R?"  Part="1" 
AR Path="/63B439E5" Ref="R10"  Part="1" 
F 0 "R10" H 5450 2400 50  0000 L CNN
F 1 "4K7 0.125W" V 5400 2400 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5330 2400 50  0001 C CNN
F 3 "~" H 5400 2400 50  0001 C CNN
F 4 "0.125W" V 5500 2400 50  0001 C CNN "Power"
	1    5400 2400
	1    0    0    -1  
$EndComp
Connection ~ 5400 2650
Wire Wire Line
	5400 2650 5500 2650
Wire Wire Line
	5400 2650 5400 2550
Wire Wire Line
	5800 3550 5800 3350
Wire Wire Line
	5800 3350 5600 3350
Wire Wire Line
	5800 4250 5800 4750
Connection ~ 5800 4250
Wire Wire Line
	5200 3350 5200 3400
Connection ~ 5400 3350
Wire Wire Line
	5200 3350 5400 3350
Wire Wire Line
	5400 750  5400 2250
Wire Wire Line
	5600 1100 5600 2750
$Comp
L Isolator:SFH617A-1 U?
U 1 1 63B4EC5C
P 6400 3050
AR Path="/62FB7846/63B4EC5C" Ref="U?"  Part="1" 
AR Path="/63089671/63B4EC5C" Ref="U?"  Part="1" 
AR Path="/63103CAF/63B4EC5C" Ref="U?"  Part="1" 
AR Path="/62F64647/63B4EC5C" Ref="U?"  Part="1" 
AR Path="/62FD589D/63B4EC5C" Ref="U?"  Part="1" 
AR Path="/63041ECA/63B4EC5C" Ref="U?"  Part="1" 
AR Path="/62F45EE0/63B4EC5C" Ref="U?"  Part="1" 
AR Path="/62FB890E/63B4EC5C" Ref="U?"  Part="1" 
AR Path="/63A4C39E/63B4EC5C" Ref="U?"  Part="1" 
AR Path="/63A0C125/63B4EC5C" Ref="U?"  Part="1" 
AR Path="/63A0DEDA/63B4EC5C" Ref="U?"  Part="1" 
AR Path="/63A1004D/63B4EC5C" Ref="U?"  Part="1" 
AR Path="/63A11746/63B4EC5C" Ref="U?"  Part="1" 
AR Path="/63A12F68/63B4EC5C" Ref="U?"  Part="1" 
AR Path="/63A14AD1/63B4EC5C" Ref="U?"  Part="1" 
AR Path="/63A169E8/63B4EC5C" Ref="U?"  Part="1" 
AR Path="/63B4EC5C" Ref="U5"  Part="1" 
F 0 "U5" H 6400 2850 50  0000 C CNN
F 1 "SFH617A-1" H 6400 3250 50  0000 C CNN
F 2 "Package_DIP:SMDIP-4_W7.62mm" H 6200 2850 50  0001 L CIN
F 3 "http://www.vishay.com/docs/83740/sfh617a.pdf" H 6400 3050 50  0001 L CNN
	1    6400 3050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 63B4EC63
P 6300 3550
AR Path="/62FB7846/63B4EC63" Ref="R?"  Part="1" 
AR Path="/63089671/63B4EC63" Ref="R?"  Part="1" 
AR Path="/63103CAF/63B4EC63" Ref="R?"  Part="1" 
AR Path="/62F64647/63B4EC63" Ref="R?"  Part="1" 
AR Path="/62FD589D/63B4EC63" Ref="R?"  Part="1" 
AR Path="/63041ECA/63B4EC63" Ref="R?"  Part="1" 
AR Path="/62F45EE0/63B4EC63" Ref="R?"  Part="1" 
AR Path="/62FB890E/63B4EC63" Ref="R?"  Part="1" 
AR Path="/63A4C39E/63B4EC63" Ref="R?"  Part="1" 
AR Path="/63A0C125/63B4EC63" Ref="R?"  Part="1" 
AR Path="/63A0DEDA/63B4EC63" Ref="R?"  Part="1" 
AR Path="/63A1004D/63B4EC63" Ref="R?"  Part="1" 
AR Path="/63A11746/63B4EC63" Ref="R?"  Part="1" 
AR Path="/63A12F68/63B4EC63" Ref="R?"  Part="1" 
AR Path="/63A14AD1/63B4EC63" Ref="R?"  Part="1" 
AR Path="/63A169E8/63B4EC63" Ref="R?"  Part="1" 
AR Path="/63B4EC63" Ref="R14"  Part="1" 
F 0 "R14" H 6350 3550 50  0000 L CNN
F 1 "10K 0.5W" V 6300 3550 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6230 3550 50  0001 C CNN
F 3 "~" H 6300 3550 50  0001 C CNN
F 4 "0.125W" V 6400 3550 50  0001 C CNN "Power"
	1    6300 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 3400 6300 3350
Wire Wire Line
	6300 3700 6300 3750
Wire Wire Line
	6300 3750 6400 3750
$Comp
L Device:R R?
U 1 1 63B4EC6D
P 6700 4100
AR Path="/62FB7846/63B4EC6D" Ref="R?"  Part="1" 
AR Path="/63089671/63B4EC6D" Ref="R?"  Part="1" 
AR Path="/63103CAF/63B4EC6D" Ref="R?"  Part="1" 
AR Path="/62F64647/63B4EC6D" Ref="R?"  Part="1" 
AR Path="/62FD589D/63B4EC6D" Ref="R?"  Part="1" 
AR Path="/63041ECA/63B4EC6D" Ref="R?"  Part="1" 
AR Path="/62F45EE0/63B4EC6D" Ref="R?"  Part="1" 
AR Path="/62FB890E/63B4EC6D" Ref="R?"  Part="1" 
AR Path="/63A4C39E/63B4EC6D" Ref="R?"  Part="1" 
AR Path="/63A0C125/63B4EC6D" Ref="R?"  Part="1" 
AR Path="/63A0DEDA/63B4EC6D" Ref="R?"  Part="1" 
AR Path="/63A1004D/63B4EC6D" Ref="R?"  Part="1" 
AR Path="/63A11746/63B4EC6D" Ref="R?"  Part="1" 
AR Path="/63A12F68/63B4EC6D" Ref="R?"  Part="1" 
AR Path="/63A14AD1/63B4EC6D" Ref="R?"  Part="1" 
AR Path="/63A169E8/63B4EC6D" Ref="R?"  Part="1" 
AR Path="/63B4EC6D" Ref="R15"  Part="1" 
F 0 "R15" H 6750 4100 50  0000 L CNN
F 1 "100R 0.25W" V 6700 4100 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6630 4100 50  0001 C CNN
F 3 "~" H 6700 4100 50  0001 C CNN
F 4 "0.125W" V 6800 4100 50  0001 C CNN "Power"
	1    6700 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 4150 6300 4250
$Comp
L Transistor_BJT:BC337 Q?
U 1 1 63B4EC74
P 6600 3750
AR Path="/62FB7846/63B4EC74" Ref="Q?"  Part="1" 
AR Path="/63089671/63B4EC74" Ref="Q?"  Part="1" 
AR Path="/63103CAF/63B4EC74" Ref="Q?"  Part="1" 
AR Path="/62F64647/63B4EC74" Ref="Q?"  Part="1" 
AR Path="/62FD589D/63B4EC74" Ref="Q?"  Part="1" 
AR Path="/63041ECA/63B4EC74" Ref="Q?"  Part="1" 
AR Path="/62F45EE0/63B4EC74" Ref="Q?"  Part="1" 
AR Path="/62FB890E/63B4EC74" Ref="Q?"  Part="1" 
AR Path="/63A4C39E/63B4EC74" Ref="Q?"  Part="1" 
AR Path="/63A0C125/63B4EC74" Ref="Q?"  Part="1" 
AR Path="/63A0DEDA/63B4EC74" Ref="Q?"  Part="1" 
AR Path="/63A1004D/63B4EC74" Ref="Q?"  Part="1" 
AR Path="/63A11746/63B4EC74" Ref="Q?"  Part="1" 
AR Path="/63A12F68/63B4EC74" Ref="Q?"  Part="1" 
AR Path="/63A14AD1/63B4EC74" Ref="Q?"  Part="1" 
AR Path="/63A169E8/63B4EC74" Ref="Q?"  Part="1" 
AR Path="/63B4EC74" Ref="Q10"  Part="1" 
F 0 "Q10" H 6791 3796 50  0000 L CNN
F 1 "BC337-40" H 6791 3705 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TSOT-23" H 6800 3675 50  0001 L CIN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bc337.pdf" H 6600 3750 50  0001 L CNN
	1    6600 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 3950 6700 3950
Connection ~ 6700 3950
Wire Wire Line
	6700 4250 6300 4250
$Comp
L Simulation_SPICE:DIODE D?
U 1 1 63B4EC7F
P 6100 3550
AR Path="/62FB7846/63B4EC7F" Ref="D?"  Part="1" 
AR Path="/63089671/63B4EC7F" Ref="D?"  Part="1" 
AR Path="/63103CAF/63B4EC7F" Ref="D?"  Part="1" 
AR Path="/62F64647/63B4EC7F" Ref="D?"  Part="1" 
AR Path="/62FD589D/63B4EC7F" Ref="D?"  Part="1" 
AR Path="/63041ECA/63B4EC7F" Ref="D?"  Part="1" 
AR Path="/62F45EE0/63B4EC7F" Ref="D?"  Part="1" 
AR Path="/62FB890E/63B4EC7F" Ref="D?"  Part="1" 
AR Path="/63A4C39E/63B4EC7F" Ref="D?"  Part="1" 
AR Path="/63A0C125/63B4EC7F" Ref="D?"  Part="1" 
AR Path="/63A0DEDA/63B4EC7F" Ref="D?"  Part="1" 
AR Path="/63A1004D/63B4EC7F" Ref="D?"  Part="1" 
AR Path="/63A11746/63B4EC7F" Ref="D?"  Part="1" 
AR Path="/63A12F68/63B4EC7F" Ref="D?"  Part="1" 
AR Path="/63A14AD1/63B4EC7F" Ref="D?"  Part="1" 
AR Path="/63A169E8/63B4EC7F" Ref="D?"  Part="1" 
AR Path="/63B4EC7F" Ref="D5"  Part="1" 
F 0 "D5" H 5900 3500 50  0000 L CNN
F 1 "IN4007" H 6150 3500 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 6100 3550 50  0001 C CNN
F 3 "~" H 6100 3550 50  0001 C CNN
F 4 "Y" H 6100 3550 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "D" H 6100 3550 50  0001 L CNN "Spice_Primitive"
	1    6100 3550
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_BJT:BC547 Q?
U 1 1 63B4EC85
P 6400 3950
AR Path="/62FB7846/63B4EC85" Ref="Q?"  Part="1" 
AR Path="/63089671/63B4EC85" Ref="Q?"  Part="1" 
AR Path="/63103CAF/63B4EC85" Ref="Q?"  Part="1" 
AR Path="/62F64647/63B4EC85" Ref="Q?"  Part="1" 
AR Path="/62FD589D/63B4EC85" Ref="Q?"  Part="1" 
AR Path="/63041ECA/63B4EC85" Ref="Q?"  Part="1" 
AR Path="/62F45EE0/63B4EC85" Ref="Q?"  Part="1" 
AR Path="/62FB890E/63B4EC85" Ref="Q?"  Part="1" 
AR Path="/63A4C39E/63B4EC85" Ref="Q?"  Part="1" 
AR Path="/63A0C125/63B4EC85" Ref="Q?"  Part="1" 
AR Path="/63A0DEDA/63B4EC85" Ref="Q?"  Part="1" 
AR Path="/63A1004D/63B4EC85" Ref="Q?"  Part="1" 
AR Path="/63A11746/63B4EC85" Ref="Q?"  Part="1" 
AR Path="/63A12F68/63B4EC85" Ref="Q?"  Part="1" 
AR Path="/63A14AD1/63B4EC85" Ref="Q?"  Part="1" 
AR Path="/63A169E8/63B4EC85" Ref="Q?"  Part="1" 
AR Path="/63B4EC85" Ref="Q9"  Part="1" 
F 0 "Q9" H 6591 3996 50  0000 L CNN
F 1 "BC547" H 6591 3905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TSOT-23" H 6600 3875 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 6400 3950 50  0001 L CNN
	1    6400 3950
	-1   0    0    -1  
$EndComp
Connection ~ 6300 3750
Wire Wire Line
	6300 2750 6300 2650
$Comp
L Device:R R?
U 1 1 63B4EC8E
P 6300 2400
AR Path="/62FB7846/63B4EC8E" Ref="R?"  Part="1" 
AR Path="/63089671/63B4EC8E" Ref="R?"  Part="1" 
AR Path="/63103CAF/63B4EC8E" Ref="R?"  Part="1" 
AR Path="/62F64647/63B4EC8E" Ref="R?"  Part="1" 
AR Path="/62FD589D/63B4EC8E" Ref="R?"  Part="1" 
AR Path="/63041ECA/63B4EC8E" Ref="R?"  Part="1" 
AR Path="/62F45EE0/63B4EC8E" Ref="R?"  Part="1" 
AR Path="/62FB890E/63B4EC8E" Ref="R?"  Part="1" 
AR Path="/63A4C39E/63B4EC8E" Ref="R?"  Part="1" 
AR Path="/63A0C125/63B4EC8E" Ref="R?"  Part="1" 
AR Path="/63A0DEDA/63B4EC8E" Ref="R?"  Part="1" 
AR Path="/63A1004D/63B4EC8E" Ref="R?"  Part="1" 
AR Path="/63A11746/63B4EC8E" Ref="R?"  Part="1" 
AR Path="/63A12F68/63B4EC8E" Ref="R?"  Part="1" 
AR Path="/63A14AD1/63B4EC8E" Ref="R?"  Part="1" 
AR Path="/63A169E8/63B4EC8E" Ref="R?"  Part="1" 
AR Path="/63B4EC8E" Ref="R13"  Part="1" 
F 0 "R13" H 6350 2400 50  0000 L CNN
F 1 "4K7 0.125W" V 6300 2400 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6230 2400 50  0001 C CNN
F 3 "~" H 6300 2400 50  0001 C CNN
F 4 "0.125W" V 6400 2400 50  0001 C CNN "Power"
	1    6300 2400
	1    0    0    -1  
$EndComp
Connection ~ 6300 2650
Wire Wire Line
	6300 2650 6400 2650
Wire Wire Line
	6300 2650 6300 2550
Wire Wire Line
	6700 3550 6700 3350
Wire Wire Line
	6700 3350 6500 3350
Wire Wire Line
	6700 4250 6700 4750
Connection ~ 6700 4250
Wire Wire Line
	6100 3350 6100 3400
Connection ~ 6300 3350
Wire Wire Line
	6100 3350 6300 3350
Wire Wire Line
	6300 750  6300 2250
Wire Wire Line
	6500 1100 6500 2750
$Comp
L Isolator:SFH617A-1 U?
U 1 1 63B5F1AE
P 7300 3050
AR Path="/62FB7846/63B5F1AE" Ref="U?"  Part="1" 
AR Path="/63089671/63B5F1AE" Ref="U?"  Part="1" 
AR Path="/63103CAF/63B5F1AE" Ref="U?"  Part="1" 
AR Path="/62F64647/63B5F1AE" Ref="U?"  Part="1" 
AR Path="/62FD589D/63B5F1AE" Ref="U?"  Part="1" 
AR Path="/63041ECA/63B5F1AE" Ref="U?"  Part="1" 
AR Path="/62F45EE0/63B5F1AE" Ref="U?"  Part="1" 
AR Path="/62FB890E/63B5F1AE" Ref="U?"  Part="1" 
AR Path="/63A4C39E/63B5F1AE" Ref="U?"  Part="1" 
AR Path="/63A0C125/63B5F1AE" Ref="U?"  Part="1" 
AR Path="/63A0DEDA/63B5F1AE" Ref="U?"  Part="1" 
AR Path="/63A1004D/63B5F1AE" Ref="U?"  Part="1" 
AR Path="/63A11746/63B5F1AE" Ref="U?"  Part="1" 
AR Path="/63A12F68/63B5F1AE" Ref="U?"  Part="1" 
AR Path="/63A14AD1/63B5F1AE" Ref="U?"  Part="1" 
AR Path="/63A169E8/63B5F1AE" Ref="U?"  Part="1" 
AR Path="/63B5F1AE" Ref="U6"  Part="1" 
F 0 "U6" H 7300 2850 50  0000 C CNN
F 1 "SFH617A-1" H 7300 3250 50  0000 C CNN
F 2 "Package_DIP:SMDIP-4_W7.62mm" H 7100 2850 50  0001 L CIN
F 3 "http://www.vishay.com/docs/83740/sfh617a.pdf" H 7300 3050 50  0001 L CNN
	1    7300 3050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 63B5F1B5
P 7200 3550
AR Path="/62FB7846/63B5F1B5" Ref="R?"  Part="1" 
AR Path="/63089671/63B5F1B5" Ref="R?"  Part="1" 
AR Path="/63103CAF/63B5F1B5" Ref="R?"  Part="1" 
AR Path="/62F64647/63B5F1B5" Ref="R?"  Part="1" 
AR Path="/62FD589D/63B5F1B5" Ref="R?"  Part="1" 
AR Path="/63041ECA/63B5F1B5" Ref="R?"  Part="1" 
AR Path="/62F45EE0/63B5F1B5" Ref="R?"  Part="1" 
AR Path="/62FB890E/63B5F1B5" Ref="R?"  Part="1" 
AR Path="/63A4C39E/63B5F1B5" Ref="R?"  Part="1" 
AR Path="/63A0C125/63B5F1B5" Ref="R?"  Part="1" 
AR Path="/63A0DEDA/63B5F1B5" Ref="R?"  Part="1" 
AR Path="/63A1004D/63B5F1B5" Ref="R?"  Part="1" 
AR Path="/63A11746/63B5F1B5" Ref="R?"  Part="1" 
AR Path="/63A12F68/63B5F1B5" Ref="R?"  Part="1" 
AR Path="/63A14AD1/63B5F1B5" Ref="R?"  Part="1" 
AR Path="/63A169E8/63B5F1B5" Ref="R?"  Part="1" 
AR Path="/63B5F1B5" Ref="R17"  Part="1" 
F 0 "R17" H 7250 3550 50  0000 L CNN
F 1 "10K 0.5W" V 7200 3550 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7130 3550 50  0001 C CNN
F 3 "~" H 7200 3550 50  0001 C CNN
F 4 "0.125W" V 7300 3550 50  0001 C CNN "Power"
	1    7200 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 3400 7200 3350
Wire Wire Line
	7200 3700 7200 3750
Wire Wire Line
	7200 3750 7300 3750
$Comp
L Device:R R?
U 1 1 63B5F1BF
P 7600 4100
AR Path="/62FB7846/63B5F1BF" Ref="R?"  Part="1" 
AR Path="/63089671/63B5F1BF" Ref="R?"  Part="1" 
AR Path="/63103CAF/63B5F1BF" Ref="R?"  Part="1" 
AR Path="/62F64647/63B5F1BF" Ref="R?"  Part="1" 
AR Path="/62FD589D/63B5F1BF" Ref="R?"  Part="1" 
AR Path="/63041ECA/63B5F1BF" Ref="R?"  Part="1" 
AR Path="/62F45EE0/63B5F1BF" Ref="R?"  Part="1" 
AR Path="/62FB890E/63B5F1BF" Ref="R?"  Part="1" 
AR Path="/63A4C39E/63B5F1BF" Ref="R?"  Part="1" 
AR Path="/63A0C125/63B5F1BF" Ref="R?"  Part="1" 
AR Path="/63A0DEDA/63B5F1BF" Ref="R?"  Part="1" 
AR Path="/63A1004D/63B5F1BF" Ref="R?"  Part="1" 
AR Path="/63A11746/63B5F1BF" Ref="R?"  Part="1" 
AR Path="/63A12F68/63B5F1BF" Ref="R?"  Part="1" 
AR Path="/63A14AD1/63B5F1BF" Ref="R?"  Part="1" 
AR Path="/63A169E8/63B5F1BF" Ref="R?"  Part="1" 
AR Path="/63B5F1BF" Ref="R18"  Part="1" 
F 0 "R18" H 7650 4100 50  0000 L CNN
F 1 "100R 0.25W" V 7600 4100 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7530 4100 50  0001 C CNN
F 3 "~" H 7600 4100 50  0001 C CNN
F 4 "0.125W" V 7700 4100 50  0001 C CNN "Power"
	1    7600 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 4150 7200 4250
$Comp
L Transistor_BJT:BC337 Q?
U 1 1 63B5F1C6
P 7500 3750
AR Path="/62FB7846/63B5F1C6" Ref="Q?"  Part="1" 
AR Path="/63089671/63B5F1C6" Ref="Q?"  Part="1" 
AR Path="/63103CAF/63B5F1C6" Ref="Q?"  Part="1" 
AR Path="/62F64647/63B5F1C6" Ref="Q?"  Part="1" 
AR Path="/62FD589D/63B5F1C6" Ref="Q?"  Part="1" 
AR Path="/63041ECA/63B5F1C6" Ref="Q?"  Part="1" 
AR Path="/62F45EE0/63B5F1C6" Ref="Q?"  Part="1" 
AR Path="/62FB890E/63B5F1C6" Ref="Q?"  Part="1" 
AR Path="/63A4C39E/63B5F1C6" Ref="Q?"  Part="1" 
AR Path="/63A0C125/63B5F1C6" Ref="Q?"  Part="1" 
AR Path="/63A0DEDA/63B5F1C6" Ref="Q?"  Part="1" 
AR Path="/63A1004D/63B5F1C6" Ref="Q?"  Part="1" 
AR Path="/63A11746/63B5F1C6" Ref="Q?"  Part="1" 
AR Path="/63A12F68/63B5F1C6" Ref="Q?"  Part="1" 
AR Path="/63A14AD1/63B5F1C6" Ref="Q?"  Part="1" 
AR Path="/63A169E8/63B5F1C6" Ref="Q?"  Part="1" 
AR Path="/63B5F1C6" Ref="Q12"  Part="1" 
F 0 "Q12" H 7691 3796 50  0000 L CNN
F 1 "BC337-40" H 7691 3705 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TSOT-23" H 7700 3675 50  0001 L CIN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bc337.pdf" H 7500 3750 50  0001 L CNN
	1    7500 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 3950 7600 3950
Connection ~ 7600 3950
Wire Wire Line
	7600 4250 7200 4250
$Comp
L Simulation_SPICE:DIODE D?
U 1 1 63B5F1D1
P 7000 3550
AR Path="/62FB7846/63B5F1D1" Ref="D?"  Part="1" 
AR Path="/63089671/63B5F1D1" Ref="D?"  Part="1" 
AR Path="/63103CAF/63B5F1D1" Ref="D?"  Part="1" 
AR Path="/62F64647/63B5F1D1" Ref="D?"  Part="1" 
AR Path="/62FD589D/63B5F1D1" Ref="D?"  Part="1" 
AR Path="/63041ECA/63B5F1D1" Ref="D?"  Part="1" 
AR Path="/62F45EE0/63B5F1D1" Ref="D?"  Part="1" 
AR Path="/62FB890E/63B5F1D1" Ref="D?"  Part="1" 
AR Path="/63A4C39E/63B5F1D1" Ref="D?"  Part="1" 
AR Path="/63A0C125/63B5F1D1" Ref="D?"  Part="1" 
AR Path="/63A0DEDA/63B5F1D1" Ref="D?"  Part="1" 
AR Path="/63A1004D/63B5F1D1" Ref="D?"  Part="1" 
AR Path="/63A11746/63B5F1D1" Ref="D?"  Part="1" 
AR Path="/63A12F68/63B5F1D1" Ref="D?"  Part="1" 
AR Path="/63A14AD1/63B5F1D1" Ref="D?"  Part="1" 
AR Path="/63A169E8/63B5F1D1" Ref="D?"  Part="1" 
AR Path="/63B5F1D1" Ref="D6"  Part="1" 
F 0 "D6" H 6800 3500 50  0000 L CNN
F 1 "IN4007" H 7050 3500 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 7000 3550 50  0001 C CNN
F 3 "~" H 7000 3550 50  0001 C CNN
F 4 "Y" H 7000 3550 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "D" H 7000 3550 50  0001 L CNN "Spice_Primitive"
	1    7000 3550
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_BJT:BC547 Q?
U 1 1 63B5F1D7
P 7300 3950
AR Path="/62FB7846/63B5F1D7" Ref="Q?"  Part="1" 
AR Path="/63089671/63B5F1D7" Ref="Q?"  Part="1" 
AR Path="/63103CAF/63B5F1D7" Ref="Q?"  Part="1" 
AR Path="/62F64647/63B5F1D7" Ref="Q?"  Part="1" 
AR Path="/62FD589D/63B5F1D7" Ref="Q?"  Part="1" 
AR Path="/63041ECA/63B5F1D7" Ref="Q?"  Part="1" 
AR Path="/62F45EE0/63B5F1D7" Ref="Q?"  Part="1" 
AR Path="/62FB890E/63B5F1D7" Ref="Q?"  Part="1" 
AR Path="/63A4C39E/63B5F1D7" Ref="Q?"  Part="1" 
AR Path="/63A0C125/63B5F1D7" Ref="Q?"  Part="1" 
AR Path="/63A0DEDA/63B5F1D7" Ref="Q?"  Part="1" 
AR Path="/63A1004D/63B5F1D7" Ref="Q?"  Part="1" 
AR Path="/63A11746/63B5F1D7" Ref="Q?"  Part="1" 
AR Path="/63A12F68/63B5F1D7" Ref="Q?"  Part="1" 
AR Path="/63A14AD1/63B5F1D7" Ref="Q?"  Part="1" 
AR Path="/63A169E8/63B5F1D7" Ref="Q?"  Part="1" 
AR Path="/63B5F1D7" Ref="Q11"  Part="1" 
F 0 "Q11" H 7491 3996 50  0000 L CNN
F 1 "BC547" H 7491 3905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TSOT-23" H 7500 3875 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 7300 3950 50  0001 L CNN
	1    7300 3950
	-1   0    0    -1  
$EndComp
Connection ~ 7200 3750
Wire Wire Line
	7200 2750 7200 2650
$Comp
L Device:R R?
U 1 1 63B5F1E0
P 7200 2400
AR Path="/62FB7846/63B5F1E0" Ref="R?"  Part="1" 
AR Path="/63089671/63B5F1E0" Ref="R?"  Part="1" 
AR Path="/63103CAF/63B5F1E0" Ref="R?"  Part="1" 
AR Path="/62F64647/63B5F1E0" Ref="R?"  Part="1" 
AR Path="/62FD589D/63B5F1E0" Ref="R?"  Part="1" 
AR Path="/63041ECA/63B5F1E0" Ref="R?"  Part="1" 
AR Path="/62F45EE0/63B5F1E0" Ref="R?"  Part="1" 
AR Path="/62FB890E/63B5F1E0" Ref="R?"  Part="1" 
AR Path="/63A4C39E/63B5F1E0" Ref="R?"  Part="1" 
AR Path="/63A0C125/63B5F1E0" Ref="R?"  Part="1" 
AR Path="/63A0DEDA/63B5F1E0" Ref="R?"  Part="1" 
AR Path="/63A1004D/63B5F1E0" Ref="R?"  Part="1" 
AR Path="/63A11746/63B5F1E0" Ref="R?"  Part="1" 
AR Path="/63A12F68/63B5F1E0" Ref="R?"  Part="1" 
AR Path="/63A14AD1/63B5F1E0" Ref="R?"  Part="1" 
AR Path="/63A169E8/63B5F1E0" Ref="R?"  Part="1" 
AR Path="/63B5F1E0" Ref="R16"  Part="1" 
F 0 "R16" H 7250 2400 50  0000 L CNN
F 1 "4K7 0.125W" V 7200 2400 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7130 2400 50  0001 C CNN
F 3 "~" H 7200 2400 50  0001 C CNN
F 4 "0.125W" V 7300 2400 50  0001 C CNN "Power"
	1    7200 2400
	1    0    0    -1  
$EndComp
Connection ~ 7200 2650
Wire Wire Line
	7200 2650 7300 2650
Wire Wire Line
	7200 2650 7200 2550
Wire Wire Line
	7600 3550 7600 3350
Wire Wire Line
	7600 3350 7400 3350
Wire Wire Line
	7600 4250 7600 4750
Connection ~ 7600 4250
Wire Wire Line
	7000 3350 7000 3400
Connection ~ 7200 3350
Wire Wire Line
	7000 3350 7200 3350
Wire Wire Line
	7200 750  7200 2250
Wire Wire Line
	7400 1100 7400 2750
$Comp
L Isolator:SFH617A-1 U?
U 1 1 63B6FF1B
P 8200 3050
AR Path="/62FB7846/63B6FF1B" Ref="U?"  Part="1" 
AR Path="/63089671/63B6FF1B" Ref="U?"  Part="1" 
AR Path="/63103CAF/63B6FF1B" Ref="U?"  Part="1" 
AR Path="/62F64647/63B6FF1B" Ref="U?"  Part="1" 
AR Path="/62FD589D/63B6FF1B" Ref="U?"  Part="1" 
AR Path="/63041ECA/63B6FF1B" Ref="U?"  Part="1" 
AR Path="/62F45EE0/63B6FF1B" Ref="U?"  Part="1" 
AR Path="/62FB890E/63B6FF1B" Ref="U?"  Part="1" 
AR Path="/63A4C39E/63B6FF1B" Ref="U?"  Part="1" 
AR Path="/63A0C125/63B6FF1B" Ref="U?"  Part="1" 
AR Path="/63A0DEDA/63B6FF1B" Ref="U?"  Part="1" 
AR Path="/63A1004D/63B6FF1B" Ref="U?"  Part="1" 
AR Path="/63A11746/63B6FF1B" Ref="U?"  Part="1" 
AR Path="/63A12F68/63B6FF1B" Ref="U?"  Part="1" 
AR Path="/63A14AD1/63B6FF1B" Ref="U?"  Part="1" 
AR Path="/63A169E8/63B6FF1B" Ref="U?"  Part="1" 
AR Path="/63B6FF1B" Ref="U7"  Part="1" 
F 0 "U7" H 8200 2850 50  0000 C CNN
F 1 "SFH617A-1" H 8200 3250 50  0000 C CNN
F 2 "Package_DIP:SMDIP-4_W7.62mm" H 8000 2850 50  0001 L CIN
F 3 "http://www.vishay.com/docs/83740/sfh617a.pdf" H 8200 3050 50  0001 L CNN
	1    8200 3050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 63B6FF22
P 8100 3550
AR Path="/62FB7846/63B6FF22" Ref="R?"  Part="1" 
AR Path="/63089671/63B6FF22" Ref="R?"  Part="1" 
AR Path="/63103CAF/63B6FF22" Ref="R?"  Part="1" 
AR Path="/62F64647/63B6FF22" Ref="R?"  Part="1" 
AR Path="/62FD589D/63B6FF22" Ref="R?"  Part="1" 
AR Path="/63041ECA/63B6FF22" Ref="R?"  Part="1" 
AR Path="/62F45EE0/63B6FF22" Ref="R?"  Part="1" 
AR Path="/62FB890E/63B6FF22" Ref="R?"  Part="1" 
AR Path="/63A4C39E/63B6FF22" Ref="R?"  Part="1" 
AR Path="/63A0C125/63B6FF22" Ref="R?"  Part="1" 
AR Path="/63A0DEDA/63B6FF22" Ref="R?"  Part="1" 
AR Path="/63A1004D/63B6FF22" Ref="R?"  Part="1" 
AR Path="/63A11746/63B6FF22" Ref="R?"  Part="1" 
AR Path="/63A12F68/63B6FF22" Ref="R?"  Part="1" 
AR Path="/63A14AD1/63B6FF22" Ref="R?"  Part="1" 
AR Path="/63A169E8/63B6FF22" Ref="R?"  Part="1" 
AR Path="/63B6FF22" Ref="R20"  Part="1" 
F 0 "R20" H 8150 3550 50  0000 L CNN
F 1 "10K 0.5W" V 8100 3550 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8030 3550 50  0001 C CNN
F 3 "~" H 8100 3550 50  0001 C CNN
F 4 "0.125W" V 8200 3550 50  0001 C CNN "Power"
	1    8100 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 3400 8100 3350
Wire Wire Line
	8100 3700 8100 3750
Wire Wire Line
	8100 3750 8200 3750
$Comp
L Device:R R?
U 1 1 63B6FF2C
P 8500 4100
AR Path="/62FB7846/63B6FF2C" Ref="R?"  Part="1" 
AR Path="/63089671/63B6FF2C" Ref="R?"  Part="1" 
AR Path="/63103CAF/63B6FF2C" Ref="R?"  Part="1" 
AR Path="/62F64647/63B6FF2C" Ref="R?"  Part="1" 
AR Path="/62FD589D/63B6FF2C" Ref="R?"  Part="1" 
AR Path="/63041ECA/63B6FF2C" Ref="R?"  Part="1" 
AR Path="/62F45EE0/63B6FF2C" Ref="R?"  Part="1" 
AR Path="/62FB890E/63B6FF2C" Ref="R?"  Part="1" 
AR Path="/63A4C39E/63B6FF2C" Ref="R?"  Part="1" 
AR Path="/63A0C125/63B6FF2C" Ref="R?"  Part="1" 
AR Path="/63A0DEDA/63B6FF2C" Ref="R?"  Part="1" 
AR Path="/63A1004D/63B6FF2C" Ref="R?"  Part="1" 
AR Path="/63A11746/63B6FF2C" Ref="R?"  Part="1" 
AR Path="/63A12F68/63B6FF2C" Ref="R?"  Part="1" 
AR Path="/63A14AD1/63B6FF2C" Ref="R?"  Part="1" 
AR Path="/63A169E8/63B6FF2C" Ref="R?"  Part="1" 
AR Path="/63B6FF2C" Ref="R21"  Part="1" 
F 0 "R21" H 8550 4100 50  0000 L CNN
F 1 "100R 0.25W" V 8500 4100 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8430 4100 50  0001 C CNN
F 3 "~" H 8500 4100 50  0001 C CNN
F 4 "0.125W" V 8600 4100 50  0001 C CNN "Power"
	1    8500 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 4150 8100 4250
$Comp
L Transistor_BJT:BC337 Q?
U 1 1 63B6FF33
P 8400 3750
AR Path="/62FB7846/63B6FF33" Ref="Q?"  Part="1" 
AR Path="/63089671/63B6FF33" Ref="Q?"  Part="1" 
AR Path="/63103CAF/63B6FF33" Ref="Q?"  Part="1" 
AR Path="/62F64647/63B6FF33" Ref="Q?"  Part="1" 
AR Path="/62FD589D/63B6FF33" Ref="Q?"  Part="1" 
AR Path="/63041ECA/63B6FF33" Ref="Q?"  Part="1" 
AR Path="/62F45EE0/63B6FF33" Ref="Q?"  Part="1" 
AR Path="/62FB890E/63B6FF33" Ref="Q?"  Part="1" 
AR Path="/63A4C39E/63B6FF33" Ref="Q?"  Part="1" 
AR Path="/63A0C125/63B6FF33" Ref="Q?"  Part="1" 
AR Path="/63A0DEDA/63B6FF33" Ref="Q?"  Part="1" 
AR Path="/63A1004D/63B6FF33" Ref="Q?"  Part="1" 
AR Path="/63A11746/63B6FF33" Ref="Q?"  Part="1" 
AR Path="/63A12F68/63B6FF33" Ref="Q?"  Part="1" 
AR Path="/63A14AD1/63B6FF33" Ref="Q?"  Part="1" 
AR Path="/63A169E8/63B6FF33" Ref="Q?"  Part="1" 
AR Path="/63B6FF33" Ref="Q14"  Part="1" 
F 0 "Q14" H 8591 3796 50  0000 L CNN
F 1 "BC337-40" H 8591 3705 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TSOT-23" H 8600 3675 50  0001 L CIN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bc337.pdf" H 8400 3750 50  0001 L CNN
	1    8400 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 3950 8500 3950
Connection ~ 8500 3950
Wire Wire Line
	8500 4250 8100 4250
$Comp
L Simulation_SPICE:DIODE D?
U 1 1 63B6FF3E
P 7900 3550
AR Path="/62FB7846/63B6FF3E" Ref="D?"  Part="1" 
AR Path="/63089671/63B6FF3E" Ref="D?"  Part="1" 
AR Path="/63103CAF/63B6FF3E" Ref="D?"  Part="1" 
AR Path="/62F64647/63B6FF3E" Ref="D?"  Part="1" 
AR Path="/62FD589D/63B6FF3E" Ref="D?"  Part="1" 
AR Path="/63041ECA/63B6FF3E" Ref="D?"  Part="1" 
AR Path="/62F45EE0/63B6FF3E" Ref="D?"  Part="1" 
AR Path="/62FB890E/63B6FF3E" Ref="D?"  Part="1" 
AR Path="/63A4C39E/63B6FF3E" Ref="D?"  Part="1" 
AR Path="/63A0C125/63B6FF3E" Ref="D?"  Part="1" 
AR Path="/63A0DEDA/63B6FF3E" Ref="D?"  Part="1" 
AR Path="/63A1004D/63B6FF3E" Ref="D?"  Part="1" 
AR Path="/63A11746/63B6FF3E" Ref="D?"  Part="1" 
AR Path="/63A12F68/63B6FF3E" Ref="D?"  Part="1" 
AR Path="/63A14AD1/63B6FF3E" Ref="D?"  Part="1" 
AR Path="/63A169E8/63B6FF3E" Ref="D?"  Part="1" 
AR Path="/63B6FF3E" Ref="D7"  Part="1" 
F 0 "D7" H 7700 3500 50  0000 L CNN
F 1 "IN4007" H 7950 3500 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 7900 3550 50  0001 C CNN
F 3 "~" H 7900 3550 50  0001 C CNN
F 4 "Y" H 7900 3550 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "D" H 7900 3550 50  0001 L CNN "Spice_Primitive"
	1    7900 3550
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_BJT:BC547 Q?
U 1 1 63B6FF44
P 8200 3950
AR Path="/62FB7846/63B6FF44" Ref="Q?"  Part="1" 
AR Path="/63089671/63B6FF44" Ref="Q?"  Part="1" 
AR Path="/63103CAF/63B6FF44" Ref="Q?"  Part="1" 
AR Path="/62F64647/63B6FF44" Ref="Q?"  Part="1" 
AR Path="/62FD589D/63B6FF44" Ref="Q?"  Part="1" 
AR Path="/63041ECA/63B6FF44" Ref="Q?"  Part="1" 
AR Path="/62F45EE0/63B6FF44" Ref="Q?"  Part="1" 
AR Path="/62FB890E/63B6FF44" Ref="Q?"  Part="1" 
AR Path="/63A4C39E/63B6FF44" Ref="Q?"  Part="1" 
AR Path="/63A0C125/63B6FF44" Ref="Q?"  Part="1" 
AR Path="/63A0DEDA/63B6FF44" Ref="Q?"  Part="1" 
AR Path="/63A1004D/63B6FF44" Ref="Q?"  Part="1" 
AR Path="/63A11746/63B6FF44" Ref="Q?"  Part="1" 
AR Path="/63A12F68/63B6FF44" Ref="Q?"  Part="1" 
AR Path="/63A14AD1/63B6FF44" Ref="Q?"  Part="1" 
AR Path="/63A169E8/63B6FF44" Ref="Q?"  Part="1" 
AR Path="/63B6FF44" Ref="Q13"  Part="1" 
F 0 "Q13" H 8391 3996 50  0000 L CNN
F 1 "BC547" H 8391 3905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TSOT-23" H 8400 3875 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 8200 3950 50  0001 L CNN
	1    8200 3950
	-1   0    0    -1  
$EndComp
Connection ~ 8100 3750
Wire Wire Line
	8100 2750 8100 2650
$Comp
L Device:R R?
U 1 1 63B6FF4D
P 8100 2400
AR Path="/62FB7846/63B6FF4D" Ref="R?"  Part="1" 
AR Path="/63089671/63B6FF4D" Ref="R?"  Part="1" 
AR Path="/63103CAF/63B6FF4D" Ref="R?"  Part="1" 
AR Path="/62F64647/63B6FF4D" Ref="R?"  Part="1" 
AR Path="/62FD589D/63B6FF4D" Ref="R?"  Part="1" 
AR Path="/63041ECA/63B6FF4D" Ref="R?"  Part="1" 
AR Path="/62F45EE0/63B6FF4D" Ref="R?"  Part="1" 
AR Path="/62FB890E/63B6FF4D" Ref="R?"  Part="1" 
AR Path="/63A4C39E/63B6FF4D" Ref="R?"  Part="1" 
AR Path="/63A0C125/63B6FF4D" Ref="R?"  Part="1" 
AR Path="/63A0DEDA/63B6FF4D" Ref="R?"  Part="1" 
AR Path="/63A1004D/63B6FF4D" Ref="R?"  Part="1" 
AR Path="/63A11746/63B6FF4D" Ref="R?"  Part="1" 
AR Path="/63A12F68/63B6FF4D" Ref="R?"  Part="1" 
AR Path="/63A14AD1/63B6FF4D" Ref="R?"  Part="1" 
AR Path="/63A169E8/63B6FF4D" Ref="R?"  Part="1" 
AR Path="/63B6FF4D" Ref="R19"  Part="1" 
F 0 "R19" H 8150 2400 50  0000 L CNN
F 1 "4K7 0.125W" V 8100 2400 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8030 2400 50  0001 C CNN
F 3 "~" H 8100 2400 50  0001 C CNN
F 4 "0.125W" V 8200 2400 50  0001 C CNN "Power"
	1    8100 2400
	1    0    0    -1  
$EndComp
Connection ~ 8100 2650
Wire Wire Line
	8100 2650 8200 2650
Wire Wire Line
	8100 2650 8100 2550
Wire Wire Line
	8500 3550 8500 3350
Wire Wire Line
	8500 3350 8300 3350
Wire Wire Line
	8500 4250 8500 4750
Connection ~ 8500 4250
Wire Wire Line
	7900 3350 7900 3400
Connection ~ 8100 3350
Wire Wire Line
	7900 3350 8100 3350
Wire Wire Line
	8100 750  8100 2250
Wire Wire Line
	8300 1100 8300 2750
$Comp
L Isolator:SFH617A-1 U?
U 1 1 63B7F18D
P 9100 3050
AR Path="/62FB7846/63B7F18D" Ref="U?"  Part="1" 
AR Path="/63089671/63B7F18D" Ref="U?"  Part="1" 
AR Path="/63103CAF/63B7F18D" Ref="U?"  Part="1" 
AR Path="/62F64647/63B7F18D" Ref="U?"  Part="1" 
AR Path="/62FD589D/63B7F18D" Ref="U?"  Part="1" 
AR Path="/63041ECA/63B7F18D" Ref="U?"  Part="1" 
AR Path="/62F45EE0/63B7F18D" Ref="U?"  Part="1" 
AR Path="/62FB890E/63B7F18D" Ref="U?"  Part="1" 
AR Path="/63A4C39E/63B7F18D" Ref="U?"  Part="1" 
AR Path="/63A0C125/63B7F18D" Ref="U?"  Part="1" 
AR Path="/63A0DEDA/63B7F18D" Ref="U?"  Part="1" 
AR Path="/63A1004D/63B7F18D" Ref="U?"  Part="1" 
AR Path="/63A11746/63B7F18D" Ref="U?"  Part="1" 
AR Path="/63A12F68/63B7F18D" Ref="U?"  Part="1" 
AR Path="/63A14AD1/63B7F18D" Ref="U?"  Part="1" 
AR Path="/63A169E8/63B7F18D" Ref="U?"  Part="1" 
AR Path="/63B7F18D" Ref="U8"  Part="1" 
F 0 "U8" H 9100 2850 50  0000 C CNN
F 1 "SFH617A-1" H 9100 3250 50  0000 C CNN
F 2 "Package_DIP:SMDIP-4_W7.62mm" H 8900 2850 50  0001 L CIN
F 3 "http://www.vishay.com/docs/83740/sfh617a.pdf" H 9100 3050 50  0001 L CNN
	1    9100 3050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 63B7F194
P 9000 3550
AR Path="/62FB7846/63B7F194" Ref="R?"  Part="1" 
AR Path="/63089671/63B7F194" Ref="R?"  Part="1" 
AR Path="/63103CAF/63B7F194" Ref="R?"  Part="1" 
AR Path="/62F64647/63B7F194" Ref="R?"  Part="1" 
AR Path="/62FD589D/63B7F194" Ref="R?"  Part="1" 
AR Path="/63041ECA/63B7F194" Ref="R?"  Part="1" 
AR Path="/62F45EE0/63B7F194" Ref="R?"  Part="1" 
AR Path="/62FB890E/63B7F194" Ref="R?"  Part="1" 
AR Path="/63A4C39E/63B7F194" Ref="R?"  Part="1" 
AR Path="/63A0C125/63B7F194" Ref="R?"  Part="1" 
AR Path="/63A0DEDA/63B7F194" Ref="R?"  Part="1" 
AR Path="/63A1004D/63B7F194" Ref="R?"  Part="1" 
AR Path="/63A11746/63B7F194" Ref="R?"  Part="1" 
AR Path="/63A12F68/63B7F194" Ref="R?"  Part="1" 
AR Path="/63A14AD1/63B7F194" Ref="R?"  Part="1" 
AR Path="/63A169E8/63B7F194" Ref="R?"  Part="1" 
AR Path="/63B7F194" Ref="R23"  Part="1" 
F 0 "R23" H 9050 3550 50  0000 L CNN
F 1 "10K 0.5W" V 9000 3550 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8930 3550 50  0001 C CNN
F 3 "~" H 9000 3550 50  0001 C CNN
F 4 "0.125W" V 9100 3550 50  0001 C CNN "Power"
	1    9000 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 3400 9000 3350
Wire Wire Line
	9000 3700 9000 3750
Wire Wire Line
	9000 3750 9100 3750
$Comp
L Device:R R?
U 1 1 63B7F19E
P 9400 4100
AR Path="/62FB7846/63B7F19E" Ref="R?"  Part="1" 
AR Path="/63089671/63B7F19E" Ref="R?"  Part="1" 
AR Path="/63103CAF/63B7F19E" Ref="R?"  Part="1" 
AR Path="/62F64647/63B7F19E" Ref="R?"  Part="1" 
AR Path="/62FD589D/63B7F19E" Ref="R?"  Part="1" 
AR Path="/63041ECA/63B7F19E" Ref="R?"  Part="1" 
AR Path="/62F45EE0/63B7F19E" Ref="R?"  Part="1" 
AR Path="/62FB890E/63B7F19E" Ref="R?"  Part="1" 
AR Path="/63A4C39E/63B7F19E" Ref="R?"  Part="1" 
AR Path="/63A0C125/63B7F19E" Ref="R?"  Part="1" 
AR Path="/63A0DEDA/63B7F19E" Ref="R?"  Part="1" 
AR Path="/63A1004D/63B7F19E" Ref="R?"  Part="1" 
AR Path="/63A11746/63B7F19E" Ref="R?"  Part="1" 
AR Path="/63A12F68/63B7F19E" Ref="R?"  Part="1" 
AR Path="/63A14AD1/63B7F19E" Ref="R?"  Part="1" 
AR Path="/63A169E8/63B7F19E" Ref="R?"  Part="1" 
AR Path="/63B7F19E" Ref="R24"  Part="1" 
F 0 "R24" H 9450 4100 50  0000 L CNN
F 1 "100R 0.25W" V 9400 4100 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 9330 4100 50  0001 C CNN
F 3 "~" H 9400 4100 50  0001 C CNN
F 4 "0.125W" V 9500 4100 50  0001 C CNN "Power"
	1    9400 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 4150 9000 4250
$Comp
L Transistor_BJT:BC337 Q?
U 1 1 63B7F1A5
P 9300 3750
AR Path="/62FB7846/63B7F1A5" Ref="Q?"  Part="1" 
AR Path="/63089671/63B7F1A5" Ref="Q?"  Part="1" 
AR Path="/63103CAF/63B7F1A5" Ref="Q?"  Part="1" 
AR Path="/62F64647/63B7F1A5" Ref="Q?"  Part="1" 
AR Path="/62FD589D/63B7F1A5" Ref="Q?"  Part="1" 
AR Path="/63041ECA/63B7F1A5" Ref="Q?"  Part="1" 
AR Path="/62F45EE0/63B7F1A5" Ref="Q?"  Part="1" 
AR Path="/62FB890E/63B7F1A5" Ref="Q?"  Part="1" 
AR Path="/63A4C39E/63B7F1A5" Ref="Q?"  Part="1" 
AR Path="/63A0C125/63B7F1A5" Ref="Q?"  Part="1" 
AR Path="/63A0DEDA/63B7F1A5" Ref="Q?"  Part="1" 
AR Path="/63A1004D/63B7F1A5" Ref="Q?"  Part="1" 
AR Path="/63A11746/63B7F1A5" Ref="Q?"  Part="1" 
AR Path="/63A12F68/63B7F1A5" Ref="Q?"  Part="1" 
AR Path="/63A14AD1/63B7F1A5" Ref="Q?"  Part="1" 
AR Path="/63A169E8/63B7F1A5" Ref="Q?"  Part="1" 
AR Path="/63B7F1A5" Ref="Q16"  Part="1" 
F 0 "Q16" H 9491 3796 50  0000 L CNN
F 1 "BC337-40" H 9491 3705 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TSOT-23" H 9500 3675 50  0001 L CIN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bc337.pdf" H 9300 3750 50  0001 L CNN
	1    9300 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 3950 9400 3950
Connection ~ 9400 3950
Wire Wire Line
	9400 4250 9000 4250
$Comp
L Simulation_SPICE:DIODE D?
U 1 1 63B7F1B0
P 8800 3550
AR Path="/62FB7846/63B7F1B0" Ref="D?"  Part="1" 
AR Path="/63089671/63B7F1B0" Ref="D?"  Part="1" 
AR Path="/63103CAF/63B7F1B0" Ref="D?"  Part="1" 
AR Path="/62F64647/63B7F1B0" Ref="D?"  Part="1" 
AR Path="/62FD589D/63B7F1B0" Ref="D?"  Part="1" 
AR Path="/63041ECA/63B7F1B0" Ref="D?"  Part="1" 
AR Path="/62F45EE0/63B7F1B0" Ref="D?"  Part="1" 
AR Path="/62FB890E/63B7F1B0" Ref="D?"  Part="1" 
AR Path="/63A4C39E/63B7F1B0" Ref="D?"  Part="1" 
AR Path="/63A0C125/63B7F1B0" Ref="D?"  Part="1" 
AR Path="/63A0DEDA/63B7F1B0" Ref="D?"  Part="1" 
AR Path="/63A1004D/63B7F1B0" Ref="D?"  Part="1" 
AR Path="/63A11746/63B7F1B0" Ref="D?"  Part="1" 
AR Path="/63A12F68/63B7F1B0" Ref="D?"  Part="1" 
AR Path="/63A14AD1/63B7F1B0" Ref="D?"  Part="1" 
AR Path="/63A169E8/63B7F1B0" Ref="D?"  Part="1" 
AR Path="/63B7F1B0" Ref="D8"  Part="1" 
F 0 "D8" H 8600 3500 50  0000 L CNN
F 1 "IN4007" H 8850 3500 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 8800 3550 50  0001 C CNN
F 3 "~" H 8800 3550 50  0001 C CNN
F 4 "Y" H 8800 3550 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "D" H 8800 3550 50  0001 L CNN "Spice_Primitive"
	1    8800 3550
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_BJT:BC547 Q?
U 1 1 63B7F1B6
P 9100 3950
AR Path="/62FB7846/63B7F1B6" Ref="Q?"  Part="1" 
AR Path="/63089671/63B7F1B6" Ref="Q?"  Part="1" 
AR Path="/63103CAF/63B7F1B6" Ref="Q?"  Part="1" 
AR Path="/62F64647/63B7F1B6" Ref="Q?"  Part="1" 
AR Path="/62FD589D/63B7F1B6" Ref="Q?"  Part="1" 
AR Path="/63041ECA/63B7F1B6" Ref="Q?"  Part="1" 
AR Path="/62F45EE0/63B7F1B6" Ref="Q?"  Part="1" 
AR Path="/62FB890E/63B7F1B6" Ref="Q?"  Part="1" 
AR Path="/63A4C39E/63B7F1B6" Ref="Q?"  Part="1" 
AR Path="/63A0C125/63B7F1B6" Ref="Q?"  Part="1" 
AR Path="/63A0DEDA/63B7F1B6" Ref="Q?"  Part="1" 
AR Path="/63A1004D/63B7F1B6" Ref="Q?"  Part="1" 
AR Path="/63A11746/63B7F1B6" Ref="Q?"  Part="1" 
AR Path="/63A12F68/63B7F1B6" Ref="Q?"  Part="1" 
AR Path="/63A14AD1/63B7F1B6" Ref="Q?"  Part="1" 
AR Path="/63A169E8/63B7F1B6" Ref="Q?"  Part="1" 
AR Path="/63B7F1B6" Ref="Q15"  Part="1" 
F 0 "Q15" H 9291 3996 50  0000 L CNN
F 1 "BC547" H 9291 3905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TSOT-23" H 9300 3875 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 9100 3950 50  0001 L CNN
	1    9100 3950
	-1   0    0    -1  
$EndComp
Connection ~ 9000 3750
Wire Wire Line
	9000 2750 9000 2650
$Comp
L Device:R R?
U 1 1 63B7F1BF
P 9000 2400
AR Path="/62FB7846/63B7F1BF" Ref="R?"  Part="1" 
AR Path="/63089671/63B7F1BF" Ref="R?"  Part="1" 
AR Path="/63103CAF/63B7F1BF" Ref="R?"  Part="1" 
AR Path="/62F64647/63B7F1BF" Ref="R?"  Part="1" 
AR Path="/62FD589D/63B7F1BF" Ref="R?"  Part="1" 
AR Path="/63041ECA/63B7F1BF" Ref="R?"  Part="1" 
AR Path="/62F45EE0/63B7F1BF" Ref="R?"  Part="1" 
AR Path="/62FB890E/63B7F1BF" Ref="R?"  Part="1" 
AR Path="/63A4C39E/63B7F1BF" Ref="R?"  Part="1" 
AR Path="/63A0C125/63B7F1BF" Ref="R?"  Part="1" 
AR Path="/63A0DEDA/63B7F1BF" Ref="R?"  Part="1" 
AR Path="/63A1004D/63B7F1BF" Ref="R?"  Part="1" 
AR Path="/63A11746/63B7F1BF" Ref="R?"  Part="1" 
AR Path="/63A12F68/63B7F1BF" Ref="R?"  Part="1" 
AR Path="/63A14AD1/63B7F1BF" Ref="R?"  Part="1" 
AR Path="/63A169E8/63B7F1BF" Ref="R?"  Part="1" 
AR Path="/63B7F1BF" Ref="R22"  Part="1" 
F 0 "R22" H 9050 2400 50  0000 L CNN
F 1 "4K7 0.125W" V 9000 2400 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8930 2400 50  0001 C CNN
F 3 "~" H 9000 2400 50  0001 C CNN
F 4 "0.125W" V 9100 2400 50  0001 C CNN "Power"
	1    9000 2400
	1    0    0    -1  
$EndComp
Connection ~ 9000 2650
Wire Wire Line
	9000 2650 9100 2650
Wire Wire Line
	9000 2650 9000 2550
Wire Wire Line
	9400 3550 9400 3350
Wire Wire Line
	9400 3350 9200 3350
Wire Wire Line
	9400 4250 9400 4750
Connection ~ 9400 4250
Wire Wire Line
	8800 3350 8800 3400
Connection ~ 9000 3350
Wire Wire Line
	8800 3350 9000 3350
Wire Wire Line
	9000 750  9000 2250
Wire Wire Line
	9200 1100 9200 2750
Wire Wire Line
	4300 3700 4300 5050
Wire Wire Line
	5200 3700 5200 5150
Wire Wire Line
	6100 3700 6100 5250
Wire Wire Line
	7000 3700 7000 5350
Wire Wire Line
	7900 3700 7900 5450
Wire Wire Line
	8800 3700 8800 5550
Wire Wire Line
	4000 4750 4900 4750
Connection ~ 8500 4750
Wire Wire Line
	8500 4750 9400 4750
Connection ~ 7600 4750
Wire Wire Line
	7600 4750 8500 4750
Connection ~ 6700 4750
Wire Wire Line
	6700 4750 7600 4750
Connection ~ 5800 4750
Wire Wire Line
	5800 4750 6700 4750
Connection ~ 4900 4750
Wire Wire Line
	4900 4750 5800 4750
Connection ~ 4500 750 
Wire Wire Line
	4500 750  5400 750 
Connection ~ 5400 750 
Wire Wire Line
	5400 750  6300 750 
Connection ~ 6300 750 
Wire Wire Line
	6300 750  7200 750 
Connection ~ 7200 750 
Wire Wire Line
	7200 750  8100 750 
Connection ~ 8100 750 
Connection ~ 7400 1100
Wire Wire Line
	7400 1100 8300 1100
Connection ~ 8300 1100
Connection ~ 6500 1100
Wire Wire Line
	6500 1100 7400 1100
Connection ~ 5600 1100
Wire Wire Line
	5600 1100 6500 1100
Connection ~ 4700 1100
Wire Wire Line
	4700 1100 5600 1100
Wire Wire Line
	8300 1100 9200 1100
Wire Wire Line
	8100 750  9000 750 
Wire Wire Line
	4600 1650 10150 1650
Wire Wire Line
	4600 1650 4600 2650
Wire Wire Line
	5500 1750 10150 1750
Wire Wire Line
	5500 1750 5500 2650
Wire Wire Line
	6400 1850 10150 1850
Wire Wire Line
	6400 1850 6400 2650
Wire Wire Line
	7300 1950 10150 1950
Wire Wire Line
	7300 1950 7300 2650
Wire Wire Line
	8200 2050 10150 2050
Wire Wire Line
	8200 2050 8200 2650
Wire Wire Line
	9100 2150 10150 2150
Wire Wire Line
	9100 2150 9100 2650
Text Label 9400 4750 0    50   ~ 0
SPST_GND
$EndSCHEMATC
