module SignExtend(clock, instruction, output);

	input clock;
	input [31:0] instruction;
	output reg [63:0] output;
	wire opcode = instruction[31:30];

	always @ (clock) begin
		case(opcode)
			2'b11: output = {{55{instruction[20]}}, instruction[20:12]};
			2'b10: output = {{45{instruction[23]}}, instruction[23:5]};
			2'b00: output = {{38{instruction[25]}}, instruction[25:0]};
		endcase
	end

endmodule