module RegisterDataGenerator(data_address, data_value);
	output reg[4:0] data_address;
	output reg[63:0] data_value;
	reg [4:0]i;
	clock clock1(clk);
	initial begin
		i = 0;
	end
	always @(posedge clk)
	begin
		i = i + 1;
		data_address <= i;
		data_value <= i;
	end
endmodule