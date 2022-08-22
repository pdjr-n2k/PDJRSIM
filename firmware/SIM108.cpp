/**********************************************************************
 * SIM108.cpp - 8-channel NMEA switch input module firmware.
 * Copyright (c) 2021-22 Paul Reeve <preeve@pdjr.eu>
 *
 * Target platform: Teensy 3.2
 * 
 * This firmware implements an 8-channel switch input interface
 * that reports SPST sensor state over NMEA 2000 using PGN 127501
 * Binary Status Report. 
 */

#include <Arduino.h>
#include <ArduinoQueue.h>
#include <EEPROM.h>
#include <NMEA2000_CAN.h>
#include <N2kTypes.h>
#include <N2kMessages.h>
#include <Debouncer.h>
#include <LedManager.h>
#include <DilSwitch.h>
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
 * 
 * SENSORS_EEPROM_ADDRESS is the start address of storage used to hold
 * SENSOR congigurations. The length of this area will vary if the
 * Sensor ADT is redefined, so it is simplest to make sure the start
 * address remains as the last item in storage.
 */
#define SOURCE_ADDRESS_EEPROM_ADDRESS 0

/**********************************************************************
 * MCU PIN DEFINITIONS
 * 
 * GPIO pin definitions for the Teensy 3.2 MCU and some collections
 * that can be used as array initialisers
 */
#define GPIO_MPX_LATCH 1
#define GPIO_ENCODER_BIT7 5
#define GPIO_ENCODER_BIT6 6
#define GPIO_ENCODER_BIT5 7
#define GPIO_ENCODER_BIT4 8
#define GPIO_ENCODER_BIT3 9
#define GPIO_ENCODER_BIT2 10
#define GPIO_ENCODER_BIT1 11
#define GPIO_ENCODER_BIT0 12
#define GPIO_POWER_LED 13
#define GPIO_SENSOR0 14
#define GPIO_SENSOR7 15
#define GPIO_SENSOR6 16
#define GPIO_SENSOR5 17
#define GPIO_SENSOR4 18
#define GPIO_SENSOR3 19
#define GPIO_SENSOR2 20
#define GPIO_SENSOR1 21
#define GPIO_MPX_DATA 22
#define GPIO_MPX_CLOCK 23
#define GPIO_SENSOR_PINS { GPIO_SENSOR0, GPIO_SENSOR1, GPIO_SENSOR2, GPIO_SENSOR3, GPIO_SENSOR4, GPIO_SENSOR5, GPIO_SENSOR6, GPIO_SENSOR7 } 
#define GPIO_ENCODER_PINS { GPIO_ENCODER_BIT0, GPIO_ENCODER_BIT1, GPIO_ENCODER_BIT2, GPIO_ENCODER_BIT3, GPIO_ENCODER_BIT4, GPIO_ENCODER_BIT5, GPIO_ENCODER_BIT6, GPIO_ENCODER_BIT7 }
#define GPIO_INPUT_PINS { GPIO_ENCODER_BIT0, GPIO_ENCODER_BIT1, GPIO_ENCODER_BIT2, GPIO_ENCODER_BIT3, GPIO_ENCODER_BIT4, GPIO_ENCODER_BIT5, GPIO_ENCODER_BIT6, GPIO_ENCODER_BIT7, GPIO_SENSOR0, GPIO_SENSOR1, GPIO_SENSOR2, GPIO_SENSOR3, GPIO_SENSOR4, GPIO_SENSOR5, GPIO_SENSOR6, GPIO_SENSOR7, GPIO_MPX_CLOCK, GPIO_MPX_DATA, GPIO_MPX_LATCH }
#define GPIO_OUTPUT_PINS { GPIO_POWER_LED }

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
#define STARTUP_SETTLE_PERIOD 5000        // Wait this many ms after boot before entering production
#define SWITCH_PROCESS_INTERVAL 250       // Process switch inputs every n ms
#define LED_MANAGER_HEARTBEAT 200         // Number of ms on / off
#define LED_MANAGER_INTERVAL 10           // Number of heartbeats between repeats
#define DEBOUNCER_SIZE 8                  // Number of IO channels to debounce

/**********************************************************************
 * NMEA transmit configuration. Modules that transmit PGN 127501 are
 * required to report switch bank state every four seconds, or
 * immediately on a detected state change.
 */
#define TRANSMIT_INTERVAL 4000UL    // N2K defined fastest allowed transmit rate for a PGN instance

/**********************************************************************
 * Declarations of local functions.
 */
void transmitSwitchbankStatusMaybe();
void updateLeds(unsigned char status);
void transmitPGN127501(unsigned char instance, tN2kBinaryStatus status);
tN2kOnOff bool2tN2kOnOff(bool state);
void messageHandler(const tN2kMsg&);

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
tNMEA2000Handler NMEA2000Handlers[]={ {0, 0} };

/**********************************************************************
 * DIL_SWITCH switch decoder.
 */
int ENCODER_PINS[] = GPIO_ENCODER_PINS;
DilSwitch DIL_SWITCH (ENCODER_PINS, ELEMENTCOUNT(ENCODER_PINS));

/**********************************************************************
 * DEBOUNCER for the switch inputs.
 */
int SWITCHES[DEBOUNCER_SIZE] = { GPIO_SENSOR0, GPIO_SENSOR1, GPIO_SENSOR2, GPIO_SENSOR3, GPIO_SENSOR4, GPIO_SENSOR5, GPIO_SENSOR6, GPIO_SENSOR7 };
Debouncer DEBOUNCER (SWITCHES);

/**********************************************************************
 * LED_MANAGER for all system LEDs.
 */
LedManager LED_MANAGER (LED_MANAGER_HEARTBEAT, LED_MANAGER_INTERVAL);

/**********************************************************************
 * SWITCHBANK_INSTANCE - working storage for the switchbank module
 * instance number. The user selected value is recovered from hardware
 * and assigned during module initialisation,
 */
unsigned char SWITCHBANK_INSTANCE = INSTANCE_UNDEFINED;

/**********************************************************************
 * SWITCHBANK_STATUS - buffer holding the N2K representation of the
 * current switchbank state. This value is updated in real time to
 * reflect changes in switch input channel states.
 */
tN2kBinaryStatus SWITCHBANK_STATUS;

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
  
  // Initialise switchbank status (set all channels to unknown/not available).
  N2kResetBinaryStatus(SWITCHBANK_STATUS);


  // Initialise and start N2K services.
  NMEA2000.SetProductInformation(PRODUCT_SERIAL_CODE, PRODUCT_CODE, PRODUCT_TYPE, PRODUCT_FIRMWARE_VERSION, PRODUCT_VERSION);
  NMEA2000.SetDeviceInformation(DEVICE_UNIQUE_NUMBER, DEVICE_FUNCTION, DEVICE_CLASS, DEVICE_MANUFACTURER_CODE);
  NMEA2000.SetMode(tNMEA2000::N2km_ListenAndNode, EEPROM.read(SOURCE_ADDRESS_EEPROM_ADDRESS)); // Configure for sending and receiving.
  NMEA2000.EnableForward(false); // Disable all msg forwarding to USB (=Serial)
  NMEA2000.ExtendTransmitMessages(TransmitMessages); // Tell library which PGNs we transmit
  NMEA2000.SetMsgHandler(messageHandler);
  NMEA2000.Open();
}

/**********************************************************************
 * MAIN PROGRAM - loop()
 * 
 * With the exception of NMEA2000.parseMessages() all of the functions
 * called from loop() implement interval timers which ensure that they
 * will mostly return immediately, only performing their substantive
 * tasks at intervals defined by program constants.
 * 
 * The global constant JUST_STARTED is used to delay acting on switch
 * inputs until a newly started system has stabilised and the GPIO
 * inputs have been debounced.
 */ 
void loop() {
  static bool JUST_STARTED = true;

  if (JUST_STARTED && (millis() > STARTUP_SETTLE_PERIOD)) {
    #ifdef DEBUG_SERIAL
    Serial.println();
    Serial.println("Starting:");
    Serial.print("  N2K Source address is "); Serial.println(NMEA2000.GetN2kSource());
    Serial.print("  Module instance number is "); Serial.println(SWITCHBANK_INSTANCE);
    #endif
    JUST_STARTED = false;
  }

  // Debounce all switch inputs.
  DEBOUNCER.debounce();

  // Before we transmit anything, let's do the NMEA housekeeping and
  // process any received messages. This call may result in acquisition
  // of a new CAN source address, so we check if there has been any
  // change and if so save the new address to EEPROM for future re-use.
  NMEA2000.ParseMessages();
  if (NMEA2000.ReadResetAddressChanged()) EEPROM.update(SOURCE_ADDRESS_EEPROM_ADDRESS, NMEA2000.GetN2kSource());

  // Once the start-up settle period is over we can enter production by
  // executing our only substantive function. 
  if (!JUST_STARTED) transmitSwitchbankStatusMaybe();

  // Update the states of connected LEDs
  LED_MANAGER.loop();
}

/**********************************************************************
 * transmitSwitchbankStatusMaybe() should be called directly from
 * loop(). The function proceeds to transmit a switchbank binary status
 * message if either (1) the current hardware channel status differs
 * from the previously reported status, or (2) the mandatory transmit
 * interval has elapsed.
 */
void transmitSwitchbankStatusMaybe() {
  static unsigned long deadline = 0L;
  unsigned long now = millis();
  static unsigned char savedStates = 0x00;
  unsigned char states = 0x00;

  states = DEBOUNCER.getStates();
  if ((savedStates != states) || (now > deadline)) {
    savedStates = states;
    N2kSetStatusBinaryOnStatus(SWITCHBANK_STATUS, bool2tN2kOnOff(DEBOUNCER.channelState(GPIO_SENSOR0)), 1);
    N2kSetStatusBinaryOnStatus(SWITCHBANK_STATUS, bool2tN2kOnOff(DEBOUNCER.channelState(GPIO_SENSOR1)), 2);
    N2kSetStatusBinaryOnStatus(SWITCHBANK_STATUS, bool2tN2kOnOff(DEBOUNCER.channelState(GPIO_SENSOR2)), 3);
    N2kSetStatusBinaryOnStatus(SWITCHBANK_STATUS, bool2tN2kOnOff(DEBOUNCER.channelState(GPIO_SENSOR3)), 4);
    N2kSetStatusBinaryOnStatus(SWITCHBANK_STATUS, bool2tN2kOnOff(DEBOUNCER.channelState(GPIO_SENSOR4)), 5);
    N2kSetStatusBinaryOnStatus(SWITCHBANK_STATUS, bool2tN2kOnOff(DEBOUNCER.channelState(GPIO_SENSOR5)), 6);
    N2kSetStatusBinaryOnStatus(SWITCHBANK_STATUS, bool2tN2kOnOff(DEBOUNCER.channelState(GPIO_SENSOR6)), 7);
    N2kSetStatusBinaryOnStatus(SWITCHBANK_STATUS, bool2tN2kOnOff(DEBOUNCER.channelState(GPIO_SENSOR7)), 8);
    transmitPGN127501(SWITCHBANK_INSTANCE, SWITCHBANK_STATUS);
    updateLeds(states);
    deadline = (now + TRANSMIT_INTERVAL);
  }
}

/**********************************************************************
 * Flash the power LED once to indicate that a data packet has been
 * transmitted and update the multiplexor so that the channel indicator
 * LEDs reflect the value of <states>.
 */ 
void updateLeds(unsigned char states) {
  LED_MANAGER.operate(GPIO_POWER_LED, 0, 1);
  digitalWrite(GPIO_MPX_LATCH, LOW);
  shiftOut(GPIO_MPX_DATA, GPIO_MPX_CLOCK, MSBFIRST, states);
  digitalWrite(GPIO_MPX_LATCH, HIGH);
}

/**********************************************************************
 * Helper function that assembles and transmits a PGN 127501 Binary
 * Status Update message over the host NMEA bus. <instance> specifies
 * the switchbank instance number and <status> the switchbank channel
 * states. 
 */
void transmitPGN127501(unsigned char instance, tN2kBinaryStatus status) {
  tN2kMsg N2kMsg;
  SetN2kPGN127501(N2kMsg, instance, status);
  NMEA2000.SendMsg(N2kMsg);
}  

/**********************************************************************
 * Helper function to convert a boolean <state> into a tN2kOnOff value
 * suitable for updating a tN2kBinaryStatus buffer.
 */
tN2kOnOff bool2tN2kOnOff(bool state) {
  return((state)?N2kOnOff_On:N2kOnOff_Off);
}

/**********************************************************************
 * Field an incoming NMEA message to a defined handler.
 */
void messageHandler(const tN2kMsg &N2kMsg) {
  int iHandler;
  for (iHandler=0; NMEA2000Handlers[iHandler].PGN!=0 && !(N2kMsg.PGN==NMEA2000Handlers[iHandler].PGN); iHandler++);
  if (NMEA2000Handlers[iHandler].PGN != 0) {
    NMEA2000Handlers[iHandler].Handler(N2kMsg); 
  }
}