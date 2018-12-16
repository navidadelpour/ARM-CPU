module PC(clock, write, reset, oldpc, newpc);
	input clock;
	input write;
	input reset;
	input [63:0] oldpc;

	output reg [63:0] newpc;

	always @ (posedge clock) begin
		
		if(reset)
			newpc = 0;
		else if(write)
			newpc = oldpc;
	end

endmodule