/**
 * @file defines.h
 * @author Paul Reeve (preeve@pdjr.eu)
 * @brief Defines for SIM108.
 * @version 0.1
 * @date 2023-01-16
 * @copyright Copyright (c) 2023
 */

/**
 * @brief Overrides of NOP100 definitions.
 */
#define DEVICE_CLASS 30                 // Electrical Distribution
#define DEVICE_FUNCTION 130             // Binary Event Monitor
#define DEVICE_UNIQUE_NUMBER 108        // Bump me?

#define PRODUCT_CODE 002
#define PRODUCT_FIRMWARE_VERSION "1.1.0 (Jun 2022)"
#define PRODUCT_LEN 1
#define PRODUCT_SERIAL_CODE "002-108"   // PRODUCT_CODE + DEVICE_UNIQUE_NUMBER
#define PRODUCT_TYPE "SIM108"           // The product name?
#define PRODUCT_VERSION "2.0 (Dec 2022)"

#define NMEA_TRANSMIT_MESSAGE_PGNS { 127501L, 0 }

/**
 * @brief Aliases for GPIO pins connected to switch inputs.
 */
#define GPIO_SWITCH_INPUT1 GPIO_D23
#define GPIO_SWITCH_INPUT2 GPIO_D22
#define GPIO_SWITCH_INPUT3 GPIO_D21
#define GPIO_SWITCH_INPUT4 GPIO_D20
#define GPIO_SWITCH_INPUT5 GPIO_D19
#define GPIO_SWITCH_INPUT6 GPIO_D7
#define GPIO_SWITCH_INPUT7 GPIO_D6
#define GPIO_SWITCH_INPUT8 GPIO_D5

/**
 * @brief Configuration details.
 */
#define CM_SIZE 3

#define CM_INSTANCE_INDEX 1
#define CM_TRANSMIT_INTERVAL_INDEX 2

#define CM_INSTANCE_DEFAULT 0xff
#define CM_TRANSMIT_INTERVAL_DEFAULT 0x04

/**
 * @brief Number of milliseconds between checks on switch input channel
 *        state.
 */
#define SWITCH_PROCESS_INTERVAL 100

/**
 * @brief Number of milliseconds between regular transmission of PGN
 *        127501.
 */
#define PGN127501_TRANSMIT_INTERVAL_DEFAULT 4000UL

/**
 * @brief These are the NOP100 functins we will override.
 */
#define CONFIGURATION_INITIALISER
#define CONFIGURATION_VALIDATOR
#define GET_STATUS_LEDS_STATUS
