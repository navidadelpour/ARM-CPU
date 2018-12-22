module PC #(parameter n = 64) (clock, reset, oldpc, newpc);

	input clock;
	input write;
	input reset;
	input [n - 1 : 0] oldpc;

	output reg [n - 1 : 0] newpc;

	always @ (posedge clock) begin
		
		if(reset)
			newpc = 0;
		else
			newpc = oldpc;
	end

endmodule