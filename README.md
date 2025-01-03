# Automated Irrigation System using IoT

## Overview

This project focuses on creating an automated irrigation system to help farmers manage water usage effectively in agricultural fields. The system uses various IoT components to monitor soil moisture and rainfall and controls irrigation accordingly. It ensures optimal water usage, preventing over-irrigation and promoting sustainable farming practices. The system is based on a master-slave topology using ESP32 and NodeMCU ESP8266, integrated with soil moisture sensors, rain sensors, and relay-controlled motors.

## Table of Contents
1. [Introduction](#introduction)
2. [Hardware Requirements](#hardware-requirements)
3. [Software Requirements](#software-requirements)
4. [System Architecture](#system-architecture)
5. [How It Works](#how-it-works)
6. [Setup Instructions](#setup-instructions)
7. [Circuit Diagram](#circuit-diagram)
8. [Mobile App Integration](#mobile-app-integration)
9. [Contributors](#contributors)
10. [License](#license)

## Introduction

Agriculture plays a crucial role in human civilization. However, traditional irrigation practices often result in inefficient water usage and crop damage due to over-watering. This automated irrigation system uses IoT technology to monitor soil moisture levels and rain conditions to determine when and how much water should be applied. The system minimizes water wastage and optimizes plant health, reducing human intervention.

## Hardware Requirements

- **NodeMCU ESP 8266**: An open-source microcontroller with built-in Wi-Fi, ideal for IoT applications.
- **Relay Module**: Used to control motors by switching the circuits on/off based on low-level signals from the microcontroller.
- **Soil Moisture Sensor**: Measures the water content in the soil to determine whether the irrigation system needs to be activated.
- **Jumper Wires**: Used to make connections between different hardware components.
- **Rain Sensor**: Detects rainfall, adjusting irrigation schedules based on weather conditions.
- **Sprinkler System**: Used for distributing water to the crops.
- **ESP32**: A more advanced microcontroller that acts as the master controller, managing multiple slave NodeMCUs.
- **Laptop/PC**: Required for app development, database management, and integration with Firebase.

## Software Requirements

- **Flutter**: Used for developing the cross-platform mobile application (iOS & Android).
- **Firebase**: Provides real-time database services for storing and managing user inputs and sensor data.
- **Arduino IDE**: Used for programming the ESP32 and NodeMCU.
  
## System Architecture

The system is based on a **master-slave** architecture. The **master** is an ESP32, while the **slaves** are NodeMCU ESP8266 boards. Each slave controls a relay connected to a motor, which in turn controls the water flow to different sections of the field. The sensors collect data and send it to the master for analysis and control decisions.

- **Master (ESP32)**: Monitors sensors, manages the irrigation schedule, and communicates with the mobile app.
- **Slaves (NodeMCU ESP8266)**: Control the relays that activate or deactivate the motors based on commands from the master.
- **Sensors**: Soil moisture and rain sensors monitor the field’s irrigation needs.

## How It Works

1. **User Setup**: The user selects the crop (e.g., Wheat), sets the irrigation interval (e.g., every 21 days), and specifies the irrigation duration (e.g., 1 hour).
   
2. **Soil Moisture Monitoring**: Soil moisture sensors continuously monitor the soil's moisture levels. If the moisture content is below a threshold, the system will activate irrigation.

3. **Rain Sensor**: If it rains, the rain sensor adjusts the irrigation schedule, preventing unnecessary watering.

4. **Mobile Application**: The user interacts with the system via a mobile app built using **Flutter**. The app allows users to set the irrigation schedule and monitor sensor data in real-time.

5. **Automatic Control**: The system automatically triggers irrigation based on the moisture levels and rain sensor inputs, ensuring optimal water usage and crop health.

## Setup Instructions

1. **Hardware Setup**:
   - Connect the **soil moisture sensor** to the NodeMCU or ESP32.
   - Attach **relay modules** to the NodeMCU to control motors.
   - Position the **rain sensor** appropriately to detect rainfall.
   - Connect the **sprinklers** to the relay-controlled motors.
   
2. **Software Setup**:
   - Install the **Arduino IDE** and **Flutter SDK**.
   - Set up **Firebase** for real-time data storage.
   - Program the **ESP32** and **NodeMCU** using Arduino IDE.
   - Develop the mobile app using **Flutter** to control and monitor the system.
   
3. **Mobile App Setup**:
   - The user can input irrigation schedules and receive real-time data on soil moisture and rain status.
   - Download the app on iOS or Android devices, and sync it with the Firebase database.

## Circuit Diagram

![Circuit Diagram]([path/to/circuit-diagram.png](https://github.com/nixx210/Automatic-Irrigation-System/blob/main/Sample%20SS/WhatsApp%20Image%202022-10-15%20at%2010.35.55%20AM.jpeg))

This diagram shows the connections between the sensors, relays, motors, and microcontrollers (ESP32 and NodeMCU).

## Mobile App Integration

The mobile app is developed using **Flutter**, allowing users to set up irrigation schedules, monitor soil moisture levels, and receive notifications when irrigation or rain events occur. It communicates with the Firebase real-time database to store and retrieve user settings and sensor data.

![Mobile App Interface](path/to/app-interface.png)


