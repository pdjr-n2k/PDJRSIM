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
 * product-information.defs
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

#define PRG_JUMP_VECTOR { { 0, updateModuleInstance }, { 0, 0} }
#define NMEA_TRANSMIT_MESSAGE_PGNS { 0 }
#define NMEA_PGN_HANDLERS  { { 0L, 0 } }

/**********************************************************************
 * Aliases for GPIO pins connected to switch inputs. 
 */
#define GPIO_SWITCH_INPUT1 GPIO_D23
#define GPIO_SWITCH_INPUT2 GPIO_D22
#define GPIO_SWITCH_INPUT3 GPIO_D21
#define GPIO_SWITCH_INPUT4 GPIO_D20
#define GPIO_SWITCH_INPUT5 GPIO_D19
#define GPIO_SWITCH_INPUT6 GPIO_D18
#define GPIO_SWITCH_INPUT7 GPIO_D17
#define GPIO_SWITCH_INPUT8 GPIO_D16

#define SWITCH_PROCESS_INTERVAL 100       // Process switch inputs every n ms
#define PGN127501_TRANSMIT_INTERVAL 4000UL

/**********************************************************************
 * SWITCH_INPUTS - array of debounced GPIO inputs which connect the
 * module's external switch inputs.
 */
Button SWITCH_INPUTS[] = { Button(GPIO_SWITCH_INPUT1), Button(GPIO_SWITCH_INPUT2), Button(GPIO_SWITCH_INPUT3), Button(GPIO_SWITCH_INPUT4), Button(GPIO_SWITCH_INPUT5), Button(GPIO_SWITCH_INPUT6), Button(GPIO_SWITCH_INPUT7), Button(GPIO_SWITCH_INPUT8) };

/**********************************************************************
 * SWITCHBANK_STATUS - working storage for holding the most recently
 * read state of the Teensy switch inputs in the format used by the
 * NMEA2000 library.
 */
tN2kBinaryStatus SWITCHBANK_STATUS;

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
    TRANSMIT_LED_STATE = 1;
    deadline = (now + PGN127501_TRANSMIT_INTERVAL);
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

#define GET_STATUS_LEDS_STATUS
/**********************************************************************
 * getStatusLedsStatus - returns a value that should be used to update
 * the status LEDs.
 */
uint8_t getStatusLedsStatus() {
  unsigned char retval = 0;
  for (int i = 0; i < 8; i++) {
    retval = (retval | (((N2kGetStatusOnBinaryStatus(SWITCHBANK_STATUS, (i + 1)) == N2kOnOff_On)?1:0) << i));
  }
  return(retval);
}

int updateModuleInstance(int value) {
  if (!(value & 0x0100)) {
    EEPROM.write(INSTANCE_ADDRESS_EEPROM_ADDRESS, value);
    MODULE_INSTANCE = EEPROM.read(INSTANCE_ADDRESS_EEPROM_ADDRESS);
  }
  STATUS_LEDS.writeByte(MODULE_INSTANCE); delay(1000);
  return(0);
}
