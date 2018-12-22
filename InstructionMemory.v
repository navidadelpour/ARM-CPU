module InstructionMemory #(parameter size = 256) (input_address, output_data);

	input [63 : 0] input_address;
	output [31 : 0] output_data;

	reg [7 : 0] memory [0 : size - 1];
	
	assign	output_data = {
		memory[input_address],
		memory[input_address + 1],
		memory[input_address + 2],
		memory[input_address + 3]
	};

endmodule