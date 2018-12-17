module RegisterBank (
	clock, write,
	input_address_1, input_address_2, input_address_3, input_data_3, 
	output_data_1, output_data_2
);

	input clock;
	input write;
	input [4:0] input_address_1, input_address_2, input_address_3;
	input [63:0] input_data_3;
	
	output[63:0] output_data_1, output_data_2;

	reg [63:0] registers [0:31];

	assign output_data_1 = registers[input_address_1];
	assign output_data_2 = registers[input_address_2];

	always @ (posedge clock) begin
		if(write)
			registers[input_address_3] = input_data_3;
	end
endmodule
	 

