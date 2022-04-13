
#ifndef DOOR_SENSOR_H_
#define DOOR_SENSOR_H_

#include <stdio.h>
#include <stdlib.h>
#include "stm32f0xx.h"

/* -------------------------------------------------------------------------------------------------------------
 *  Control and Initialization Functions
 * -------------------------------------------------------------------------------------------------------------
 */

// Sets up the door sensor system
void doorSensor_init(void);

// will return 1 if currently running, 0 otherwise
uint8_t doorSensor_busy(void);

// Tick function for door sensor state machine
void doorSensor_tick(void);

// Tick function for blue heartbeat LED
void blueLED_tick(void);


/* -------------------------------------------------------------------------------------------------------------
 *  Internal-Use Initialization Functions
 * -------------------------------------------------------------------------------------------------------------
 */

void Interrupts_Init(void);

void Timers_Init(void);

void DAC_Init(void);

void GPIO_Init(void);

void State_Init(void);

#endif /* DOOR_SENSOR_H_ */
