module TestBenchRegisters(output_data_1, output_data_2);

	output [63:0] output_data_1, output_data_2;
	
	reg write;
	reg [4:0] input_address_1, input_address_2;
	wire [4:0] input_address;
	wire [63:0]output_data;


	Clock clock_1(clock);

	RegisterDataGenerator register_data_generator(input_address, output_data);

	RegisterBank register_bank(
		clock, write
		input_address_1, input_address_2, input_address, output_data,
		output_data_1, output_data_2
	);


	always @ (posedge clock)
	begin
		write = 1;
	end

endmodule