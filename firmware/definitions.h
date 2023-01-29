/**
 * @file definitions.h
 * @author Paul Reeve (preeve@pdjr.eu)
 * @brief Everything required to implement SIM108.
 * @version 0.1
 * @date 2023-01-16
 * @copyright Copyright (c) 2023
 */

/**
 * @brief Scheduler instance to manage transmission of PGN 127501.
 */
tN2kSyncScheduler PGN127501Scheduler;

/**
 * @brief Array of Button debouncer objects connected to the module's
 * external switch inputs.
 */
Button SwitchInputs[] = {
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
 * @brief Buffer for registering the device's switch channel states.
 * 
 * We use the tN2kBinaryStatus type rather than a simple bool array
 * because this can then be used without further processing in a PGN
 * 127501 message.
 */
tN2kBinaryStatus SwitchbankStatus;

/**
 * @brief Transmit PGN 127501 and flash transmit LED.
 * 
 * SwitchBankStatus is kept up to date by processSwitchInputs(), so all
 * the we need to do is create the PGN and, if the module has a valid
 * instance number, transmit it. 
 */
void transmitPGN127501() {
  static tN2kMsg N2kMsg;

  if (ModuleConfiguration.getByte(MODULE_CONFIGURATION_INSTANCE_INDEX) != 255) {
    SetN2kPGN127501(N2kMsg, ModuleConfiguration.getByte(MODULE_CONFIGURATION_INSTANCE_INDEX), SwitchbankStatus);
    NMEA2000.SendMsg(N2kMsg);
    TransmitLed.setLedState(0, tLedManager::LedState::once);
  }
}  

/**
 * @brief Record switch channel input states and respond to any state
 * changes.
 * 
 * This function must be called from loop(). It will check switch
 * inputs once every SWITCH_PROCESS_INTERVAL milliseconds.
 * 
 * If a channel has changed state then the value of SwitchbankStatus
 * is updated and a call is made to immediately transmit the update
 * over NMEA. 
 */
void processSwitchInputsMaybe() {
  static unsigned long deadline = 0UL;
  unsigned long now = millis();
  bool updated = false;
  tN2kOnOff switchStatus = N2kOnOff_Unavailable;

  if (now > deadline) {
    for (unsigned int i = 0; i < ELEMENTCOUNT(SwitchInputs); i++) {
      if (SwitchInputs[i].toggled()) {
        switchStatus = (SwitchInputs[i].read() == Button::PRESSED)?N2kOnOff_On:N2kOnOff_Off;
        if (switchStatus != N2kGetStatusOnBinaryStatus(SwitchbankStatus, (i + 1))) {
          N2kSetStatusBinaryOnStatus(SwitchbankStatus, switchStatus, (i + 1));
          updated = true;
        }
      }
    }
    if (updated) transmitPGN127501();
    deadline = (now + SWITCH_PROCESS_INTERVAL);
  }
}

///////////////////////////////////////////////////////////////////////
// The following functions override the defaults provided in NOP100. //
///////////////////////////////////////////////////////////////////////

/**
 * @brief Callback invoked when N2K bus connection becomes active.
 * 
 * Set the period and offset of the scheduler used for transmission of
 * PGN 127501 from module configuration data and (as a side effect)
 * start the scheduler.
 * 
 * @note Overrides the eponymous function in NOP100.
 */
void onN2kOpen() {
  PGN127501Scheduler.SetPeriodAndOffset(
    (uint32_t) (ModuleConfiguration.getByte(MODULE_CONFIGURATION_PGN127501_TRANSMIT_PERIOD_INDEX) * 1000),
    (uint32_t) (ModuleConfiguration.getByte(MODULE_CONFIGURATION_PGN127501_TRANSMIT_OFFSET_INDEX) * 10)
  );
}

/**
 * @brief ModuleConfiguration callback invoked to validate proposed
 * changes to the module configuration.
 * 
 * @note Overrides the eponymous function in NOP100.
 */
bool configurationValidator(unsigned int index, unsigned char value) {
  switch (index) {
    case MODULE_CONFIGURATION_CAN_SOURCE_INDEX:
      return(true);
    case MODULE_CONFIGURATION_INSTANCE_INDEX:
      return((value < 253) || (value == 255));
      break;
    case MODULE_CONFIGURATION_PGN127501_TRANSMIT_PERIOD_INDEX:
      return(true);
      break;
    case MODULE_CONFIGURATION_PGN127501_TRANSMIT_OFFSET_INDEX:
      return(true);
      break;
    default:
      return(false);
      break;
  }
}
