module InstructionMemory #(parameter n = 64, parameter size = 256) (input_address, output_data);

	input [n - 1 : 0] input_address;
	output [n - 1 : 0] output_data;

	reg [n - 1 : 0] memory [0 : size - 1];
	
	assign	output_data = memory[input_address];

endmodule