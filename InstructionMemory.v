module InstructionMemory #(parameter size = 2048, parameter pipeline = 0) (input_address, output_data);

	input [63 : 0] input_address;
	output [31 : 0] output_data;

	reg [7 : 0] memory [0 : size - 1];
	
	integer i, j;

	reg [32 * 5 : 0] instructions;

	initial begin

		assign instructions = {
			32'hf84010a6, 32'hf80010a6, 32'h8b040086, 32'hf84000a4, 32'h8b1f03e5
		};

		for (i = 0; i < 2048; i = i + 1)
			memory[i] = 0;

		for (i = 0; i < 5; i = i + 1)
			for (j = 0; j < 4; j = j + 1) begin
				memory[i * (pipeline ? 16 : 4) + j] = instructions[(i * 32) + j * 8 +: 8];
			end
	end

	assign output_data = {
		memory[input_address + 3],
		memory[input_address + 2],
		memory[input_address + 1],
		memory[input_address + 0]
	};

endmodule