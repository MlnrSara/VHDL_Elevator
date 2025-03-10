# Elevator Finite State Machine (FSM) - VHDL Implementation

## Overview
This project implements an elevator control system as a **hardware finite state machine (FSM)** using **VHDL**. The system is designed to operate an elevator in a **P+12** floor hotel, responding to both **internal** and **external** requests while considering movement direction and safety conditions.

## Features
- **Handles up to 13 floors (Ground + 12 Levels)**
- **Prioritizes requests based on movement direction**
- **Processes both internal and external requests**
- **Prevents movement if weight limit is exceeded**
- **Doors remain open for a configurable time interval**
- **Obstacle detection prevents doors from closing**
- **Two selectable speed modes: 1 sec/floor or 3 sec/floor**

## System Architecture
### 1. **Finite State Machine (FSM)**
The system is controlled by an FSM that:
- Accepts and stores floor requests.
- Determines the optimal movement path.
- Controls door operation.
- Manages safety checks (weight limit, door obstacles).

### 2. **Main Components**
- **Control Unit (CU):** Determines movement logic and processes input requests.
- **Execution Unit (EU):** Handles movement, timing, and displays.
- **Sensors & Inputs:** Floor buttons, weight sensor, obstacle sensor.
- **Actuators & Outputs:** Motor control, LED indicators, 7-segment display.

## Inputs & Outputs
### **Inputs:**
- Floor request buttons (internal/external)
- Direction selection (up/down)
- Weight sensor
- Door obstacle sensor
- Reset button
- Time selection switch (door open duration: 1s or 3s)
- Speed selection switch (1s/floor or 3s/floor)

### **Outputs:**
- LED indicators for **door status, movement, and safety conditions**
- **7-segment display** showing the current floor
- Motor control signals for elevator movement

## Usage Instructions
1. **Power on the system** – The elevator starts at the ground floor with open doors.
2. **Enter a floor request** (internal or external button press).
3. **Elevator processes requests based on direction** and executes movement.
4. **If an obstacle or weight limit is detected**, movement is halted.
5. **Doors open for a set duration**, then close before moving to the next request.
6. **Process repeats until all requests are completed.**

Developed by **Denisa Mariș & Sara Molnar** | May 29, 2023

