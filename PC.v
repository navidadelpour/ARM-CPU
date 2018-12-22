module PC #(parameter n = 64) (clock, reset, newpc, oldpc);

	input clock;
	input reset;
	input [n - 1 : 0] newpc;

	output reg [n - 1 : 0] oldpc;

	always @ (posedge clock) begin
		
		if(reset)
			oldpc = 0;
		else
			oldpc = newpc;
	end

endmodule