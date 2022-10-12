/**********************************************************************
 * SIM108.cpp - firmware for the SIM108 switch input module.
 * Copyright (c) 2021-22 Paul Reeve <preeve@pdjr.eu>
 *
 * Target platform: Teensy 3.2
 * 
 * SIM108 is an 8-channel NMEA switch input module built around a
 * Teensy 3.2 microcontroller.
 * 
 * This firmware recovers the state of sensor channel inputs, assembles
 * a switchbank Binary Status Report and transmits this over NMEA using 
 * PGN127501. Local feedback on detected switch channel states is
 * presented by modulating some indicator LEDs. 
 */

#include <Arduino.h>
#include <EEPROM.h>
#include <NMEA2000_CAN.h>
#include <N2kTypes.h>
#include <N2kMessages.h>
#include <DilSwitch.h>
#include <B74HC595.h>
#include <arraymacros.h>

/**********************************************************************
 * SERIAL DEBUG
 * 
 * The firmware can be built so that it writes copious trace and debug
 * data to the MCU's serial output by defining DEBUG_SERIAL. When the
 * Teensy reboots it switches its USB port to serial emulation and it
 * can take a few seconds for a connected host computer to recognise
 * the switch: - DEBUG_SERIAL_START_DELAY introduces a delay that can
 * be used to prevent loss of early debug output.
 */
#define DEBUG_SERIAL
#define DEBUG_SERIAL_START_DELAY 4000

/**********************************************************************
 * MCU EEPROM (PERSISTENT) STORAGE 
 * 
 * Module configuration is persisted to Teensy EEPROM storage.
 * 
 * SOURCE_ADDRESS_EEPROM_ADDRESS is the storage address for the
 * module's 1-byte N2K/CAN source address.
 */
#define SOURCE_ADDRESS_EEPROM_ADDRESS 0

/**********************************************************************
 * MCU PIN DEFINITIONS
 * 
 * GPIO pin definitions for the Teensy 3.2 MCU and some collections
 * that can be used as array initialisers
 */
#define GPIO_MPX_CLOCK 0
#define GPIO_MPX_LATCH 1
#define GPIO_MPX_DATA 2
#define GPIO_CAN_TX 3
#define GPIO_CAN_RX 4
#define GPIO_INSTANCE_BIT7 5
#define GPIO_INSTANCE_BIT6 6
#define GPIO_INSTANCE_BIT5 7
#define GPIO_INSTANCE_BIT4 8
#define GPIO_INSTANCE_BIT3 9
#define GPIO_INSTANCE_BIT2 10
#define GPIO_INSTANCE_BIT1 11
#define GPIO_INSTANCE_BIT0 12
#define GPIO_POWER_LED 13
#define GPIO_PRG 14
#define GPIO_SENSOR8 16
#define GPIO_SENSOR7 17
#define GPIO_SENSOR6 18
#define GPIO_SENSOR5 19
#define GPIO_SENSOR4 20
#define GPIO_SENSOR3 21
#define GPIO_SENSOR2 22
#define GPIO_SENSOR1 23
#define GPIO_SENSOR_PINS { GPIO_SENSOR1, GPIO_SENSOR2, GPIO_SENSOR3, GPIO_SENSOR4, GPIO_SENSOR5, GPIO_SENSOR6, GPIO_SENSOR7, GPIO_SENSOR8 } 
#define GPIO_INSTANCE_PINS { GPIO_INSTANCE_BIT0, GPIO_INSTANCE_BIT1, GPIO_INSTANCE_BIT2, GPIO_INSTANCE_BIT3, GPIO_INSTANCE_BIT4, GPIO_INSTANCE_BIT5, GPIO_INSTANCE_BIT6, GPIO_INSTANCE_BIT7 }
#define GPIO_INPUT_PINS { GPIO_INSTANCE_BIT0, GPIO_INSTANCE_BIT1, GPIO_INSTANCE_BIT2, GPIO_INSTANCE_BIT3, GPIO_INSTANCE_BIT4, GPIO_INSTANCE_BIT5, GPIO_INSTANCE_BIT6, GPIO_INSTANCE_BIT7, GPIO_SENSOR1, GPIO_SENSOR2, GPIO_SENSOR3, GPIO_SENSOR4, GPIO_SENSOR5, GPIO_SENSOR6, GPIO_SENSOR7, GPIO_SENSOR8 }
#define GPIO_OUTPUT_PINS { GPIO_MPX_CLOCK, GPIO_MPX_DATA, GPIO_MPX_LATCH, GPIO_POWER_LED }

/**********************************************************************
 * DEVICE INFORMATION
 * 
 * Because of NMEA's closed standard, most of this is fiction. Maybe it
 * can be made better with more research. In particular, even recent
 * releases of the NMEA function and class lists found using Google
 * don't discuss anchor systems, so the proper values for CLASS and
 * FUNCTION in this application are not known.  At the moment they are
 * set to 25 (network device) and 130 (PC gateway).
 * 
 * INDUSTRY_GROUP we can be confident about (4 says maritime). However,
 * MANUFACTURER_CODE is only allocated to subscribed NMEA members and,
 * unsurprisingly, an anonymous code has not been assigned: 2046 is
 * currently unused, so we adopt that.  
 * 
 * MANUFACTURER_CODE and UNIQUE_NUMBER together must make a unique
 * value on any N2K bus and an easy way to achieve this is just to
 * bump the unique number for every software build and this is done
 * automatically by the build system.
 */
#define DEVICE_CLASS 75
#define DEVICE_FUNCTION 130
#define DEVICE_INDUSTRY_GROUP 4
#define DEVICE_MANUFACTURER_CODE 2046
#define DEVICE_UNIQUE_NUMBER 849

/**********************************************************************
 * PRODUCT INFORMATION
 * 
 * This poorly structured set of values is what NMEA expects a product
 * description to be shoe-horned into.
 */
#define PRODUCT_CERTIFICATION_LEVEL 1
#define PRODUCT_CODE 002
#define PRODUCT_FIRMWARE_VERSION "1.1.0 (Jun 2022)"
#define PRODUCT_LEN 1
#define PRODUCT_N2K_VERSION 2101
#define PRODUCT_SERIAL_CODE "002-849" // PRODUCT_CODE + DEVICE_UNIQUE_NUMBER
#define PRODUCT_TYPE "SIM108"
#define PRODUCT_VERSION "1.0 (Mar 2022)"

/**********************************************************************
 * Include the build.h header file which can be used to override any or
 * all of the above  constant definitions.
 */
#include "build.h"

#define DEFAULT_SOURCE_ADDRESS 22         // Seed value for source address claim
#define INSTANCE_UNDEFINED 255            // Flag value
#define PGN127501_TRANSMIT_INTERVAL 4000UL
#define SWITCH_PROCESS_INTERVAL 100       // Process switch inputs every n ms
#define LED_UPDATE_INTERVAL 50         // Number of ms on / off

/**********************************************************************
 * Declarations of local functions.
 */
void messageHandler(const tN2kMsg&);
void transmitPGN127501();
void transmitSwitchbankStatusMaybe(bool force = false);
unsigned char getLedStatus();
void updateLeds(unsigned char status);
void isr();
void processSwitchInputsMaybe();

/**********************************************************************
 * PGNs of messages transmitted by this program.
 * 
 * PGN 127501 Binary Status Report.
 */
const unsigned long TransmitMessages[] PROGMEM={ 127501L, 0 };

/**********************************************************************
 * PGNs of messages handled by this program.
 * 
 * There are none.
 */
typedef struct { unsigned long PGN; void (*Handler)(const tN2kMsg &N2kMsg); } tNMEA2000Handler;
tNMEA2000Handler NMEA2000Handlers[]={ {0L, 0} };

/**********************************************************************
 * DIL_SWITCH switch decoder.
 */
int INSTANCE_PINS[] = GPIO_INSTANCE_PINS;
DilSwitch DIL_SWITCH (INSTANCE_PINS, ELEMENTCOUNT(INSTANCE_PINS));

int SENSOR_PINS[] = GPIO_SENSOR_PINS;

/**********************************************************************
 * LED_DISPLAY shift register.
*/
B74HC595 LED_DISPLAY (GPIO_MPX_DATA, GPIO_MPX_CLOCK, GPIO_MPX_LATCH);

bool OPERATE_TRANSMIT_LED = false;

/**********************************************************************
 * SWITCHBANK_INSTANCE - working storage for the switchbank module
 * instance number. The user selected value is recovered from hardware
 * and assigned during module initialisation,
 */
unsigned char SWITCHBANK_INSTANCE = INSTANCE_UNDEFINED;

/**********************************************************************
 * SWITCHBANK_STATUS - working storage for holding the most recently
 * read state of the Teensy switch inputs.
 */
tN2kBinaryStatus SWITCHBANK_STATUS = 0x00;

/**********************************************************************
 * MAIN PROGRAM - setup()
 */
void setup() {
  #ifdef DEBUG_SERIAL
  Serial.begin(9600);
  delay(DEBUG_SERIAL_START_DELAY);
  #endif

  // Set the mode of all digital GPIO pins.
  int ipins[] = GPIO_INPUT_PINS;
  int opins[] = GPIO_OUTPUT_PINS;
  for (unsigned int i = 0 ; i < ELEMENTCOUNT(ipins); i++) pinMode(ipins[i], INPUT_PULLUP);
  for (unsigned int i = 0 ; i < ELEMENTCOUNT(opins); i++) pinMode(opins[i], OUTPUT);
  
  // We assume that a new host system has its EEPROM initialised to all
  // 0xFF. We test by reading a byte that in a configured system should
  // never be this value and if it indicates a scratch system then we
  // set EEPROM memory up in the following way.
  //
  // Address | Value                                    | Size in bytes
  // --------+------------------------------------------+--------------
  // 0x00    | N2K source address                       | 1
  //
  //EEPROM.write(SOURCE_ADDRESS_EEPROM_ADDRESS, 0xff);
  if (EEPROM.read(SOURCE_ADDRESS_EEPROM_ADDRESS) == 0xff) {
    EEPROM.write(SOURCE_ADDRESS_EEPROM_ADDRESS, DEFAULT_SOURCE_ADDRESS);
  }

  // Recover module instance number.
  DIL_SWITCH.sample();
  SWITCHBANK_INSTANCE = DIL_SWITCH.value();

  // Run a startup sequence in the LED display: all LEDs on to confirm
  // function, then a display of the module instance number.
  LED_DISPLAY.update(0xff); delay(100);
  LED_DISPLAY.update(SWITCHBANK_INSTANCE); delay(1000);
  LED_DISPLAY.enableLoopUpdates(getLedStatus, LED_UPDATE_INTERVAL);

  // Clear the switchbank status buffer
  N2kResetBinaryStatus(SWITCHBANK_STATUS);

  // Initialise and start N2K services.
  NMEA2000.SetProductInformation(PRODUCT_SERIAL_CODE, PRODUCT_CODE, PRODUCT_TYPE, PRODUCT_FIRMWARE_VERSION, PRODUCT_VERSION);
  NMEA2000.SetDeviceInformation(DEVICE_UNIQUE_NUMBER, DEVICE_FUNCTION, DEVICE_CLASS, DEVICE_MANUFACTURER_CODE);
  NMEA2000.SetMode(tNMEA2000::N2km_ListenAndNode, EEPROM.read(SOURCE_ADDRESS_EEPROM_ADDRESS)); // Configure for sending and receiving.
  NMEA2000.EnableForward(false); // Disable all msg forwarding to USB (=Serial)
  NMEA2000.ExtendTransmitMessages(TransmitMessages); // Tell library which PGNs we transmit
  NMEA2000.SetMsgHandler(messageHandler);
  NMEA2000.Open();

  attachInterrupt(digitalPinToInterrupt(GPIO_PRG), isr, RISING);
}

/**********************************************************************
 * MAIN PROGRAM - loop()
 * 
 * With the exception of NMEA2000.parseMessages() all of the functions
 * called from loop() implement interval timers which ensure that they
 * will mostly return immediately, only performing their substantive
 * tasks at intervals defined by program constants.
 */ 
void loop() {
  #ifdef DEBUG_SERIAL
  Serial.println();
  Serial.println("Starting:");
  Serial.print("  N2K Source address is "); Serial.println(NMEA2000.GetN2kSource());
  Serial.print("  Module instance number is "); Serial.println(SWITCHBANK_INSTANCE);
  #endif
  
  // Before we transmit anything, let's do the NMEA housekeeping and
  // process any received messages. This call may result in acquisition
  // of a new CAN source address, so we check if there has been any
  // change and if so save the new address to EEPROM for future re-use.
  NMEA2000.ParseMessages();
  if (NMEA2000.ReadResetAddressChanged()) EEPROM.update(SOURCE_ADDRESS_EEPROM_ADDRESS, NMEA2000.GetN2kSource());

  // Process any switch state changes and transmit switchbank status
  // updates as required. 
  processSwitchInputsMaybe();
  transmitSwitchbankStatusMaybe();
  
  // Update the states of connected LEDs
  LED_DISPLAY.loop();
}

/**********************************************************************
 * MAIN PROGRAM - isr()
 * 
 * Invoked by a press of the PRG button. Updates SWITCHBANK_INSTANCE
 * from the DIL switch setting.
 */
void isr() {
  DIL_SWITCH.sample();
  SWITCHBANK_INSTANCE = DIL_SWITCH.value();
}

/**********************************************************************
 * processSwitchInputsMaybe() should be called directly from loop().
 * The function checks switch states every SWITCH_PROCESS_INTERVAL and
 * updates SWITCHBANK_STATUS with any changes. If a change is made,
 * then a call is made to transmit the update over NMEA.
 */
void processSwitchInputsMaybe() {
  static unsigned long deadline = 0UL;
  unsigned long now = millis();
  bool updated = false;

  if (now > deadline) {
    for (unsigned int i = 0; i < ELEMENTCOUNT(SENSOR_PINS); i++) {
      tN2kOnOff switchStatus = ((digitalRead(SENSOR_PINS[i]))?N2kOnOff_On:N2kOnOff_Off);
      if (switchStatus != N2kGetStatusOnBinaryStatus(SWITCHBANK_STATUS, (i + 1))) {
        N2kSetStatusBinaryOnStatus(SWITCHBANK_STATUS, switchStatus, (i + 1));
        updated = true;
      }
    }
    if (updated) transmitSwitchbankStatusMaybe(true);
    deadline = (now + SWITCH_PROCESS_INTERVAL);
  }
}
  
/**********************************************************************
 * transmitSwitchbankStatusMaybe() should be called directly from
 * loop(). The function proceeds to transmit a switchbank binary status
 * message if PGN127501_TRANSMIT_INTERVAL has elapsed or <force> is true.
 */
void transmitSwitchbankStatusMaybe(bool force) {
  static unsigned long deadline = 0UL;
  unsigned long now = millis();

  if ((now > deadline) || force) {
    transmitPGN127501();
    digitalWrite(GPIO_POWER_LED, 1);
    LED_DISPLAY.preempt();
    deadline = (now + PGN127501_TRANSMIT_INTERVAL);
  }
}

/**********************************************************************
 * Assemble and transmit a PGN 127501 Binary Status Update message
 * reflecting the current switchbank state.
 */
void transmitPGN127501() {
  static tN2kMsg N2kMsg;

  if (SWITCHBANK_INSTANCE < 253) {
    SetN2kPGN127501(N2kMsg, SWITCHBANK_INSTANCE, SWITCHBANK_STATUS);
    NMEA2000.SendMsg(N2kMsg);
  }
}  

unsigned char getLedStatus() {
  unsigned char retval = 0;
  for (int i = 0; i < 8; i++) {
    retval = (retval | (((N2kGetStatusOnBinaryStatus(SWITCHBANK_STATUS, (i + 1)) == N2kOnOff_On)?1:0) << i));
  }
  return(retval);
}

/**********************************************************************
 * Helper function called by the NMEA2000 library function
 * parseMessages() (which itself must be called from loop()) in order
 * to pass incoming messages to any user-defined handler. The mapping
 * between message PGN and handler function should be defined in the
 * global vector NMEA2000Handlers.
 */
void messageHandler(const tN2kMsg &N2kMsg) {
  int iHandler;
  for (iHandler=0; NMEA2000Handlers[iHandler].PGN!=0 && !(N2kMsg.PGN==NMEA2000Handlers[iHandler].PGN); iHandler++);
  if (NMEA2000Handlers[iHandler].PGN != 0) {
    NMEA2000Handlers[iHandler].Handler(N2kMsg); 
  }
}