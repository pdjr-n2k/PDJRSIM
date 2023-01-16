/**********************************************************************
 * module-directives.inc
 *
 * Contains #defines for the constant values which characterise our
 * module application and, a little incongruously, declarations for our
 * application functions
 */
  
 /**********************************************************************
 * DEVICE INFORMATION
 * 
 * Because of NMEA's closed standard, most of this is fiction. Maybe it
 * can be made better with more research.
 *
 * DEVICE_CLASS and DEVICE_FUNCTION are explained in the document
 * "NMEA 2000 Appendix B.6 Class & Function Codes". The example values
 * below would be approprate for a switch input module.
 * 
 * INDUSTRY_GROUP we can be confident about (4 says maritime).
 * 
 * MANUFACTURER_CODE is only allocated to subscribed NMEA members and,
 * unsurprisingly, an anonymous code has not been assigned: 2046 is
 * currently unused, so we adopt that.  
 * 
 * UNIQUE_NUMBER is combined in some way so that together they define
 * a value which must be unique (is some way) on any N2K bus. An easy
 * way to achieve this is just to bump the unique number for every
 * software build. Really this needs automating.
 */
#define DEVICE_CLASS 30                 // Electrical Distribution
#define DEVICE_FUNCTION 130             // Binary Event Monitor
#define DEVICE_INDUSTRY_GROUP 4         // Maritime
#define DEVICE_MANUFACTURER_CODE 2046   // Currently not allocated.
#define DEVICE_UNIQUE_NUMBER 106        // Bump me?


/**********************************************************************
 * PRODUCT INFORMATIOM
 * 
 * This poorly structured set of values is what NMEA expects a product
 * description to be shoe-horned into.
 */
#define PRODUCT_CERTIFICATION_LEVEL 1
#define PRODUCT_CODE 002
#define PRODUCT_FIRMWARE_VERSION "1.1.0 (Jun 2022)"
#define PRODUCT_LEN 1
#define PRODUCT_N2K_VERSION 2022        // The N2K specification version?
#define PRODUCT_SERIAL_CODE "002-106"   // PRODUCT_CODE + DEVICE_UNIQUE_NUMBER
#define PRODUCT_TYPE "SIM108"           // The product name?
#define PRODUCT_VERSION "2.0 (Dec 2022)"

/**********************************************************************
 * NMEA2000 LIBRARY DEFINITIONS
 *
 * NMEA_TRANSMIT_MESSAGE_PGNS is an initialiser for an array of PGNs
 * which defines the messages transmitted by this firmware. The list
 * must terminate with a zero value.
 *
 * NMEA_PGN_HANDLERS is an initialiser for a jump vector which defines
 * a list of pairs each of which maps a PGN to the function responsible
 * for processing messages of the defined type when they are received
 * over the CAN interface. For example, { 127501, myFunc }. The list
 * must terminate with the special flag value { 0, 0 }.
 */
#define NMEA_TRANSMIT_MESSAGE_PGNS { 127501L, 0 }
#define NMEA_PGN_HANDLERS  { { 0L, 0 } }

/**********************************************************************
 * Aliases for GPIO pins connected to switch inputs. 
 */
#define GPIO_SWITCH_INPUT1 GPIO_D23
#define GPIO_SWITCH_INPUT2 GPIO_D22
#define GPIO_SWITCH_INPUT3 GPIO_D21
#define GPIO_SWITCH_INPUT4 GPIO_D20
#define GPIO_SWITCH_INPUT5 GPIO_D19
#define GPIO_SWITCH_INPUT6 GPIO_D7
#define GPIO_SWITCH_INPUT7 GPIO_D6
#define GPIO_SWITCH_INPUT8 GPIO_D5

#define PGN127501_TRANSMIT_INTERVAL_EEPROM_ADDRESS 2

#define CM_SIZE 3

#define CM_CAN_SOURCE_INDEX 0
#define CM_INSTANCE_INDEX 1
#define CM_TRANSMIT_INTERVAL_INDEX 2

#define CM_INSTANCE_DEFAULT 0xff
#define CM_TRANSMIT_INTERVAL_DEFAULT 0x04

/**********************************************************************
 * Number of milliseconds between checks on switch input channel state.
 */
#define SWITCH_PROCESS_INTERVAL 100       // Process switch inputs every n ms


/**********************************************************************
 * Number of milliseconds between regular transmission of PGN 127501.
 */
#define PGN127501_TRANSMIT_INTERVAL_DEFAULT 4000UL

/**********************************************************************
 * Ok, these are declarations, not definitions, but we need to get them
 * in the world quite early...
 */
void processSwitchInputsMaybe();
void transmitSwitchbankStatusMaybe(bool force = false);
void transmitPGN127501();
