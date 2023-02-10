/**
 * @file definitions.h
 * @author Paul Reeve (preeve@pdjr.eu)
 * @brief Everything required to implement PDJRSIM.
 * @version 0.1
 * @date 2023-01-16
 * @copyright Copyright (c) 2023
 */

/**
 * @brief Scheduler instance to manage transmission of PGN 127501.
 */
tN2kSyncScheduler PGN127501Scheduler;

/**
 * @brief Interface to the IC74HC165 PISO IC that connects the switch
 *        inputs.
 */
IC74HC165 SwitchInputPISO (GPIO_PISO_SWITCH_CLOCK, GPIO_PISO_SWITCH_DATA, GPIO_PISO_SWITCH_LATCH);

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
 * that we need to do is create the PGN and, if the module has a valid
 * instance number, transmit it. 
 */
void transmitPGN127501() {
  #ifdef DEBUG_SERIAL
  Serial.println("Transmitting N2K message");
  #endif
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
 * If a channel has changed state then the value of SwitchbankStatus
 * is updated and a call is made to immediately transmit the update
 * over NMEA. 
 */
void processSwitchInputs(unsigned int status) {
  bool updated = false;

  #ifdef DEBUG_SERIAL
  Serial.print("processSwitchInputs("); Serial.print(status); Serial.println(")...");
  #endif

  for (unsigned int i = 0; i < NUMBER_OF_SWITCH_INPUTS; i++) {
    if ((status & (1 << i)) != ((N2kGetStatusOnBinaryStatus(SwitchbankStatus, (i + 1)) == N2kOnOff_On)?1:0)) {
      N2kSetStatusBinaryOnStatus(SwitchbankStatus, (status & (1 << i))?N2kOnOff_On:N2kOnOff_Off, (i + 1));
      updated = true;
    }
  }
  if (updated) transmitPGN127501();
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
  #ifdef DEBUG_SERIAL
  Serial.println("N2K bus opened successfully");
  #endif

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
  #ifdef DEBUG_SERIAL
  Serial.print("Validating configuration update: ");
  Serial.print("address = "); Serial.print(index); Serial.print(", ");
  Serial.print("value = "); Serial.println(value);
  #endif
  
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
