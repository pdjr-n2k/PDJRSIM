/**
 * @file setup.h
 * @author Paul Reeve (preeve@pdjr.eu)
 * @brief Code to be executed in Arduino setup().
 * @version 0.1
 * @date 2023-01-16
 * @copyright Copyright (c) 2023
 */

SwitchInputPISO.configureCallback(processSwitchInputs, SWITCH_PROCESS_INTERVAL, (NUMBER_OF_SWITCH_INPUTS / 8));
SwitchInputPISO.begin();

N2kResetBinaryStatus(SwitchbankStatus);