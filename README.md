# Skill_lab_fpga
# RVCE FPGA Workshop Repo (Summary)
Welcome to the repository for the RVCE-Workshop on FPGA,UART AND RISC-V. This repo contains all the source codes and the details of the workshop conducted by [Kunal Ghosh](https://www.linkedin.com/in/kunal-ghosh-vlsisystemdesign-com-28084836/).
### Team Members: Aviral, Bhini

We used VSDSquadron FPGA Mini to achieve the above objectives.
## VSDSquadron FPGA Mini(About the Board)
The VSDSquadron FPGA Mini (often referred to as "FM Mini") is a compact, low-cost FPGA-based prototyping board designed primarily for semiconductor and VLSI education, as well as rapid prototyping in the open-source hardware community.

### **Key features:**
- 32-bit QingKe RISC-V2A processor core
- Supports 2 levels of interrupt nesting
- Up to 48MHz system clock frequency
- 16KB Flash memory
- 2KB SRAM
- Operates at 3.3V or 5V supply voltage
- Multiple low-power modes: Sleep, Standby


### Objectives:

1. FPGA VDI Installation
   This covers setting up the VDI environment on an FPGA board, preparing it for development and testing of hardware projects.We installed ORACLE virtualbox for creating a virtual machine which helped us further execute the experiments.

2. Communicate via UART using `picocom`.

3. LED Blinking and UART Loopback
   A hands-on introduction to digital I/O with FPGA: blinking an LED helps verify GPIO control, while UART and UART loopback demonstrate serial communication and data verification.
4. Real-time Sensor Data Acquisition or DPLL
   Involves capturing and processing sensor signals using FPGA in real-time or implementing a Digital Phase-Locked Loop (DPLL) for timing synchronization in digital systems.
***
### Requirements:
Installing, cloning and running the projects.
### Cloning the Github Repository:
```
https://github.com/avicodster/skilllab_FPGA.git
cd skilllab_FPGA
```
### **Clean Previous Builds**

Before starting a new build, clean old files using:

```sh
sudo make clean
```

This removes any previous bitstream files.
### **Build the FPGA Bitstream**

To **synthesize the design and generate the bitstream**, run:

    sudo make build
### **Flash the FPGA**

Once the bitstream is built, upload it to the FPGA using:

```sh
    sudo make flash
```
This step is to be repeated always so that the board is reporgrammed and the current program is only executed on the board.
***
### Usage of Each project:
####  LED Blinking
```
cd led_blinking
make flash
```
Demo Output:

https://github.com/user-attachments/assets/6a583282-d703-44f7-b7d0-fa15cee8a5ca


***
####  UART Loopback
```
cd uart_loopback
make flash
sudo make terminal
```
Demo Output:

https://github.com/user-attachments/assets/3390f781-607c-4522-95af-d2eded0188c9


***
###  UART Transmission with logic analyzer
The Saleae Logic 2 software with a logic analyzer connected to an FPGA-based project (Mini VDSquadron Mini) to monitor UART (serial) communication.
# Mini VDSquadron UART Transmission Test

This repository contains a basic UART transmission implementation on the **Mini VDSquadron Mini FPGA** board. The project demonstrates how to send repeated UART characters (`0x4D` or `'M'`) from the FPGA and observe them using the **Saleae Logic Analyzer**.

---

## Project Overview

- **Board**: Mini VDSquadron Mini (FPGA)
- **Interface**: UART (Async Serial)
- **Tool Used**: Saleae Logic 2 for signal capture and decoding
- **Transmission**: Repeated `'M'` characters (`0x4D`) on TX line
- **Channels Observed**: D0 (TX), others idle

---

## How It Works

1. The FPGA is programmed to send the character `'M'` over UART at fixed time intervals.
2. Saleae Logic Analyzer captures the waveform on the TX line (Channel D0).
3. Async Serial analyzer decodes the signal as UART and displays the data.
4. The output shows repeated transmission of `0x4D`, which is ASCII `'M'`.
5. 
## Output
   ![Screenshot (1340)](https://github.com/user-attachments/assets/35ba9f66-a6ae-40ef-a1e2-e42f3ddd0e12)
   ![Screenshot (1342)](https://github.com/user-attachments/assets/8085bf47-9bbf-4626-9e8c-a3b08960a40b)

---

####  Real Time Sensor Data Acquisition and Transmission System
It shows an output in numeric telling us how far the optject is from the ultrasonic sensor implemented using the FPGA
```
    git clone https://github.com/Skandakm29/Real-Time-Sensor-Data-Acquisition-and-Transmission-System.git
    cd "Real-Time-Sensor-Data-Acquisition-and-Transmission-System"
    make build
    sudo make flash
    sudo make terminal
```
Terminal window:
![{CEF982DB-66ED-48A7-8803-8BA215701DE4}](https://github.com/user-attachments/assets/cc20299f-f05e-40c1-ad3e-8c67db8e5c99)

Demo Output:

https://github.com/user-attachments/assets/4b63e907-3421-464c-b139-ec8c128850d0


### Issues faced
```
sudo: picocom: command not found
make: *** [Makefile:27: terminal] Error 1
```
### Issue fixed by:
We need to install 'picocom' using the below commands:
```
sudo apt update
sudo apt install picocom
```
***

## Acknowledgment  

I would like to express my gratitude to:  

- **[Kunal Ghosh](https://www.linkedin.com/in/kunal-ghosh-vlsisystemdesign-com-28084836/)** for his valuable contributions to open-source VLSI education and FPGA learning resources.  
- **[K M Skanda](https://www.linkedin.com/in/k-m-skanda-541a02291/)** for helping me learn and execute the above projects and providing the required source codes to implent in the VSDSquadron FPGA mini.

## Connect with me
**LinkedIn:** [Bhini Singh](www.linkedin.com/in/bhini-singh-281030262/)

**Email:** [bhinisingh2003@gmail.com]
