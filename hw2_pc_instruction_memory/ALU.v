module ALU(a, b, c, out, zero);
	input [63:0] a;
	input [63:0] b;
	input [3:0] c;
	output reg[63:0] out;
	output reg[63:0] zero;

	always @ (*) begin
		zero = 0;
		case(c)
			4'b0010: out = a + b;
		default
			out = 0;
		endcase
	end
endmodule
