/**********************************************************************
 * module-setup.inc
 */
 
/**********************************************************************
 * We are using Button debouncers on our switch input channels and we
 * need to initialise these using the begin() method.
 */
for (unsigned int i = 0; i < ELEMENTCOUNT(SWITCH_INPUTS); i++) SWITCH_INPUTS[i].begin();

/**********************************************************************
 * Clear switchbank status buffer.
 */
N2kResetBinaryStatus(SWITCHBANK_STATUS);

/**********************************************************************
 * If the user has configured a special transmission interval for PGN
 * 127501 and it is reasonable, then override the module default.
 */ 
if (EEPROM.read(PGN127501_TRANSMIT_INTERVAL_EEPROM_ADDRESS) != 255) {
  if (EEPROM.read(PGN127501_TRANSMIT_INTERVAL_EEPROM_ADDRESS) != 0) {
    PGN127501_TRANSMIT_INTERVAL = ((unsigned long) EEPROM.read(PGN127501_TRANSMIT_INTERVAL_EEPROM_ADDRESS) * 1000UL);
  }
} 