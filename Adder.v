module Adder #(parameter n = 64) (input_data_1, input_data_2, output_data);
	
	input [n - 1 : 0] input_data_1, input_data_2;
	output[n - 1 : 0] output_data;

	assign output_data = input_data_1 + input_data_2;

endmodule