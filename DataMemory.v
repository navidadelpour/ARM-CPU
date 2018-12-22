module DataMemory(clock, write, read, input_address, input_data, output_data);
	input clock, write, read;
	input [63:0] input_address, input_data;
	output[63:0] output_data;

	reg [63:0] memory [0:127];


	always @ (posedge clock) begin
	
		if(read)
			output_data = memory[input_address];

		if(write)
			memory[input_address] = input_data;
		
	end

endmodule
 