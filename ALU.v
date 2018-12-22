module ALU #(parameter n = 64) (input_data_1, input_data_2, input_opcode, output_data, output_zero);

	input [n - 1 : 0] input_data_1;
	input [n - 1 : 0] input_data_2;
	input [3:0] input_opcode;

	output reg[n - 1 : 0] output_data;
	output reg[n - 1 : 0] output_zero;

	assign output_zero = output_data == 0 ? 1 : 0;

	always @ (input_data_1, input_data_2, input_opcode) begin
		case(input_opcode)
			4'b0010: output_data = input_data_1 + input_data_2;
			4'b0110: output_data = input_data_1 - input_data_2;
			4'b0000: output_data = input_data_1 & input_data_2;
			4'b0001: output_data = input_data_1 | input_data_2;
			4'b0111: output_data = input_data_2;
			4'b1100: output_data = ~(input_data_1 | input_data_2);
		endcase
	end

endmodule
