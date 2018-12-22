module CPU ();

    wire clock;

    PC pc_1 (
        .clock(),
        .reset(),
        .oldpc(),
        .newpc()
    );

    Adder (
        .input_data_1(),
        .input_data_2(),
        .output_data()
    );

    InstructionMemory(
        .input_address(), 
        .output_data()
    );

    ControlUnit (
        .instruction(),
        .Reg2Loc(), 
        .ALUSrc(), 
        .MemtoReg(), 
        .RegWrite(),
        .MemRead(), 
        .MemWrite(), 
        .Branch(), 
        .ALUOp1(),
        .ALUOp0()
    );

    Multiplexer (
        .input_data_1(),
        .input_data_2(),
        .input_select(),
        .output_data()
    )

    RegisterBank (
        .clock(),
        .write(),
        .input_address_1(),
        .input_address_2(),
        .input_address_3(),
        .input_data(),
        .output_data_1(),
        .output_data_2()
    );

    SignExtend (
        .instruction(), 
        .output_data()
    );

    ALUControl (
        .ALUOp0(),
        .ALUOp1(),
        .instruction(),
        .operation_code()
    );

    Multiplexer (
        .input_data_1(),
        .input_data_2(),
        .input_select(),
        .output_data()
    );

    ALU (
        .input_data_1(),
        .input_data_2(),
        .input_opcode(),
        .output_data(),
        .output_zero()
    );

    ShiftUnit (
        .input_data(), 
        .output_data()
    );

    Adder (
        .input_data_1(),
        .input_data_2(),
        .output_data()
    );

    AND ();

    Multiplexer (
        .input_data_1(),
        .input_data_2(),
        .input_select(),
        .output_data()
    );

    DataMemory (
        .clock(), 
        .write(), 
        .read(), 
        .input_address(), 
        .input_data(),
        .output_data()
    );

    Multiplexer (
        .input_data_1(),
        .input_data_2(),
        .input_select(),
        .output_data()
    );

endmodule;