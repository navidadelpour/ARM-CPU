module DataMemory(clock, write, input_address, input_data, output_data);
	input clock, write;
	input [63:0] input_address, input_data;
	output[63:0] output_data;

	reg [63:0] memory [127:0];

	assign output_data = memory[input_address];

	always @ (posedge clock) begin
		if(write)
			memory[input_address] = input_data;
			
	end

endmodule
 