module ControlUnit (
    instruction_part,
    Reg2Loc, ALUSrc, MemtoReg, RegWrite,
    MemRead, MemWrite, Branch, ALUOp1, ALUOp0,
    unconditional_branch
);

    input [10:0] instruction_part;
    output Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0, unconditional_branch;
    reg [8:0] value;

    assign {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0, unconditional_branch} = value;
     

    always @ (instruction_part) begin
    
        casex(instruction_part)
            11'b1xx0101x000: value = 9'b0001000100;
            11'b11111000010: value = 9'b0111100000;
            11'b11111000000: value = 9'b1100010000;
            11'b10110100xxx: value = 9'b1000001010;
            11'b000101xxxxx: value = 9'b0000000001;
            11'b0          : value = 9'b0;
        endcase

    end

endmodule