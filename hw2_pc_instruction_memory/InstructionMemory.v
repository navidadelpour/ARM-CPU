module InstructionMemory(input_address, output_data);

	input [4:0] input_address;

	output reg [63:0] output_data;

	reg [63:0] memory [31:0];
	
	initial begin
		memory[5] = 15;
	end

	always @ (*) begin
		output_data = memory[input_address];
	end
endmodule