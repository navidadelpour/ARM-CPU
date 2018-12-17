module adder (input_data_1, input_data_2, output_data);
	
	input [63:0] input_data_1, input_data_2;
	output[63:0] output_data

	assign output_data = input_data_1 + input_data_2;

endmodule