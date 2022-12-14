/**********************************************************************
 * SIM108.cpp - firmware for the SIM108 switch input module.
 * Copyright (c) 2021-22 Paul Reeve <preeve@pdjr.eu>
 *
 * Target platform: Teensy 4.0
 * 
 * SIM108 is an 8-channel NMEA switch input module built around a
 * Teensy 3.2/4.0 microcontroller.
 * 
 * This firmware recovers the state of sensor channel inputs, assembles
 * a switchbank Binary Status Report and transmits this over NMEA using 
 * PGN127501. Feedback on module operation is presented by modulating
 * channel state and transmission indicator LEDs.
 * 
 * Switch inputs are debounced in software.
 */

#include <Arduino.h>
#include <EEPROM.h>
#include <NMEA2000_CAN.h>
#include <Button.h>
#include <N2kTypes.h>
#include <N2kMessages.h>
#include <IC74HC165.h>
#include <IC74HC595.h>
#include <ProcessQueue.h>
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

#include "core-eepromaddresses.defs"
#include "core-mcupins.defs"
#include "module-deviceinfo.defs"
#include "module-productinfo.defs"

#define GPIO_SWITCH_INPUT1 GPIO_D23
#define GPIO_SWITCH_INPUT2 GPIO_D22
#define GPIO_SWITCH_INPUT3 GPIO_D21
#define GPIO_SWITCH_INPUT4 GPIO_D20
#define GPIO_SWITCH_INPUT5 GPIO_D19
#define GPIO_SWITCH_INPUT6 GPIO_D18
#define GPIO_SWITCH_INPUT7 GPIO_D17
#define GPIO_SWITCH_INPUT8 GPIO_D16

#define DEFAULT_SOURCE_ADDRESS 22         // Seed value for source address claim
#define INSTANCE_UNDEFINED 255            // Flag value
#define PGN127501_TRANSMIT_INTERVAL 4000UL
#define SWITCH_PROCESS_INTERVAL 100       // Process switch inputs every n ms
#define LED_UPDATE_INTERVAL 50            // Number of ms on / off

/**********************************************************************
 * Declarations of local functions.
 */
void processSwitchInputsMaybe();
void transmitSwitchbankStatusMaybe(bool force = false);
void transmitPGN127501();
unsigned char getLedStatus();
void flashTransmitLedMaybe();
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
tNMEA2000Handler NMEA2000Handlers[]={ {0L, 0} };

/**********************************************************************
 * BASE PLATFORM DEVICES
 */
Button PRG_BUTTON(GPIO_PRG);
IC74HC165 DIL_SWITCH (GPIO_PISO_CLOCK, GPIO_PISO_DATA, GPIO_PISO_LATCH);
IC74HC595 LED_DISPLAY (GPIO_SIPO_CLOCK, GPIO_SIPO_DATA, GPIO_SIPO_LATCH);
int TRANSMIT_LED = 0;

/**********************************************************************
 * APPLICATION SPECIFIC DEVICES
 */
Button SWITCH_INPUTS[] = { Button(GPIO_SWITCH_INPUT1), Button(GPIO_SWITCH_INPUT2), Button(GPIO_SWITCH_INPUT3), Button(GPIO_SWITCH_INPUT4), Button(GPIO_SWITCH_INPUT5), Button(GPIO_SWITCH_INPUT6), Button(GPIO_SWITCH_INPUT7), Button(GPIO_SWITCH_INPUT8) };

/**********************************************************************
 * MODULE_INSTANCE - working storage for the switchbank module
 * instance number. The user selected value is recovered from hardware
 * and assigned during module initialisation,
 */
unsigned char MODULE_INSTANCE = INSTANCE_UNDEFINED;

/**********************************************************************
 * SWITCHBANK_STATUS - working storage for holding the most recently
 * read state of the Teensy switch inputs.
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

  // Set the mode of GPIO output pins.
  int opins[] = GPIO_OUTPUT_PINS;
  for (unsigned int i = 0 ; i < ELEMENTCOUNT(opins); i++) pinMode(opins[i], OUTPUT);

  // Set the mode of GPIO input pins.

  PRG_BUTTON.begin();
  for (unsigned int i = 0; i < ELEMENTCOUNT(SWITCH_INPUTS); i++) SWITCH_INPUTS[i].begin();
  DIL_SWITCH.begin();
  LED_DISPLAY.begin();

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
  MODULE_INSTANCE = DIL_SWITCH.readByte();

  // Run a startup sequence in the LED display: all LEDs on to confirm
  // function, then a display of the module instance number.
  LED_DISPLAY.writeByte(0xff); delay(100);
  LED_DISPLAY.writeByte(MODULE_INSTANCE); delay(1000);
  LED_DISPLAY.writeByte(0x00);

  // Arrange for automatic update of the status LEDs.
  LED_DISPLAY.configureUpdate(LED_UPDATE_INTERVAL, getLedStatus);

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

  #ifdef DEBUG_SERIAL
  Serial.println();
  Serial.println("Starting:");
  Serial.print("  N2K Source address is "); Serial.println(NMEA2000.GetN2kSource());
  Serial.print("  Module instance number is "); Serial.println(MODULE_INSTANCE);
  #endif

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
  
  // Before we transmit anything, let's do the NMEA housekeeping and
  // process any received messages. This call may result in acquisition
  // of a new CAN source address, so we check if there has been any
  // change and if so save the new address to EEPROM for future re-use.
  NMEA2000.ParseMessages();
  if (NMEA2000.ReadResetAddressChanged()) EEPROM.update(SOURCE_ADDRESS_EEPROM_ADDRESS, NMEA2000.GetN2kSource());

  // If the PRG button has been operated, then update module instance.
  if (PRG_BUTTON.released()) MODULE_INSTANCE = DIL_SWITCH.readByte();

  // Process any switch state changes and transmit switchbank status
  // updates as required.

  processSwitchInputsMaybe();
  transmitSwitchbankStatusMaybe();
  flashTransmitLedMaybe();
  
  // Update the states of connected LEDs
  LED_DISPLAY.updateMaybe();
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
  tN2kOnOff switchStatus = N2kOnOff_Unavailable;

  if (now > deadline) {
    for (unsigned int i = 0; i < ELEMENTCOUNT(SWITCH_INPUTS); i++) {
      if (SWITCH_INPUTS[i].toggled()) {
        switchStatus = (SWITCH_INPUTS[i].read() == Button::PRESSED)?N2kOnOff_On:N2kOnOff_Off;
        if (switchStatus != N2kGetStatusOnBinaryStatus(SWITCHBANK_STATUS, (i + 1))) {
          N2kSetStatusBinaryOnStatus(SWITCHBANK_STATUS, switchStatus, (i + 1));
          updated = true;
        }
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
    TRANSMIT_LED = 1;
    deadline = (now + PGN127501_TRANSMIT_INTERVAL);
  }
}

/**********************************************************************
 * Flash the transmit LED every time a packet is transmitted over NMEA.
 */
void flashTransmitLedMaybe() {
  static unsigned long deadline = 0UL;
  unsigned long now = millis();

  if (now > deadline) {
    digitalWrite(GPIO_TRANSMIT_LED, TRANSMIT_LED); TRANSMIT_LED = 0;
    deadline = (now + LED_UPDATE_INTERVAL);
  }
}

/**********************************************************************
 * Assemble and transmit a PGN 127501 Binary Status Update message
 * reflecting the current switchbank state.
 */
void transmitPGN127501() {
  static tN2kMsg N2kMsg;

  if (MODULE_INSTANCE < 253) {
    SetN2kPGN127501(N2kMsg, MODULE_INSTANCE, SWITCHBANK_STATUS);
    NMEA2000.SendMsg(N2kMsg);
  }
}  

/**********************************************************************
 * Returns a byte with each bit set to reflect the state of a switch
 * bank channel: channel 1 -> bit 0, channel 2 -> bit 1 and so on.
 * Thinks - may need to reverse the bit order?
 */
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