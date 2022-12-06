EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 9
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
L Isolator:SFH617A-1 U6
U 1 1 62EBA913
P 6100 3400
AR Path="/62FB7846/62EBA913" Ref="U6"  Part="1" 
AR Path="/63089671/62EBA913" Ref="U20"  Part="1" 
AR Path="/63103CAF/62EBA913" Ref="U8"  Part="1" 
AR Path="/62F64647/62EBA913" Ref="U10"  Part="1" 
AR Path="/62FD589D/62EBA913" Ref="U12"  Part="1" 
AR Path="/63041ECA/62EBA913" Ref="U14"  Part="1" 
AR Path="/62F45EE0/62EBA913" Ref="U16"  Part="1" 
AR Path="/62FB890E/62EBA913" Ref="U18"  Part="1" 
F 0 "U6" H 6100 3200 50  0000 C CNN
F 1 "SFH617A-1" H 6100 3600 50  0000 C CNN
F 2 "Package_DIP:SMDIP-4_W7.62mm" H 5900 3200 50  0001 L CIN
F 3 "http://www.vishay.com/docs/83740/sfh617a.pdf" H 6100 3400 50  0001 L CNN
	1    6100 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 3500 5700 3500
$Comp
L Device:R R4
U 1 1 62ED7963
P 5300 3500
AR Path="/62FB7846/62ED7963" Ref="R4"  Part="1" 
AR Path="/63089671/62ED7963" Ref="R25"  Part="1" 
AR Path="/63103CAF/62ED7963" Ref="R7"  Part="1" 
AR Path="/62F64647/62ED7963" Ref="R10"  Part="1" 
AR Path="/62FD589D/62ED7963" Ref="R13"  Part="1" 
AR Path="/63041ECA/62ED7963" Ref="R16"  Part="1" 
AR Path="/62F45EE0/62ED7963" Ref="R19"  Part="1" 
AR Path="/62FB890E/62ED7963" Ref="R22"  Part="1" 
F 0 "R4" H 5350 3500 50  0000 L CNN
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
L Device:R R5
U 1 1 62F493CD
P 5700 4050
AR Path="/62FB7846/62F493CD" Ref="R5"  Part="1" 
AR Path="/63089671/62F493CD" Ref="R26"  Part="1" 
AR Path="/63103CAF/62F493CD" Ref="R8"  Part="1" 
AR Path="/62F64647/62F493CD" Ref="R11"  Part="1" 
AR Path="/62FD589D/62F493CD" Ref="R14"  Part="1" 
AR Path="/63041ECA/62F493CD" Ref="R17"  Part="1" 
AR Path="/62F45EE0/62F493CD" Ref="R20"  Part="1" 
AR Path="/62FB890E/62F493CD" Ref="R23"  Part="1" 
F 0 "R5" H 5750 4050 50  0000 L CNN
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
L Transistor_BJT:BC337 Q2
U 1 1 62EA87F7
P 5600 3700
AR Path="/62FB7846/62EA87F7" Ref="Q2"  Part="1" 
AR Path="/63089671/62EA87F7" Ref="Q16"  Part="1" 
AR Path="/63103CAF/62EA87F7" Ref="Q4"  Part="1" 
AR Path="/62F64647/62EA87F7" Ref="Q6"  Part="1" 
AR Path="/62FD589D/62EA87F7" Ref="Q8"  Part="1" 
AR Path="/63041ECA/62EA87F7" Ref="Q10"  Part="1" 
AR Path="/62F45EE0/62EA87F7" Ref="Q12"  Part="1" 
AR Path="/62FB890E/62EA87F7" Ref="Q14"  Part="1" 
F 0 "Q2" H 5791 3746 50  0000 L CNN
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
L Simulation_SPICE:DIODE D10
U 1 1 62FE9B9E
P 4950 3300
AR Path="/62FB7846/62FE9B9E" Ref="D10"  Part="1" 
AR Path="/63089671/62FE9B9E" Ref="D17"  Part="1" 
AR Path="/63103CAF/62FE9B9E" Ref="D11"  Part="1" 
AR Path="/62F64647/62FE9B9E" Ref="D12"  Part="1" 
AR Path="/62FD589D/62FE9B9E" Ref="D13"  Part="1" 
AR Path="/63041ECA/62FE9B9E" Ref="D14"  Part="1" 
AR Path="/62F45EE0/62FE9B9E" Ref="D15"  Part="1" 
AR Path="/62FB890E/62FE9B9E" Ref="D16"  Part="1" 
F 0 "D10" H 4750 3250 50  0000 L CNN
F 1 "IN4007" H 5000 3250 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 4950 3300 50  0001 C CNN
F 3 "~" H 4950 3300 50  0001 C CNN
F 4 "Y" H 4950 3300 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "D" H 4950 3300 50  0001 L CNN "Spice_Primitive"
	1    4950 3300
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC547 Q1
U 1 1 62FB7374
P 5400 3900
AR Path="/62FB7846/62FB7374" Ref="Q1"  Part="1" 
AR Path="/63089671/62FB7374" Ref="Q15"  Part="1" 
AR Path="/63103CAF/62FB7374" Ref="Q3"  Part="1" 
AR Path="/62F64647/62FB7374" Ref="Q5"  Part="1" 
AR Path="/62FD589D/62FB7374" Ref="Q7"  Part="1" 
AR Path="/63041ECA/62FB7374" Ref="Q9"  Part="1" 
AR Path="/62F45EE0/62FB7374" Ref="Q11"  Part="1" 
AR Path="/62FB890E/62FB7374" Ref="Q13"  Part="1" 
F 0 "Q1" H 5591 3946 50  0000 L CNN
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
L Device:R R6
U 1 1 6344909D
P 6500 3050
AR Path="/62FB7846/6344909D" Ref="R6"  Part="1" 
AR Path="/63089671/6344909D" Ref="R27"  Part="1" 
AR Path="/63103CAF/6344909D" Ref="R9"  Part="1" 
AR Path="/62F64647/6344909D" Ref="R12"  Part="1" 
AR Path="/62FD589D/6344909D" Ref="R15"  Part="1" 
AR Path="/63041ECA/6344909D" Ref="R18"  Part="1" 
AR Path="/62F45EE0/6344909D" Ref="R21"  Part="1" 
AR Path="/62FB890E/6344909D" Ref="R24"  Part="1" 
F 0 "R6" H 6550 3050 50  0000 L CNN
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
