module SignExtend(instruction, output_data);

	input [31:0] instruction;
	output reg [63:0] output_data;
	wire opcode = instruction[30];

	always @ (instruction) begin
		case(opcode)
			2'b1: output_data = {{55{instruction[20]}}, instruction[20:12]};
			2'b0: output_data = {{45{instruction[23]}}, instruction[23:5]};
		endcase
	end

endmodule