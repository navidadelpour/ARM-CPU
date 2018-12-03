module RegisterBank (clk, a, b, c, C, write, A, B);

	input clk;
	input write;
	input [4:0] a, b, c;
	input [63:0] C;
	output [63:0] A, B;
	reg [63:0] registers [31:0];

	assign A = registers[a];
	assign B = registers[b];

	always @ (posedge clk)
	begin
		if(write)
			registers[c] <= C;
	end
endmodule
	 

