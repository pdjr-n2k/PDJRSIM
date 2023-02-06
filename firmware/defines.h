/**
 * @file defines.h
 * @author Paul Reeve (preeve@pdjr.eu)
 * @brief Defines for SIM108.
 * @version 0.1
 * @date 2023-01-16
 * @copyright Copyright (c) 2023
 */

/**********************************************************************
 * @brief GPIO pin definition aliases.
 */
#define GPIO_PISO_SWITCH_DATA GPIO_D23
#define GPIO_PISO_SWITCH_LATCH GPIO_D16
#define GPIO_PISO_SWITCH_CLOCK GPIO_D17

/**********************************************************************
 * @brief NMEA2000 device information overrides.
 */
#define DEVICE_CLASS 30                 // Electrical Distribution
#define DEVICE_FUNCTION 130             // Binary Event Monitor
#define DEVICE_UNIQUE_NUMBER 108        // Bump me?

/**********************************************************************
 * @brief NMEA2000 product information overrides.
 */
#define PRODUCT_CODE 002
#define PRODUCT_FIRMWARE_VERSION "1.1.0 (Jun 2022)"
#define PRODUCT_LEN 1
#define PRODUCT_SERIAL_CODE "002-108"   // PRODUCT_CODE + DEVICE_UNIQUE_NUMBER
#define PRODUCT_TYPE "SIM108"           // The product name?
#define PRODUCT_VERSION "2.0 (Dec 2022)"

/**********************************************************************
 * @brief NMEA2000 transmit and receive PGN overrides.
 */
#define NMEA_TRANSMITTED_PGNS { 127501L, 0 }

/**********************************************************************
 * @brief ModuleConfiguration library stuff.
 */
#define MODULE_CONFIGURATION_SIZE 4                               // Total configuration size in bytes

#define MODULE_CONFIGURATION_INSTANCE_INDEX 1                     // Index of module instance number
#define MODULE_CONFIGURATION_PGN127501_TRANSMIT_PERIOD_INDEX 2    // Index of PGN 127501 transmit period in seconds
#define MODULE_CONFIGURATION_PGN127501_TRANSMIT_OFFSET_INDEX 3    // Index of PGN 127501 transmit offset in 10s of milli-seconds

#define MODULE_CONFIGURATION_INSTANCE_DEFAULT 0xff                // Disabled
#define MODULE_CONFIGURATION_TRANSMIT_PERIOD_DEFAULT 0x02         // Every two seconds
#define MODULE_CONFIGURATION_TRANSMIT_OFFSET_DEFAULT 0x00         // Zero times 10 milliseconds

#define MODULE_CONFIGURATION_DEFAULT { \
  MODULE_CONFIGURATION_CAN_SOURCE_DEFAULT, \
  MODULE_CONFIGURATION_INSTANCE_DEFAULT, \
  MODULE_CONFIGURATION_TRANSMIT_PERIOD_DEFAULT, \
  MODULE_CONFIGURATION_TRANSMIT_OFFSET_DEFAULT \
}

/**********************************************************************
 * @brief NOP100 function overrides.
 */
#define CONFIGURATION_VALIDATOR
#define ON_N2K_OPEN

#define NUMBER_OF_SWITCH_INPUTS 16

/**********************************************************************
 * @brief SIM108 - number of milliseconds between checks on switch
 * input channel states.
 */
#define SWITCH_PROCESS_INTERVAL 100
