// Process any switch state changes and transmit switchbank status
  // updates as required.

  processSwitchInputsMaybe();
  transmitSwitchbankStatusMaybe();
  flashTransmitLedMaybe();