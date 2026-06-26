# Wishbone-Compliant SPI Master Core Verification Environment

[cite_start]This repository contains a robust, structured **UVM (Universal Verification Methodology) Verification Environment** for the open-source **SPI Master Core** IP (originally designed by Simon Srot, OpenCores)[cite: 1, 2, 6]. [cite_start]The core serves as a bridge, acting as a WISHBONE compliant slave interface on the host processor side while driving an industry-standard full-duplex synchronous SPI serial interface on the peripheral side[cite: 33, 34, 37].

---

## 1. IP Specification & Architectural Overview

[cite_start]The Design Under Test (DUT) features a fully synthesizable, single-clock-domain synchronous serial data controller[cite: 40, 41]. 

### Key Features Summary:
* [cite_start]**Full-Duplex Operation:** Simultaneous synchronous serial transmit and receive paths[cite: 37].
* [cite_start]**Flexible Payload Length:** Word transfers can be dynamically varied from 1 bit up to a maximum length of 128 bits[cite: 37, 125, 129].
* [cite_start]**Configurable Clock & Phase:** Independent configuration for transmitting (Tx) and sampling (Rx) on either the rising or falling edges of the serial clock line (`sclk_pad_o`)[cite: 39, 56].
* [cite_start]**Bit Ordering:** Supports both MSB-first and LSB-first data transaction serialization formats[cite: 38].
* [cite_start]**Multi-Slave Support:** Includes 8 dedicated hardware slave-select lines (`ss_pad_o`) with optional automatic hardware assert/de-assert generation logic[cite: 39, 56, 98].

### Register Address Map
[cite_start]All registers are strictly 32-bit wide and require full 32-bit word bus transactions[cite: 69].

| Register Name | Relative Offset | Access Type | Description |
| :--- | :--- | :--- | :--- |
| **DATA_0** | `32'h00` | Read / Write | [cite_start]Shared hardware space for Rx0 (Read) and Tx0 (Write)[cite: 67, 78]. |
| **DATA_1** | `32'h04` | Read / Write | [cite_start]Shared hardware space for Rx1 (Read) and Tx1 (Write)[cite: 67, 78]. |
| **DATA_2** | `32'h08` | Read / Write | [cite_start]Shared hardware space for Rx2 (Read) and Tx2 (Write)[cite: 67, 78]. |
| **DATA_3** | `32'h0c` | Read / Write | [cite_start]Shared hardware space for Rx3 (Read) and Tx3 (Write)[cite: 67, 78]. |
| **CTRL** | `32'h10` | Read / Write | [cite_start]Control and status configuration register[cite: 67]. |
| **DIVIDER** | `32'h14` | Read / Write | [cite_start]System clock-to-serial clock divider ratio configuration[cite: 67, 135]. |
| **SS** | `32'h18` | Read / Write | [cite_start]Target Slave Select line configurations[cite: 67]. |

---

## 2. Verification Environment Architecture

The environment relies on an advanced, layered UVM structure engineered to cross-validate software configuration streams against hardware-level pin assertions.

### Verification Layer Components:
* **Wishbone Master Agent (Active):** Drives custom 32-bit configurations and data payloads directly into the register bus interface of the DUT.
* **SPI Slave Agent (Passive/Reactive):** Emulates downstream peripheral targets. It dynamically monitors `ss_pad_o` and `sclk_pad_o`, reactively shifting responsive data streams onto the `miso_pad_i` pin based on real-time configuration contexts.
* **UVM Register Layer (RAL):** Integrates an automated Python CSV-generated register block hierarchy containing custom explicit mapping, handling volatile hardware registers (`GO_BSY`), and managing shared Tx/Rx memory arrays safely.
* **Scoreboard & Predictor:** Tracks reference models across boundaries, automatically cross-checking data read from the Wishbone host against raw bit streams monitored off the SPI physical wires.

---

## 3. Test Plan & Functional Coverage Roadmap

To achieve absolute functional verification closure, our sequences focus on targeting high-priority hardware corner cases:

### Key Test Scenarios:
1. [cite_start]**The Two-Step Configuration Constraint:** Validating that register options are strictly updated with the `GO_BSY` bit cleared, before initiating serial transfers on a distinct subsequent cycle[cite: 121].
2. [cite_start]**Shared Flip-Flop Integrity:** Testing back-to-back operations to verify that un-updated data transmit configurations seamlessly fall back to recirculating previously captured incoming data streams[cite: 193].
3. [cite_start]**Word Boundary Conditions:** Iterating over character frame extremes ranging cleanly from minimum 1-bit cycles up to max-payload 128-bit bursts[cite: 125, 129].
4. [cite_start]**SPI Mode Crosses:** Cross-coverage checking of all 4 permutations of clock polarity driving/sampling edges paired against MSB vs LSB ordering variants[cite: 38, 39].
