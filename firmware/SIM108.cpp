/**********************************************************************
 * SIM108.cpp - 8-channel NMEA switch input module firmware.
 * Copyright (c) 2021-22 Paul Reeve <preeve@pdjr.eu>
 *
 * Target platform: Teensy 3.2
 * 
 * This firmware implements an 8-channel switch input interface
 * that reports SPST sensor state over NMEA 2000 using PGN 127501
 * Binary Status Report. 
 */

#include <Arduino.h>
#include <ArduinoQueue.h>
#include <EEPROM.h>
#include <NMEA2000_CAN.h>
#include <N2kTypes.h>
#include <N2kMessages.h>
#include <Debouncer.h>
#include <LedManager.h>
#include <DilSwitch.h>
#include <arraymacros.h>

/**********************************************************************
 * SERIAL DEBUG
 * 
 * The firmware can be built so that it writes copious trace and debug
 * data to the MCU's serial output by defining DEBUG_SERIAL. When the
 * Teensy reboots it switches its USB port to serial emulation and it
 * can take a few seconds for a connected host computer to recognise
 * the switch: - DEBUG_SERIAL_START_DELAY introduces a delay that can
 * be used to prevent loss of early debug output.
 */
#define DEBUG_SERIAL
#define DEBUG_SERIAL_START_DELAY 4000

/**********************************************************************
 * MCU EEPROM (PERSISTENT) STORAGE
 * 
 * Module configuration is persisted to Teensy EEPROM storage.
 * 
 * SOURCE_ADDRESS_EEPROM_ADDRESS is the storage address for the
 * module's 1-byte N2K/CAN source address.
 * 
 * SENSORS_EEPROM_ADDRESS is the start address of storage used to hold
 * SENSOR congigurations. The length of this area will vary if the
 * Sensor ADT is redefined, so it is simplest to make sure the start
 * address remains as the last item in storage.
 */
#define SOURCE_ADDRESS_EEPROM_ADDRESS 0

/**********************************************************************
 * MCU PIN DEFINITIONS
 * 
 * GPIO pin definitions for the Teensy 3.2 MCU and some collections
 * that can be used as array initialisers
 */
#define GPIO_MPX_LATCH 1
#define GPIO_ENCODER_BIT7 5
#define GPIO_ENCODER_BIT6 6
#define GPIO_ENCODER_BIT5 7
#define GPIO_ENCODER_BIT4 8
#define GPIO_ENCODER_BIT3 9
#define GPIO_ENCODER_BIT2 10
#define GPIO_ENCODER_BIT1 11
#define GPIO_ENCODER_BIT0 12
#define GPIO_POWER_LED 13
#define GPIO_SENSOR0 14
#define GPIO_SENSOR7 15
#define GPIO_SENSOR6 16
#define GPIO_SENSOR5 17
#define GPIO_SENSOR4 18
#define GPIO_SENSOR3 19
#define GPIO_SENSOR2 20
#define GPIO_SENSOR1 21
#define GPIO_MPX_DATA 22
#define GPIO_MPX_CLOCK 23
#define GPIO_S_PINS { GPIO_SENSOR0, GPIO_SENSOR1, GPIO_SENSOR2, GPIO_SENSOR3, GPIO_SENSOR4, GPIO_SENSOR5, GPIO_SENSOR6, GPIO_SENSOR7 } 
#define GPIO_ENCODER_PINS { GPIO_ENCODER_BIT0, GPIO_ENCODER_BIT1, GPIO_ENCODER_BIT2, GPIO_ENCODER_BIT3, GPIO_ENCODER_BIT4, GPIO_ENCODER_BIT5, GPIO_ENCODER_BIT6, GPIO_ENCODER_BIT7 }
#define GPIO_INPUT_PINS { GPIO_ENCODER_BIT0, GPIO_ENCODER_BIT1, GPIO_ENCODER_BIT2, GPIO_ENCODER_BIT3, GPIO_ENCODER_BIT4, GPIO_ENCODER_BIT5, GPIO_ENCODER_BIT6, GPIO_ENCODER_BIT7, GPIO_SENSOR0, GPIO_SENSOR1, GPIO_SENSOR2, GPIO_SENSOR3, GPIO_SENSOR4, GPIO_SENSOR5, GPIO_SENSOR6, GPIO_SENSOR7, GPIO_MPX_CLOCK, GPIO_MPX_DATA, GPIO_MPX_LATCH }
#define GPIO_OUTPUT_PINS { GPIO_POWER_LED }

/**********************************************************************
 * DEVICE INFORMATION
 * 
 * Because of NMEA's closed standard, most of this is fiction. Maybe it
 * can be made better with more research. In particular, even recent
 * releases of the NMEA function and class lists found using Google
 * don't discuss anchor systems, so the proper values for CLASS and
 * FUNCTION in this application are not known.  At the moment they are
 * set to 25 (network device) and 130 (PC gateway).
 * 
 * INDUSTRY_GROUP we can be confident about (4 says maritime). However,
 * MANUFACTURER_CODE is only allocated to subscribed NMEA members and,
 * unsurprisingly, an anonymous code has not been assigned: 2046 is
 * currently unused, so we adopt that.  
 * 
 * MANUFACTURER_CODE and UNIQUE_NUMBER together must make a unique
 * value on any N2K bus and an easy way to achieve this is just to
 * bump the unique number for every software build and this is done
 * automatically by the build system.
 */
#define DEVICE_CLASS 75
#define DEVICE_FUNCTION 130
#define DEVICE_INDUSTRY_GROUP 4
#define DEVICE_MANUFACTURER_CODE 2046
#define DEVICE_UNIQUE_NUMBER 849

/**********************************************************************
 * PRODUCT INFORMATION
 * 
 * This poorly structured set of values is what NMEA expects a product
 * description to be shoe-horned into.
 */
#define PRODUCT_CERTIFICATION_LEVEL 1
#define PRODUCT_CODE 002
#define PRODUCT_FIRMWARE_VERSION "1.1.0 (Jun 2022)"
#define PRODUCT_LEN 1
#define PRODUCT_N2K_VERSION 2101
#define PRODUCT_SERIAL_CODE "002-849" // PRODUCT_CODE + DEVICE_UNIQUE_NUMBER
#define PRODUCT_TYPE "SIM108"
#define PRODUCT_VERSION "1.0 (Mar 2022)"

/**********************************************************************
 * Include the build.h header file which can be used to override any or
 * all of the above  constant definitions.
 */
#include "build.h"



#define DEFAULT_SOURCE_ADDRESS 22         // Seed value for source address claim
#define INSTANCE_UNDEFINED 255            // Flag value
#define STARTUP_SETTLE_PERIOD 5000        // Wait this many ms after boot before entering production
#define SWITCH_PROCESS_INTERVAL 250       // Process switch inputs every n ms
#define LED_MANAGER_HEARTBEAT 200         // Number of ms on / off
#define LED_MANAGER_INTERVAL 10           // Number of heartbeats between repeats

/**********************************************************************
 * NMEA transmit configuration. Modules that transmit PGN 127501 are
 * required to report switch bank state every four seconds, or
 * immediately on a detected state change.
 */
#define TRANSMIT_INTERVAL 4000UL    // N2K defined fastest allowed transmit rate for a PGN instance

/**********************************************************************
 * Declarations of local functions.
 */
#ifdef DEBUG_SERIAL
void dumpSensorConfiguration();
#endif
void messageHandler(const tN2kMsg&);

void processSensorsMaybe();
bool instanceInUse(unsigned int ignoreIndex, unsigned char instance);

void transmitPgn130316(Sensor sensor, bool flash = true);

/**********************************************************************
 * PGNs of messages transmitted by this program.
 * 
 * PGN 127501 Binary Status Report.
 */
const unsigned long TransmitMessages[] PROGMEM={ 127501L, 0 };

/**********************************************************************
 * PGNs of messages handled by this program.
 * 
 * There are none.
 */
typedef struct { unsigned long PGN; void (*Handler)(const tN2kMsg &N2kMsg); } tNMEA2000Handler;
tNMEA2000Handler NMEA2000Handlers[]={ {0, 0} };

/**********************************************************************
 * DIL_SWITCH switch decoder.
 */
int ENCODER_PINS[] = GPIO_ENCODER_PINS;
DilSwitch DIL_SWITCH (ENCODER_PINS, ELEMENTCOUNT(ENCODER_PINS));

/**********************************************************************
 * DEBOUNCER for the switch inputs.
 */
int SWITCHES[DEBOUNCER_SIZE] = { GPIO_SENSOR0, GPIO_SENSOR1, GPIO_SENSOR2, GPIO_SENSOR3, GPIO_SENSOR4, GPIO_SENSOR5, GPIO_SENSOR6, GPIO_SENSOR7 };
Debouncer DEBOUNCER (SWITCHES);

/**********************************************************************
 * LED_MANAGER for all system LEDs.
 */
LedManager LED_MANAGER (LED_MANAGER_HEARTBEAT, LED_MANAGER_INTERVAL);

unsigned char INSTANCE = INSTANCE_UNDEFINED;

/**********************************************************************
 * SID for clustering N2K messages by sensor process cycle.
 */
unsigned char SID = 0;

/**********************************************************************
 * MAIN PROGRAM - setup()
 */
void setup() {
  #ifdef DEBUG_SERIAL
  Serial.begin(9600);
  delay(DEBUG_SERIAL_START_DELAY);
  #endif

  // Set the mode of all digital GPIO pins.
  int ipins[] = GPIO_INPUT_PINS;
  int opins[] = GPIO_OUTPUT_PINS;
  for (unsigned int i = 0 ; i < ELEMENTCOUNT(ipins); i++) pinMode(ipins[i], INPUT_PULLUP);
  for (unsigned int i = 0 ; i < ELEMENTCOUNT(opins); i++) pinMode(opins[i], OUTPUT);
  
  // We assume that a new host system has its EEPROM initialised to all
  // 0xFF. We test by reading a byte that in a configured system should
  // never be this value and if it indicates a scratch system then we
  // set EEPROM memory up in the following way.
  //
  // Address | Value                                    | Size in bytes
  // --------+------------------------------------------+--------------
  // 0x00    | N2K source address                       | 1
  // 0x10    | Sensor configuration (the SENSORS array) | Lots
  //
  //EEPROM.write(SOURCE_ADDRESS_EEPROM_ADDRESS, 0xff);
  if (EEPROM.read(SOURCE_ADDRESS_EEPROM_ADDRESS) == 0xff) {
    EEPROM.write(SOURCE_ADDRESS_EEPROM_ADDRESS, DEFAULT_SOURCE_ADDRESS);
  }

  // Recover module instance number.
  DIL_SWITCH.sample();
  INSTANCE = DIL_SWITCH.value();

  tN2kBinaryStatus BANK_STATUS;
  N2kResetBinaryStatus(BANK_STATUS);


  // Initialise and start N2K services.
  NMEA2000.SetProductInformation(PRODUCT_SERIAL_CODE, PRODUCT_CODE, PRODUCT_TYPE, PRODUCT_FIRMWARE_VERSION, PRODUCT_VERSION);
  NMEA2000.SetDeviceInformation(DEVICE_UNIQUE_NUMBER, DEVICE_FUNCTION, DEVICE_CLASS, DEVICE_MANUFACTURER_CODE);
  NMEA2000.SetMode(tNMEA2000::N2km_ListenAndNode, EEPROM.read(SOURCE_ADDRESS_EEPROM_ADDRESS)); // Configure for sending and receiving.
  NMEA2000.EnableForward(false); // Disable all msg forwarding to USB (=Serial)
  NMEA2000.ExtendTransmitMessages(TransmitMessages); // Tell library which PGNs we transmit
  NMEA2000.SetMsgHandler(messageHandler);
  NMEA2000.Open();
}

/**********************************************************************
 * MAIN PROGRAM - loop()
 * 
 * With the exception of NMEA2000.parseMessages() all of the functions
 * called from loop() implement interval timers which ensure that they
 * will mostly return immediately, only performing their substantive
 * tasks at intervals defined by program constants.
 * 
 * The global constant JUST_STARTED is used to delay acting on switch
 * inputs until a newly started system has stabilised and the GPIO
 * inputs have been debounced.
 */ 
void loop() {
  static bool JUST_STARTED = true;

  if (JUST_STARTED && (millis() > STARTUP_SETTLE_PERIOD)) {
    #ifdef DEBUG_SERIAL
    Serial.println();
    Serial.print("Starting. N2K Source address is "); Serial.print(NMEA2000.GetN2kSource()); Serial.println();
    #endif
    JUST_STARTED = false;
  }

  // Debounce all switch inputs.
  DEBOUNCER.debounce();

  // Before we transmit anything, let's do the NMEA housekeeping and
  // process any received messages.
  NMEA2000.ParseMessages();

  // The above call may have resulted in acquisition of a new source
  // address, so we check if there has been a change and if so save the
  // new address to EEPROM for future re-use.
  if (NMEA2000.ReadResetAddressChanged()) EEPROM.update(SOURCE_ADDRESS_EEPROM_ADDRESS, NMEA2000.GetN2kSource());

  if (!JUST_STARTED) processSwitchInputsMaybe();

  // Update the states of connected LEDs
  LED_MANAGER.loop();
}

/**********************************************************************
 * processSwitchInputsMaybe() should be called directly from loop().
 * The function recovers the current physical sensor states and
 * compares this with the previously read value.
 * function iterates through all sensors looking for any that have an
 * expired transmission. Sunch sensors have their temperature value
 * updated bt a read from the ADC and their index queued for subsequent
 * transmission on the N2K bus.
 */
void processSensorsMaybe() {
  static unsigned long deadline = 0L;
  unsigned long now = millis();
  static unsigned char savedStates = 0x00;
  unsigned char states = 0x00;

  states = DEBOUNCER.getStates();
  if ((savedStates != states) || (now > deadline)) {
    N2kSetStatusBinaryOnStatus(BANK_STATUS, DEBOUNCER.getState(GPIO_SENSOR0), 1);
    N2kSetStatusBinaryOnStatus(BANK_STATUS, DEBOUNCER.getState(GPIO_SENSOR1), 2);
    N2kSetStatusBinaryOnStatus(BANK_STATUS, DEBOUNCER.getState(GPIO_SENSOR2), 3);
    N2kSetStatusBinaryOnStatus(BANK_STATUS, DEBOUNCER.getState(GPIO_SENSOR3), 4);
    N2kSetStatusBinaryOnStatus(BANK_STATUS, DEBOUNCER.getState(GPIO_SENSOR4), 5);
    N2kSetStatusBinaryOnStatus(BANK_STATUS, DEBOUNCER.getState(GPIO_SENSOR5), 6);
    N2kSetStatusBinaryOnStatus(BANK_STATUS, DEBOUNCER.getState(GPIO_SENSOR6), 7);
    N2kSetStatusBinaryOnStatus(BANK_STATUS, DEBOUNCER.getState(GPIO_SENSOR7), 8);


    deadline = (now + TRANSMIT_INTERVAL);
  }
}




  for (unsigned int sensor = 0; sensor < ELEMENTCOUNT(SENSORS); sensor++) {
    if (SENSORS[sensor].getInstance() != 0xff) {
      if (now > SENSORS[sensor].getTransmissionDeadline()) {
        if (!TRANSMIT_QUEUE.isFull()) {
          int value = analogRead(SENSORS[sensor].getGpio());
          double kelvin = ((value * SENSOR_VOLTS_TO_KELVIN) / ANALOG_RESOLUTION) * 100;
          SENSORS[sensor].setTemperature(kelvin);
          #ifdef DEBUG_SERIAL
          Serial.println();
          Serial.print("Queueing reading for sensor "); Serial.print(sensor + 1); Serial.print(": ");
          Serial.print(kelvin - 273.0); Serial.print("C ");
          #endif
          TRANSMIT_QUEUE.enqueue(sensor);
        } else {
          #ifdef DEBUG_SERIAL
          Serial.println("ERROR: cannot queue sensor reading; transmit queue is full");
          #endif
        } 
        SENSORS[sensor].setTransmissionDeadline(now + SENSORS[sensor].getTransmissionInterval());
      }
    }
  }
  SID++;
}

/**********************************************************************
 * processProgrammeSwitchMaybe() should be called directly from loop().
 * The function uses an elapse timer to ensure that processing is only
 * invoked once every SWITCH_PROCESS_INTERVAL milliseconds.
 * 
 * The function will then checkpoint the debounced state of the switch
 * on the GPIO_PROGRAMME_SWITCH pin and, if it is active, will call
 * performMachineStateTransition() to modify the device's
 * MACHINE_STATE.
 */
void processProgrammeSwitchMaybe() {
  static unsigned long deadline = 0UL;
  unsigned long now = millis();
  if (now > deadline) {
    if (DEBOUNCER.channelState(GPIO_PROGRAMME_SWITCH) == 0) {
      DIL_SWITCH.sample();
      MACHINE_STATE = performMachineStateTransition(MACHINE_STATE);
    }
    deadline = (now + SWITCH_PROCESS_INTERVAL);
  }
}

/**********************************************************************
 * processTransmitQueue() should be called directly from loop. The
 * function uses an elapse timer to ensure that processing is only
 * invoked once every MINIMUM_TRANSMIT_CYCLE milliseconds. This value
 * should be set to the maximum transmit frequencyy for PGN130316.
 * 
 * Each time around the function removes a sensor index (if one is
 * available) from TRANSMIT_QUEUE and transmits the referenced sensor
 * data over the NMEA bus.
 */ 
void processTransmitQueueMaybe() {
  static unsigned long deadline = 0UL;
  unsigned long now = millis();

  if (now > deadline) {
    if (!TRANSMIT_QUEUE.isEmpty()) {
      int sensor = TRANSMIT_QUEUE.dequeue();
      #ifdef DEBUG_SERIAL
      Serial.println(); Serial.print("Dequeueing and transmitting sensor "); Serial.print(sensor + 1);
      #endif
      transmitPgn130316(SENSORS[sensor]);
    }
    deadline = (now + MINIMUM_TRANSMIT_CYCLE);
  }
}

/**********************************************************************
 * performConfigurationTimeoutMaybe() should be called directly from
 * loop(). The function uses an elapse timer to detect whether or not
 * module configuration should be cancelled because of an absence of
 * user input and the module returned to normal operation.
 */
void performConfigurationTimeoutMaybe() {
  if ((CONFIGURATION_TIMEOUT_COUNTER != 0UL) && (millis() > CONFIGURATION_TIMEOUT_COUNTER)) {
    MACHINE_STATE = performMachineStateTransition(CANCEL_CONFIGURATION);
  }
}

/**********************************************************************
 * cancelConfigurationTimeout() is a utility function that simply
 * zeroes CONFIGURATION_TIMEOUT_COUNTER so that a configuration
 * timeout processing is disabled. The function always returns a NORMAL
 * machine state value. 
 */
MACHINE_STATES cancelConfigurationTimeout() {
  CONFIGURATION_TIMEOUT_COUNTER = 0UL;
  return(NORMAL);
}

/**********************************************************************
 * extendConfigurationTimeout(state) is a utility function that simply
 * sets CONFIGURATION_TIMEOUT_COUNTER to its operational value. The
 * function always returns <state>.
 */
MACHINE_STATES extendConfigurationTimeout(MACHINE_STATES state) {
  CONFIGURATION_TIMEOUT_COUNTER = (millis() + CONFIG_TIMEOUT_INTERVAL);
  return(state);
}

/**********************************************************************
 * performMachineStateTransition(state) performs all of the processing
 * required to transition from <state> to some new machine state which
 * it returns as its result.
 * 
 * As a side effect, this function implements all of the UI associated
 * with configuration change and any consequent actions.
 */
MACHINE_STATES performMachineStateTransition(MACHINE_STATES state) {
  static int selectedSensorIndex = 0;
  unsigned char selectedValue = DIL_SWITCH.value();
  Sensor scratch;

  switch (state) {
    case NORMAL: // Start configuration process
      switch (selectedValue) {
        case 1 : case 2: case 3: case 4: case 5: case 6: case 7: case 8:
          LED_MANAGER.operate(GPIO_POWER_LED, 0, 1);
          selectedSensorIndex = selectedValue;
          state = extendConfigurationTimeout(CHANGE_CHANNEL_INSTANCE);
          LED_MANAGER.operate(GPIO_INSTANCE_LED, 0, -1);
          #ifdef DEBUG_SERIAL
          Serial.print("Starting configuration dialoge for channel "); Serial.println(selectedSensorIndex + 1);
          #endif
          break;
        case 32:
          // Dump configuration
          LED_MANAGER.operate(GPIO_POWER_LED, 0, 1);
          dumpSensorConfiguration();
          confirmDialogCompletion(1);
          break;
        case 64:
          // Transmit test outout on all channels
          LED_MANAGER.operate(GPIO_POWER_LED, 0, 1);
          for (unsigned int i = 0; i < ELEMENTCOUNT(SENSORS); i++) {
            scratch.setInstance(i); scratch.setSource(i); scratch.setSetPoint(i); scratch.setTemperature(i);
            transmitPgn130316(scratch, false);
            delay(MINIMUM_TRANSMIT_CYCLE);
            #ifdef DEBUG_SERIAL
            Serial.print("Transmitting test PGN130316 with instance "); Serial.println(i);
            #endif
          }
          break;
        case 128: 
          // Foctory reset - delete all channel configurations
          LED_MANAGER.operate(GPIO_POWER_LED, 0, 1);
          for (unsigned int i = 0; i < ELEMENTCOUNT(SENSORS); i++) {
            SENSORS[i].setInstance(255);
            SENSORS[i].save(SENSORS_EEPROM_ADDRESS + (i * SENSORS[i].getConfigSize()));
          }
          state = cancelConfigurationTimeout();
          #ifdef DEBUG_SERIAL
          Serial.println("Deleting all channel configurations");
          #endif
          break;
        default:
          // Unrecognised entry
          LED_MANAGER.operate(GPIO_POWER_LED, 0, 2);
          #ifdef DEBUG_SERIAL
          Serial.println("Ignoring invalid entry");
          #endif
          break;
      }
      break;
    case CHANGE_CHANNEL_INSTANCE:
      switch (selectedValue) {
        case 255:
          // Disable channel configuration
          LED_MANAGER.operate(GPIO_POWER_LED, 0, 1);
          SENSORS[selectedSensorIndex].setInstance(selectedValue);
          SENSORS[selectedSensorIndex].save(SENSORS_EEPROM_ADDRESS + (selectedSensorIndex * SENSORS[selectedSensorIndex].getConfigSize()));
          state = cancelConfigurationTimeout();
          #ifdef DEBUG_SERIAL
          Serial.print("Channel "); Serial.print(selectedSensorIndex + 1); Serial.print(": deleting configuration");
          dumpSensorConfiguration();
          #endif
          break;
        case 254: case 253:
          // Invalid entry
          LED_MANAGER.operate(GPIO_POWER_LED, 0, 2);
          state = extendConfigurationTimeout(CHANGE_CHANNEL_INSTANCE);
          #ifdef DEBUG_SERIAL
          Serial.print("Rejecting invalid temperature instance");
          #endif
          break;
        default:
          // Accept valid instance value
          if (!instanceInUse(selectedSensorIndex, selectedValue)) { 
            LED_MANAGER.operate(GPIO_POWER_LED, 0, 1);
            SENSORS[selectedSensorIndex].setInstance(selectedValue);
            state = extendConfigurationTimeout(CHANGE_CHANNEL_SOURCE);
            LED_MANAGER.operate(GPIO_INSTANCE_LED, 1);
            LED_MANAGER.operate(GPIO_SOURCE_LED, 0, -1);
            #ifdef DEBUG_SERIAL
            Serial.print("Channel "); Serial.print(selectedSensorIndex + 1); Serial.print(": temperature instance set to ");
            Serial.println(SENSORS[selectedSensorIndex].getInstance());
            #endif
          } else {
            LED_MANAGER.operate(GPIO_POWER_LED, 0, 3);
            state = extendConfigurationTimeout(CHANGE_CHANNEL_INSTANCE);
            #ifdef DEBUG_SERIAL
            Serial.print("Rejecting duplicate temperature instance");
            #endif
          }
          break;
      }
      break;
    case CHANGE_CHANNEL_SOURCE:
      if ((selectedValue <= 14) || ((selectedValue >= 129) && (selectedValue <= 252))) {
        LED_MANAGER.operate(GPIO_POWER_LED, 0, 1);
        SENSORS[selectedSensorIndex].setSource(selectedValue);
        state = extendConfigurationTimeout(CHANGE_CHANNEL_SETPOINT);
        LED_MANAGER.operate(GPIO_SOURCE_LED, 1);
        LED_MANAGER.operate(GPIO_SETPOINT_LED, 0, -1);
        #ifdef DEBUG_SERIAL
        Serial.print("Channel "); Serial.print(selectedSensorIndex + 1); Serial.print(": temperature source set to ");
        Serial.println(SENSORS[selectedSensorIndex].getSource());
        #endif
      } else {
        LED_MANAGER.operate(GPIO_POWER_LED, 0, 2);
        state = extendConfigurationTimeout(CHANGE_CHANNEL_SOURCE);
        #ifdef DEBUG_SERIAL
        Serial.print("Rejecting invalid temperature source");
        #endif
      }
      break;
    case CHANGE_CHANNEL_SETPOINT:
      LED_MANAGER.operate(GPIO_POWER_LED, 0, 1);
      SENSORS[selectedSensorIndex].setSetPoint((double) (selectedValue * 2));
      state = extendConfigurationTimeout(CHANGE_CHANNEL_INTERVAL);
      LED_MANAGER.operate(GPIO_SETPOINT_LED, 1);
      LED_MANAGER.operate(GPIO_INTERVAL_LED, 0, -1);
      #ifdef DEBUG_SERIAL
      Serial.print("Channel "); Serial.print(selectedSensorIndex + 1); Serial.print(": temperature set point set to ");
      Serial.println(SENSORS[selectedSensorIndex].getSetPoint());
      #endif
      break;
    case CHANGE_CHANNEL_INTERVAL:
      if (((unsigned long) 1000UL * selectedValue) >= MINIMUM_TRANSMIT_INTERVAL) {
        LED_MANAGER.operate(GPIO_POWER_LED, 0, 1);
        SENSORS[selectedSensorIndex].setTransmissionInterval((unsigned long) (selectedValue * 1000UL));
        SENSORS[selectedSensorIndex].save(SENSORS_EEPROM_ADDRESS + (selectedSensorIndex * SENSORS[selectedSensorIndex].getConfigSize()));
        state = cancelConfigurationTimeout();
        confirmDialogCompletion(1);
        #ifdef DEBUG_SERIAL
        Serial.print("Channel "); Serial.print(selectedSensorIndex + 1); Serial.print(": transmission interval set to ");
        Serial.println(SENSORS[selectedSensorIndex].getTransmissionInterval());
        Serial.print("Channel "); Serial.print(selectedSensorIndex + 1); Serial.println(": saving configuration");
        dumpSensorConfiguration();
        #endif
      } else {
        LED_MANAGER.operate(GPIO_POWER_LED, 0, 2);
        state = extendConfigurationTimeout(CHANGE_CHANNEL_INTERVAL);
        #ifdef DEBUG_SERIAL
        Serial.print("Rejecting invalid transmission interval");
        #endif
      }
      break;
    case CANCEL_CONFIGURATION:
      // Restore in-memory configuration from EEPROM and return to
      // normal operation.
      #ifdef DEBUG_SERIAL
      Serial.println("Discarding configuration changes, restoring previous configuration");
      dumpSensorConfiguration();
      #endif
      SENSORS[selectedSensorIndex].load(SENSORS_EEPROM_ADDRESS + (selectedSensorIndex * SENSORS[selectedSensorIndex].getConfigSize()));
      state = cancelConfigurationTimeout();
      confirmDialogCompletion(0);
      break;
    default:
      break;
  }
  return(state);
}

/**********************************************************************
 * instanceInUse() scans the SENSORS array, excluding the sensor
 * defined by <ignoreIndex>, looking for any sensor using <instance> as
 * its instance address. Returns true if a sensor is found, otherwise
 * false.
 */
bool instanceInUse(unsigned int ignoreIndex, unsigned char instance) {
  bool retval = false;
  for (unsigned int i = 0; i < ELEMENTCOUNT(SENSORS); i++) {
    if ((ignoreIndex != 255) && (i != ignoreIndex))
      if (SENSORS[i].getInstance() == instance)
        retval = true;
  }
  return(retval);
}

void confirmDialogCompletion(int flashes) {
      LED_MANAGER.operate(GPIO_INSTANCE_LED, 0, flashes);
      LED_MANAGER.operate(GPIO_SOURCE_LED, 0, flashes);
      LED_MANAGER.operate(GPIO_SETPOINT_LED, 0, flashes);
      LED_MANAGER.operate(GPIO_INTERVAL_LED, 0, flashes);
}

/**********************************************************************
 * Transmit the temperature data in <sensor> over the host NMEA bus and
 * update the power and status LEDs. 
 */
void transmitPgn127501(unsigned char instance, tN2kBinaryStatus status, bool flash) {
  tN2kMsg N2kMsg;
  SetN2kPGN127501(N2kMsg, instance, status);
  NMEA2000.SendMsg(N2kMsg);
  if (flash) LED_MANAGER.operate(GPIO_POWER_LED, 0, 1);
}  

/**********************************************************************
 * Field an incoming NMEA message to our defined handler (there aren't
 * any!).
 */
void messageHandler(const tN2kMsg &N2kMsg) {
  int iHandler;
  for (iHandler=0; NMEA2000Handlers[iHandler].PGN!=0 && !(N2kMsg.PGN==NMEA2000Handlers[iHandler].PGN); iHandler++);
  if (NMEA2000Handlers[iHandler].PGN != 0) {
    NMEA2000Handlers[iHandler].Handler(N2kMsg); 
  }
}

#ifdef DEBUG_SERIAL

void dumpSensorConfiguration() {
  for (unsigned int i = 0; i < ELEMENTCOUNT(SENSORS); i++) {
    Serial.println();
    Serial.print("Sensor "); Serial.print(i + 1); Serial.print(": ");
    SENSORS[i].dump(Serial);
  }
}

#endif
