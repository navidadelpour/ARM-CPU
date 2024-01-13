# ARM-CPU Project

We are computer engineering students from **Kharazmi University of Tehran**. This project was undertaken as part of the **Digital Design Laboratory** during the Fall 2018 semester, under the guidance of Professor **Laali** (@mlaali).

Our Team:
- **Saleh Bayat** (@saleh26)
- **Navid Adelpour** (@navidadelpour)

In this project, we implemented a simple ARM CPU using the **Verilog** hardware description language. Our work draws inspiration from the book **"Computer Organization and Design: The Hardware/Software Interface"** by **David A. Patterson**.

## Technical Information

We utilized various modules for assembling the CPU in both the One-Cycle and Pipeline configurations:

- **Adder:** Simple adder
- **ALU:** Simple ALU with essential operations
- **ALUControl:** ALU Control Unit
- **Clock:** Basic clock module
- **ControlUnit:** Controls the functionality of other modules
- **DataMemory:** Data cache (D-cache)
- **InstructionMemory:** Instruction cache (I-cache)
- **Multiplexer:** 2-to-1 multiplexer
- **Register:** Basic register holding data
- **RegisterBank:** Collection of 32 registers
- **ShiftUnit:** Shifts data by 2
- **SignExtend:** Extends 32-bit input data to 64 bits
- **CPU:** One-Cycle CPU
- **CPU_Pipelined:** Pipelined CPU

These modules collectively form the ARM CPU, serving educational purposes in the context of digital design and computer organization. The implementation aligns with the concepts presented in the referenced book.