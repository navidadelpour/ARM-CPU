module DataMemory #(parameter n = 64, parameter size = 256) (clock, write, read, input_address, input_data, output_data);
	input clock, write, read;
	input [n - 1 : 0] input_address, input_data;
	output[n - 1 : 0] output_data;

	reg [n - 1 : 0] memory [0 : size - 1];


	always @ (posedge clock) begin
	
		if(read)
			output_data = memory[input_address];

		if(write)
			memory[input_address] = input_data;
		
	end

endmodule
 