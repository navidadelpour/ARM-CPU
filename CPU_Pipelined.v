`default_nettype none

module CPU_Pipelined ();

    wire clock, EX_zero_alu, MEM_zero_alu, MEM_unconditional_branch, ID_unconditional_branch, EX_unconditional_branch, MEM_unconditional_branch;

    wire reg_to_loc, ID_alu_src, ID_mem_to_reg, ID_reg_write, ID_mem_read, ID_mem_write, ID_branch, ID_alu_op_1, ID_alu_op_0;

    wire EX_alu_src, EX_mem_to_reg, EX_reg_write, EX_mem_read, EX_mem_write, EX_branch, EX_alu_op_1, EX_alu_op_0;

    wire MEM_mem_to_reg, MEM_reg_write, MEM_mem_read, MEM_mem_write, MEM_branch;

    wire WB_mem_to_reg, WB_reg_write;

    wire [63 : 0] ID_reg_data_1, EX_reg_data_1;
    wire [63 : 0] ID_reg_data_2, EX_reg_data_2, MEM_reg_data_2;

    wire [63 : 0] ID_output_sign_extend, EX_output_sign_extend;

    wire [63 : 0] EX_output_alu, MEM_output_alu, WB_output_alu;


    wire [63 : 0] EX_output_shift_unit_adder, MEM_output_shift_unit_adder;

    wire [3 : 0] alu_opcode;
    wire [4 : 0] output_register_bank_multiplexer, EX_instruction_4_0, MEM_instruction_4_0, WB_instruction_4_0;
    wire [31 : 0] ID_instruction, IF_instruction;

    wire [10 : 0] EX_instruction_31_21;

    wire [63 : 0] IF_old_pc, ID_old_pc, EX_old_pc, new_pc, output_pc_adder, MEM_output_data_memory, WB_output_data_memory,  output_alu_multiplexer, WB_input_data_register, output_shift_unit;

    reg pc_reset;

    initial begin
        pc_reset = 1; 
        #100 pc_reset = 0;
    end

    Clock clock_1(clock);


    // IF STAGE

    Multiplexer pc_multiplexer (
        .input_data_1(output_pc_adder),
        .input_data_2(EX_output_shift_unit_adder),
        .input_select((MEM_branch & MEM_zero_alu) | MEM_unconditional_branch),
        .output_data(new_pc)
    );

    Register pc_1 (   
        .clock(clock),
        .reset(pc_reset),
        .new_output(new_pc),
        .old_output(IF_old_pc)
    );

    Adder pc_adder (
        .input_data_1(IF_old_pc),
        .input_data_2(64'b100),
        .output_data(output_pc_adder)
    );

    InstructionMemory #(.pipeline(1)) instruction_memory (
        .input_address(IF_old_pc), 
        .output_data(IF_instruction)
    );

    Register #(.n(96)) IF_ID (
        .clock(clock),
        .reset(pc_reset),
        .new_output({IF_old_pc, IF_instruction}),
        .old_output({ID_old_pc, ID_instruction})
    );

    // ID STAGE

    ControlUnit control_unit (
        .instruction_part(ID_instruction[31 : 21]),
        .Reg2Loc(reg_to_loc), 
        .ALUSrc(ID_alu_src), 
        .MemtoReg(ID_mem_to_reg), 
        .RegWrite(ID_reg_write),
        .MemRead(ID_mem_read), 
        .MemWrite(ID_mem_write), 
        .Branch(ID_branch), 
        .ALUOp1(ID_alu_op_1),
        .ALUOp0(ID_alu_op_0),
        .unconditional_branch(ID_MEM_unconditional_branch)
    );

    Multiplexer # (.n(5)) register_bank_multiplexer (
        .input_data_1(ID_instruction[20 : 16]),
        .input_data_2(ID_instruction[4 : 0]),
        .input_select(reg_to_loc),
        .output_data(output_register_bank_multiplexer)
    );

    RegisterBank register_bank (
        .clock(clock),
        .write(WB_reg_write),
        .input_address_1(ID_instruction[9 : 5]),
        .input_address_2(output_register_bank_multiplexer),
        .input_address_3(WB_instruction_4_0),
        .input_data(WB_input_data_register),
        .output_data_1(ID_reg_data_1),
        .output_data_2(ID_reg_data_2)
    );

    SignExtend sign_extend (
        .instruction(ID_instruction), 
        .output_data(ID_output_sign_extend)
    );

    Register #(.n(280)) ID_EX (
        .clock(clock),
        .reset(pc_reset),
        .new_output({
            ID_unconditional_branch,
            ID_reg_write, ID_mem_to_reg,              // WB
            ID_branch, ID_mem_read, ID_mem_write,     // M
            ID_alu_op_0, ID_alu_op_1, ID_alu_src      // EX
            , ID_old_pc, ID_reg_data_1, ID_reg_data_2, ID_output_sign_extend, ID_instruction[31 : 21], ID_instruction[4 : 0]}),
        .old_output({
            EX_unconditional_branch,
            EX_reg_write, EX_mem_to_reg,              // WB
            EX_branch, EX_mem_read, EX_mem_write,     // M
            EX_alu_op_0, EX_alu_op_1, EX_alu_src      // EX
            , EX_old_pc, EX_reg_data_1, EX_reg_data_2, EX_output_sign_extend, EX_instruction_31_21, EX_instruction_4_0})
   );

    // EX STAGE

    ALUControl alu_control_unit (
        .ALUOp0(EX_alu_op_0),
        .ALUOp1(EX_alu_op_1),
        .instruction_part(EX_instruction_31_21),
        .operation_code(alu_opcode)
    );

    Multiplexer alu_multiplexer(
        .input_data_1(EX_reg_data_2),
        .input_data_2(EX_output_sign_extend),
        .input_select(EX_alu_src),
        .output_data(output_alu_multiplexer)
    );

    ALU alu (
        .input_data_1(EX_reg_data_1),
        .input_data_2(output_alu_multiplexer),
        .input_opcode(alu_opcode),
        .output_data(EX_output_alu),
        .output_zero(EX_zero_alu)
    );

    ShiftUnit shift_unit (
        .input_data(EX_output_sign_extend), 
        .output_data(output_shift_unit)
    );

    Adder shift_unit_adder(
        .input_data_1(EX_old_pc),
        .input_data_2(output_shift_unit),
        .output_data(EX_output_shift_unit_adder)
    );

    Register #(.n(203)) EX_MEM (
        .clock(clock),
        .reset(pc_reset),
        .new_output({
            EX_unconditional_branch,
            EX_reg_write, EX_mem_to_reg,              // WB
            EX_branch, EX_mem_read, EX_mem_write     // M
            , EX_output_shift_unit_adder, EX_zero_alu, EX_output_alu, EX_reg_data_2, EX_instruction_4_0}),
        .old_output({
            MEM_unconditional_branch,
            MEM_reg_write, MEM_mem_to_reg,              // WB
            MEM_branch, MEM_mem_read, MEM_mem_write     // M
            , MEM_output_shift_unit_adder, MEM_zero_alu, MEM_output_alu, MEM_reg_data_2, MEM_instruction_4_0})
    );

    // MEM STAGE

    DataMemory data_memory (
        .clock(clock), 
        .write(MEM_mem_write), 
        .read(MEM_mem_read), 
        .input_address(MEM_output_alu), 
        .input_data(MEM_reg_data_2),
        .output_data(MEM_output_data_memory)
    );

    Register #(.n(135)) MEM_WB (
        .clock(clock),
        .reset(pc_reset),
        .new_output({
            MEM_reg_write, MEM_mem_to_reg              // WB
            , MEM_output_data_memory, MEM_output_alu, MEM_instruction_4_0}),
        .old_output({
            WB_reg_write, WB_mem_to_reg              // WB
            , WB_output_data_memory, WB_output_alu, WB_instruction_4_0})
    );


    // WB STAGE

    Multiplexer data_memory_multiplexer (
        .input_data_1(WB_output_alu),
        .input_data_2(WB_output_data_memory),
        .input_select(WB_mem_to_reg),
        .output_data(WB_input_data_register)
    );

endmodule