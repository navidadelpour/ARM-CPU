module ControlUnit (
    instruction,
    Reg2Loc, ALUSrc, MemtoReg, RegWrite,
    MemRead, MemWrite, Branch, ALUOp1, ALUOp0
);

    input [31:0] instruction;
    output reg Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0;
    wire [8:0] value;

    always @ (instruction) begin
    
        casex(instruction[31:21])
            11'b1xx0101x000: value = 9'b000100010;
            11'b11111000010: value = 9'bx11110000;
            11'b11111000000: value = 9'b11x001000;
            11'b10110100xxx: value = 9'b10x000101;
        endcase

        {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0} == value
    end

endmodule