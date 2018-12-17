module Multiplexer (input_data_1, input_data_2, input_select, output_data);

	input input_select;
	input [63:0] input_data_1, input_data_2;
	output[63:0] output_data;

	assign output_data = input_select ? input_data_2 : input_data_1;

endmodule