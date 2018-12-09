module InstructionMemory(address, out);
	input [4:0] address;
	output reg [63:0] out;

	reg [63:0] memory [31:0];
	
	initial begin
		memory[5] = 15;
	end

	always @ (*) begin
		out = memory[address];
	end
endmodule