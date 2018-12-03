module TestBenchRegisters(A, B);
	reg write;
	reg [4:0] a, b;
	output [63:0] A, B;
	wire [4:0] c;
	wire [63:0]C;


	clock cc(clk);
	RegisterDataGenerator rdg(c, C);
	RegisterBank rb( clk, a, b, c, C, write, A, B);


	always @ (posedge clk)
	begin
		write <= 1;
	end
endmodule