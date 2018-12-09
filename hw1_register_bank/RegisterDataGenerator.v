module RegisterDataGenerator (input_address, output_data);

	output reg [4:0] input_address;
	output reg [63:0] output_data;
	
	reg [4:0]i;
	Clock clock_1(clock);

	initial begin
		i = 0;
	end

	always @(posedge clock) begin
		i = i + 1;
		input_address = i;
		output_data = i;
	end

endmodule