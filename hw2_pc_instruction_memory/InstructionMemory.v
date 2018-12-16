module InstructionMemory(input_address, output_data);

	input [4:0] input_address;

	output [63:0] output_data;

	reg [63:0] memory [31:0];
	
	initial begin
		memory[5] = 15;
	end

	assign	output_data = memory[input_address];

endmodule