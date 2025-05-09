# UART Transmitter (8N1) in Verilog – Continuous Name Transmission

This repository contains a Verilog-based UART transmitter designed to send a predefined string (e.g., `"ALICE\n"`) **continuously** over a UART TX line using the **8N1 protocol**. It's ideal for beginner FPGA projects.
---

## Features

- UART 8N1 format: 8 data bits, No parity, 1 stop bit
- Sends your name or any message repeatedly
- Baud rate: **9600** from a 12 MHz internal oscillator
- Easy integration with USB-to-Serial converters
- Minimal logic footprint – FPGA friendly

---

The code is updated in top1.v file for the above given assignment

---
## How It Works
Clock divider: Converts 12 MHz to 9600 Hz using a counter

FSM: Drives character-by-character UART transmission

UART module: Sends start bit, 8 data bits LSB-first, and a stop bit

Loop: Message resets once the null terminator (8'h00) is reached



