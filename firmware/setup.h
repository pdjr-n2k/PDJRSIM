/**
 * @file setup.h
 * @author Paul Reeve (preeve@pdjr.eu)
 * @brief Code to be executed in Arduino setup().
 * @version 0.1
 * @date 2023-01-16
 * @copyright Copyright (c) 2023
 */

for (unsigned int i = 0; i < ELEMENTCOUNT(SWITCH_INPUTS); i++) SWITCH_INPUTS[i].begin();

N2kResetBinaryStatus(SWITCHBANK_STATUS);