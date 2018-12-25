module InstructionMemory #(parameter size = 256) (input_address, output_data);

	input [63 : 0] input_address;
	output [31 : 0] output_data;

	reg [7 : 0] memory [0 : size - 1];
	
	integer instruction1;
	integer instruction2;
	integer instruction3;
	integer instruction4;

	initial begin

		instruction1 = 32'h8b1f03e5;
		instruction2 = 32'hf84000a4;
		instruction3 = 32'h8b040086;
		instruction4 = 32'hf80010a6;

		{memory[0 + 3], memory[0 + 2], memory[0 + 1], memory[0 + 0]} = 32'h8b1f03e5;
		{memory[4 + 3], memory[4 + 2], memory[4 + 1], memory[4 + 0]} = 32'hf84000a4;
		{memory[8 + 3], memory[8 + 2], memory[8 + 1], memory[8 + 0]} = 32'h8b040086;
		{memory[12 + 3], memory[12 + 2], memory[12 + 1], memory[12 + 0]} = 32'hf80010a6;


	end

	assign output_data = {
		memory[input_address + 3],
		memory[input_address + 2],
		memory[input_address + 1],
		memory[input_address + 0]
	};

endmodule