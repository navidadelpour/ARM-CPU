module ALUControl (ALUOp0, ALUOp1, instruction, operation_code);

    input ALUOp0, ALUOp1;
    input [31:0] instruction;
    output reg [3:0] operation_code;

    wire [1:0] ALUOp = {ALUOp1, ALUOp0}

    always @ (ALUOp0, ALUOp1, instruction) begin

        casex(ALUOp)
        
            2'b00: operation_code = 4'b0010;
            2'bx1: operation_code = 4'b0111;
            2'b1x: begin

                casex(instruction[31:21])
                    11'b10001011000: operation_code = 0010;
                    11'b11001011000: operation_code = 0110;
                    11'b10001010000: operation_code = 0000;
                    11'b10101010000: operation_code = 0001;
                endcase

            end

        endcase

    end

endmodule

    
