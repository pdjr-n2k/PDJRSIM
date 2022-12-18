// Initialise all application GPIO pins.
for (unsigned int i = 0; i < ELEMENTCOUNT(SWITCH_INPUTS); i++) SWITCH_INPUTS[i].begin();
LED_STATUS_DISPLAY.begin();

// Clear the switchbank status buffer
N2kResetBinaryStatus(SWITCHBANK_STATUS);
