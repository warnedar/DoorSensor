# DoorSensor
Authors: Daryl Warner
         Aaron Pettit

Requirements
-------------
Kiel uVision
STMCube32
MATLAB with signal processing toolbox


Part list
-------------
GP2Y0A41SK0F Optical sensor - IR sensor used to detect motion
LM386N - Audio amplifier
LM358P - Op amp used for comparator 
L7805ABV - Linear regulator for power supply
9V battery pack holder - 6x 1.5V AA batters for power.
8 ohm speaker
STM32F072xB discovery kit - micro controller used

SETUP
-------------
Refer to the schematic 'Door_Sensor_Schematic.pdf' for how the circuitry is configured
Refer to 'circuit_example.jpeg' for an image of the system.
STM32_DAC_OUT is connected to pin PA4
STM32_GPIO_IN is connected to pin PA0

To add a custom sound:
The first 1.9 seconds of the given sound file will be converted to a wavetable
Use the matlab script 'mp3_to_WaveTable.m' to generate a C wavetable that can be added to 'door_sensor.c'


To initialize the microcontroller, use the STMCube32 software to initialize the board to default settings
Load the SRC c files into the Core/Src directory STMCube created.
Load the SRC h files into the Core/Inc directory STMCube created.
In uVision, include the added files to the current project
Build and load the system onto the controller






