EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title "PDJRSIM NMEA 2000 Switch Input Module"
Date "2022-06-11"
Rev "2.0.0"
Comp "PDJR <preeve@pdjr.eu>"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Isolator:SFH617A-1 U?
U 1 1 62EBA913
P 6100 3400
AR Path="/62FB7846/62EBA913" Ref="U?"  Part="1" 
AR Path="/63089671/62EBA913" Ref="U?"  Part="1" 
AR Path="/63103CAF/62EBA913" Ref="U?"  Part="1" 
AR Path="/62F64647/62EBA913" Ref="U?"  Part="1" 
AR Path="/62FD589D/62EBA913" Ref="U?"  Part="1" 
AR Path="/63041ECA/62EBA913" Ref="U?"  Part="1" 
AR Path="/62F45EE0/62EBA913" Ref="U?"  Part="1" 
AR Path="/62FB890E/62EBA913" Ref="U?"  Part="1" 
AR Path="/63A4C39E/62EBA913" Ref="U201"  Part="1" 
AR Path="/63A0C125/62EBA913" Ref="U401"  Part="1" 
AR Path="/63A0DEDA/62EBA913" Ref="U301"  Part="1" 
AR Path="/63A1004D/62EBA913" Ref="U501"  Part="1" 
AR Path="/63A11746/62EBA913" Ref="U601"  Part="1" 
AR Path="/63A12F68/62EBA913" Ref="U701"  Part="1" 
AR Path="/63A14AD1/62EBA913" Ref="U801"  Part="1" 
AR Path="/63A169E8/62EBA913" Ref="U901"  Part="1" 
F 0 "U201" H 6100 3200 50  0000 C CNN
F 1 "SFH617A-1" H 6100 3600 50  0000 C CNN
F 2 "Package_DIP:SMDIP-4_W7.62mm" H 5900 3200 50  0001 L CIN
F 3 "http://www.vishay.com/docs/83740/sfh617a.pdf" H 6100 3400 50  0001 L CNN
	1    6100 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 3500 5700 3500
$Comp
L Device:R R?
U 1 1 62ED7963
P 5300 3500
AR Path="/62FB7846/62ED7963" Ref="R?"  Part="1" 
AR Path="/63089671/62ED7963" Ref="R?"  Part="1" 
AR Path="/63103CAF/62ED7963" Ref="R?"  Part="1" 
AR Path="/62F64647/62ED7963" Ref="R?"  Part="1" 
AR Path="/62FD589D/62ED7963" Ref="R?"  Part="1" 
AR Path="/63041ECA/62ED7963" Ref="R?"  Part="1" 
AR Path="/62F45EE0/62ED7963" Ref="R?"  Part="1" 
AR Path="/62FB890E/62ED7963" Ref="R?"  Part="1" 
AR Path="/63A4C39E/62ED7963" Ref="R201"  Part="1" 
AR Path="/63A0C125/62ED7963" Ref="R401"  Part="1" 
AR Path="/63A0DEDA/62ED7963" Ref="R301"  Part="1" 
AR Path="/63A1004D/62ED7963" Ref="R501"  Part="1" 
AR Path="/63A11746/62ED7963" Ref="R601"  Part="1" 
AR Path="/63A12F68/62ED7963" Ref="R701"  Part="1" 
AR Path="/63A14AD1/62ED7963" Ref="R801"  Part="1" 
AR Path="/63A169E8/62ED7963" Ref="R901"  Part="1" 
F 0 "R201" H 5350 3500 50  0000 L CNN
F 1 "10K 0.5W" V 5300 3500 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5230 3500 50  0001 C CNN
F 3 "~" H 5300 3500 50  0001 C CNN
F 4 "0.125W" V 5400 3500 50  0001 C CNN "Power"
	1    5300 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 3350 5300 3300
Wire Wire Line
	5300 3300 5800 3300
Wire Wire Line
	5300 3650 5300 3700
Wire Wire Line
	5300 3700 5400 3700
Wire Wire Line
	5300 3300 5100 3300
Connection ~ 5300 3300
$Comp
L Device:R R?
U 1 1 62F493CD
P 5700 4050
AR Path="/62FB7846/62F493CD" Ref="R?"  Part="1" 
AR Path="/63089671/62F493CD" Ref="R?"  Part="1" 
AR Path="/63103CAF/62F493CD" Ref="R?"  Part="1" 
AR Path="/62F64647/62F493CD" Ref="R?"  Part="1" 
AR Path="/62FD589D/62F493CD" Ref="R?"  Part="1" 
AR Path="/63041ECA/62F493CD" Ref="R?"  Part="1" 
AR Path="/62F45EE0/62F493CD" Ref="R?"  Part="1" 
AR Path="/62FB890E/62F493CD" Ref="R?"  Part="1" 
AR Path="/63A4C39E/62F493CD" Ref="R202"  Part="1" 
AR Path="/63A0C125/62F493CD" Ref="R402"  Part="1" 
AR Path="/63A0DEDA/62F493CD" Ref="R302"  Part="1" 
AR Path="/63A1004D/62F493CD" Ref="R502"  Part="1" 
AR Path="/63A11746/62F493CD" Ref="R602"  Part="1" 
AR Path="/63A12F68/62F493CD" Ref="R702"  Part="1" 
AR Path="/63A14AD1/62F493CD" Ref="R802"  Part="1" 
AR Path="/63A169E8/62F493CD" Ref="R902"  Part="1" 
F 0 "R202" H 5750 4050 50  0000 L CNN
F 1 "100R 0.25W" V 5700 4050 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5630 4050 50  0001 C CNN
F 3 "~" H 5700 4050 50  0001 C CNN
F 4 "0.125W" V 5800 4050 50  0001 C CNN "Power"
	1    5700 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 4100 5300 4200
$Comp
L Transistor_BJT:BC337 Q?
U 1 1 62EA87F7
P 5600 3700
AR Path="/62FB7846/62EA87F7" Ref="Q?"  Part="1" 
AR Path="/63089671/62EA87F7" Ref="Q?"  Part="1" 
AR Path="/63103CAF/62EA87F7" Ref="Q?"  Part="1" 
AR Path="/62F64647/62EA87F7" Ref="Q?"  Part="1" 
AR Path="/62FD589D/62EA87F7" Ref="Q?"  Part="1" 
AR Path="/63041ECA/62EA87F7" Ref="Q?"  Part="1" 
AR Path="/62F45EE0/62EA87F7" Ref="Q?"  Part="1" 
AR Path="/62FB890E/62EA87F7" Ref="Q?"  Part="1" 
AR Path="/63A4C39E/62EA87F7" Ref="Q202"  Part="1" 
AR Path="/63A0C125/62EA87F7" Ref="Q402"  Part="1" 
AR Path="/63A0DEDA/62EA87F7" Ref="Q302"  Part="1" 
AR Path="/63A1004D/62EA87F7" Ref="Q502"  Part="1" 
AR Path="/63A11746/62EA87F7" Ref="Q602"  Part="1" 
AR Path="/63A12F68/62EA87F7" Ref="Q702"  Part="1" 
AR Path="/63A14AD1/62EA87F7" Ref="Q802"  Part="1" 
AR Path="/63A169E8/62EA87F7" Ref="Q902"  Part="1" 
F 0 "Q202" H 5791 3746 50  0000 L CNN
F 1 "BC337-40" H 5791 3655 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TSOT-23" H 5800 3625 50  0001 L CIN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bc337.pdf" H 5600 3700 50  0001 L CNN
	1    5600 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 3900 5700 3900
Connection ~ 5700 3900
Wire Wire Line
	5700 4200 5300 4200
Connection ~ 5300 4200
$Comp
L Simulation_SPICE:DIODE D?
U 1 1 62FE9B9E
P 4950 3300
AR Path="/62FB7846/62FE9B9E" Ref="D?"  Part="1" 
AR Path="/63089671/62FE9B9E" Ref="D?"  Part="1" 
AR Path="/63103CAF/62FE9B9E" Ref="D?"  Part="1" 
AR Path="/62F64647/62FE9B9E" Ref="D?"  Part="1" 
AR Path="/62FD589D/62FE9B9E" Ref="D?"  Part="1" 
AR Path="/63041ECA/62FE9B9E" Ref="D?"  Part="1" 
AR Path="/62F45EE0/62FE9B9E" Ref="D?"  Part="1" 
AR Path="/62FB890E/62FE9B9E" Ref="D?"  Part="1" 
AR Path="/63A4C39E/62FE9B9E" Ref="D201"  Part="1" 
AR Path="/63A0C125/62FE9B9E" Ref="D401"  Part="1" 
AR Path="/63A0DEDA/62FE9B9E" Ref="D301"  Part="1" 
AR Path="/63A1004D/62FE9B9E" Ref="D501"  Part="1" 
AR Path="/63A11746/62FE9B9E" Ref="D601"  Part="1" 
AR Path="/63A12F68/62FE9B9E" Ref="D701"  Part="1" 
AR Path="/63A14AD1/62FE9B9E" Ref="D801"  Part="1" 
AR Path="/63A169E8/62FE9B9E" Ref="D901"  Part="1" 
F 0 "D201" H 4750 3250 50  0000 L CNN
F 1 "IN4007" H 5000 3250 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 4950 3300 50  0001 C CNN
F 3 "~" H 4950 3300 50  0001 C CNN
F 4 "Y" H 4950 3300 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "D" H 4950 3300 50  0001 L CNN "Spice_Primitive"
	1    4950 3300
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC547 Q?
U 1 1 62FB7374
P 5400 3900
AR Path="/62FB7846/62FB7374" Ref="Q?"  Part="1" 
AR Path="/63089671/62FB7374" Ref="Q?"  Part="1" 
AR Path="/63103CAF/62FB7374" Ref="Q?"  Part="1" 
AR Path="/62F64647/62FB7374" Ref="Q?"  Part="1" 
AR Path="/62FD589D/62FB7374" Ref="Q?"  Part="1" 
AR Path="/63041ECA/62FB7374" Ref="Q?"  Part="1" 
AR Path="/62F45EE0/62FB7374" Ref="Q?"  Part="1" 
AR Path="/62FB890E/62FB7374" Ref="Q?"  Part="1" 
AR Path="/63A4C39E/62FB7374" Ref="Q201"  Part="1" 
AR Path="/63A0C125/62FB7374" Ref="Q401"  Part="1" 
AR Path="/63A0DEDA/62FB7374" Ref="Q301"  Part="1" 
AR Path="/63A1004D/62FB7374" Ref="Q501"  Part="1" 
AR Path="/63A11746/62FB7374" Ref="Q601"  Part="1" 
AR Path="/63A12F68/62FB7374" Ref="Q701"  Part="1" 
AR Path="/63A14AD1/62FB7374" Ref="Q801"  Part="1" 
AR Path="/63A169E8/62FB7374" Ref="Q901"  Part="1" 
F 0 "Q201" H 5591 3946 50  0000 L CNN
F 1 "BC547" H 5591 3855 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TSOT-23" H 5600 3825 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 5400 3900 50  0001 L CNN
	1    5400 3900
	-1   0    0    -1  
$EndComp
Connection ~ 5300 3700
Text HLabel 4700 3300 0    50   Input ~ 0
OII_IN
Text HLabel 4750 4200 0    50   UnSpc ~ 0
OII_IN_GND
Text HLabel 7600 3300 2    50   Output ~ 0
OII_OUT
Text HLabel 7650 4200 2    50   UnSpc ~ 0
OII_OUT_GND
Text HLabel 7600 2800 2    50   Input ~ 0
OII_OUT_VCC
Wire Wire Line
	6400 3500 6500 3500
Wire Wire Line
	6400 3300 6500 3300
$Comp
L Device:R R?
U 1 1 6344909D
P 6500 3050
AR Path="/62FB7846/6344909D" Ref="R?"  Part="1" 
AR Path="/63089671/6344909D" Ref="R?"  Part="1" 
AR Path="/63103CAF/6344909D" Ref="R?"  Part="1" 
AR Path="/62F64647/6344909D" Ref="R?"  Part="1" 
AR Path="/62FD589D/6344909D" Ref="R?"  Part="1" 
AR Path="/63041ECA/6344909D" Ref="R?"  Part="1" 
AR Path="/62F45EE0/6344909D" Ref="R?"  Part="1" 
AR Path="/62FB890E/6344909D" Ref="R?"  Part="1" 
AR Path="/63A4C39E/6344909D" Ref="R203"  Part="1" 
AR Path="/63A0C125/6344909D" Ref="R403"  Part="1" 
AR Path="/63A0DEDA/6344909D" Ref="R303"  Part="1" 
AR Path="/63A1004D/6344909D" Ref="R503"  Part="1" 
AR Path="/63A11746/6344909D" Ref="R603"  Part="1" 
AR Path="/63A12F68/6344909D" Ref="R703"  Part="1" 
AR Path="/63A14AD1/6344909D" Ref="R803"  Part="1" 
AR Path="/63A169E8/6344909D" Ref="R903"  Part="1" 
F 0 "R203" H 6550 3050 50  0000 L CNN
F 1 "4K7 0.125W" V 6500 3050 20  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6430 3050 50  0001 C CNN
F 3 "~" H 6500 3050 50  0001 C CNN
F 4 "0.125W" V 6600 3050 50  0001 C CNN "Power"
	1    6500 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 4200 6500 3500
Wire Wire Line
	4750 4200 5300 4200
Wire Wire Line
	4800 3300 4700 3300
Wire Wire Line
	6500 2800 7600 2800
Wire Wire Line
	6500 4200 7650 4200
Wire Wire Line
	6500 2900 6500 2800
Wire Wire Line
	6500 3300 6500 3200
Wire Wire Line
	6500 3300 7600 3300
Connection ~ 6500 3300
$EndSCHEMATC
