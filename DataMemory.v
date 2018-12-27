module DataMemory #(parameter size = 256) (clock, write, read, input_address, input_data, output_data);
	input clock, write, read;
	input [63 : 0] input_address, input_data;
	output[63 : 0] output_data;

	integer i;

	reg [7 : 0] memory [0 : size - 1];

	assign output_data = read ? {
		memory[input_address + 7],
		memory[input_address + 6],
		memory[input_address + 5],
		memory[input_address + 4],
		memory[input_address + 3],
		memory[input_address + 2],
		memory[input_address + 1],
		memory[input_address + 0]
	} : 64'bz;

	initial begin
		for(i = 0; i < size - 1; i = i + 1)
			memory[i] = 7;

	end

	always @ (posedge clock) begin

		if(write) begin
			memory[input_address + 7] = input_data[63 : 56];
			memory[input_address + 6] = input_data[55 : 48];
			memory[input_address + 5] = input_data[47 : 40];
			memory[input_address + 4] = input_data[39 : 32];
			memory[input_address + 3] = input_data[31 : 24];
			memory[input_address + 2] = input_data[23 : 16];
			memory[input_address + 1] = input_data[15 : 8];
			memory[input_address + 0] = input_data[7 : 0];
		
		end
	end

endmodule
 