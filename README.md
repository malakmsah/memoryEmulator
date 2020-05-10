# CE 723 Advanced Digital Design

# Laboratory Assignment 5: Memory Emulator

Student Name: Student ID:
April 27, 2020

# 1 Objectives

- Describe synchronous circuits in Verilog
- Generate Testbenches for synchronous circuits

# 2 Design Activity

Random Access Memory Emulator:The circuit shown is a memory with 8 addresses, where each address holds
4-bits of data. The memory positions are implemented by 4-bit registers. Theresetnandclocksignals are shared
by all the registers. Data is written onto (or read from) one of the registers. Memory has two main operations as
follows:

- Memory Write(wr_rd=1): The 4-bit inputDinis written into one register. Theaddress[2:0]signal selects the
    register to be written to. Here, the 7-segment display must show 0. Example: ifaddress= “101”, thenDinis
    written into register 5.
- Memory Read(wr_rd=0): The MUX output appears on the 7-segment display (a hexadecimal value). The
    address[2:0]signal selects the register from which data is read. For example, ifaddress= “010”, then data in
    register 2 appears on the 7-segment display. If data in register 2 is “1010”, then the symbol ‘A’ appears on the
    7-segment display.



# 3 Vivado Design Flow

Strictly follow the following order:

```
1.Create a new Vivado Project selecting the Nexus 4 DDR platform or appropriate Artix-7 Device.
2.Write the Verilog code for the given circuit. Create a separate file for: 1) Register with enable, 2) MUX with
enable, 3) decoder with enable, 4) HEX-to-7 segments decoder, and 5) top file
3.Write the Verilog testbench to test at least 8 writes into memory and 8 reads from memory. You will need to
generate a 100 MHz clock for your simulations.
4.Perform Functional Simulation and Timing Simulation.Demonstrate this to your TA.
5.Implement your design (Run Implementation).Demonstrate this to your TA.
6.I/O Assignment: in the Nexys-4, use SW0 to SW7 for the inputs (Din,address, andwr_rd), CLK100MHz for the
inputclock, BTNC forresetn, and seven segment display signals hooked up same as previous labs.
7.Generate and download the bitstream on the FPGA and test.Demonstrate this to your TA.
```
# 4 Deliverables

You will need to submit in the Canvas assignment (as a .zip file) the generated files: the Verilog code and Verilog
testbench. DO NOTsubmit the whole Vivado Project. In addition, you need to upload a copy of this document
signed and dated by the TA onON ALL PAGES.

# TA signature: Date:



