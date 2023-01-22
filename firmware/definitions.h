/**
 * @file definitions.h
 * @author Paul Reeve (preeve@pdjr.eu)
 * @brief Everything required to implement SIM108.
 * @version 0.1
 * @date 2023-01-16
 * @copyright Copyright (c) 2023
 */

/**
 * @brief Create a scheduler instance for transmission of PGN 127501.
 */
tN2kSyncScheduler PGN127501Scheduler;

/**
 * @brief Array of debounced GPIO inputs which connect the module's
 *        external switch inputs.
 */
Button SWITCH_INPUTS[] = {
  Button(GPIO_SWITCH_INPUT1),
  Button(GPIO_SWITCH_INPUT2),
  Button(GPIO_SWITCH_INPUT3),
  Button(GPIO_SWITCH_INPUT4),
  Button(GPIO_SWITCH_INPUT5),
  Button(GPIO_SWITCH_INPUT6),
  Button(GPIO_SWITCH_INPUT7),
  Button(GPIO_SWITCH_INPUT8)
};

/**
 * @brief Save the device's switch channel states in an NMEA2000 format
 *        because it makes things easy.
 */
tN2kBinaryStatus SWITCHBANK_STATUS;

/**
 * @brief Callback with actions to perform on CAN address claim.
 * 
 * Set the period and offset for transmission of PGN 127501 from module
 * configuration data. The SetPeriodAndOffset() function alos starts the
 * scheduler.
 */
void onN2kOpen() {
  PGN127501Scheduler.SetPeriodAndOffset(
    (uint32_t) (MODULE_CONFIGURATION.getByte(CM_PGN127501_TRANSMIT_PERIOD_INDEX) * 1000),
    (uint32_t) (MODULE_CONFIGURATION.getByte(CM_PGN127501_TRANSMIT_OFFSET_INDEX) * 10)
  );
}

/**
 * @brief Specialised override of callback defined in NOP100.cpp.
 */
unsigned char* configurationInitialiser(int& size, unsigned int eepromAddress) {
  static unsigned char *buffer = new unsigned char[size = CM_SIZE];
  EEPROM.get(eepromAddress, buffer);
  if (buffer[CM_CAN_SOURCE_INDEX] == 0xff) {
    buffer[CM_CAN_SOURCE_INDEX] = CM_CAN_SOURCE_DEFAULT;
    buffer[CM_INSTANCE_INDEX] = CM_INSTANCE_DEFAULT;
    buffer[CM_PGN127501_TRANSMIT_PERIOD_INDEX] = CM_TRANSMIT_PERIOD_DEFAULT;
    buffer[CM_PGN127501_TRANSMIT_OFFSET_INDEX] = CM_TRANSMIT_OFFSET_DEFAULT;
    EEPROM.put(eepromAddress, buffer);
  }
  return(buffer);
}

/**
 * @brief Specialised override of callback defined in NOP100.cpp.
 */
bool configurationValidator(unsigned int index, unsigned char value) {
  switch (index) {
    case CM_CAN_SOURCE_INDEX:
      return(true);
    case CM_INSTANCE_INDEX:
      return((value < 252) || (value == 255));
      break;
    case CM_PGN127501_TRANSMIT_PERIOD_INDEX:
      return(true);
      break;
    case CM_PGN127501_TRANSMIT_OFFSET_INDEX:
      return(true);
      break;
    default:
      return(false);
      break;
  }
}

/**
 * @brief Specialised override of callback defined in NOP100.cpp.
 */
uint8_t getStatusLedsStatus() {
  unsigned char retval = 0;
  for (int i = 0; i < 8; i++) {
    retval = (retval | (((N2kGetStatusOnBinaryStatus(SWITCHBANK_STATUS, (i + 1)) == N2kOnOff_On)?1:0) << i));
  }
  return(retval);
}

/**
 * @brief Transmit PGN 127501.
 * 
 * The switch bank status is maintained in real time, so all we need to do is
 * assembled an N2K message abd transmit it.
 */
void transmitPGN127501() {
  static tN2kMsg N2kMsg;

  if (MODULE_CONFIGURATION.getByte(CM_INSTANCE_INDEX) < 253) {
    SetN2kPGN127501(N2kMsg, MODULE_CONFIGURATION.getByte(CM_INSTANCE_INDEX), SWITCHBANK_STATUS);
    NMEA2000.SendMsg(N2kMsg);
    TRANSMIT_LED.setLedState(0, StatusLeds::LedState::once);
  }
}  

/**
 * @brief Check switch channel inputs and respond to any state changes.
 * 
 * This function must be called from loop(). It will check switch
 * inputs once every SWITCH_PROCESS_INTERVAL milliseconds.
 * 
 * If a channel has changed state then the value of SWITCHBANK_STATUS
 * is updated and a call is made to immediately transmit the update
 * over NMEA. 
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
    if (updated) transmitPGN127501();
    deadline = (now + SWITCH_PROCESS_INTERVAL);
  }
}


