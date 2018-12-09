module PC(clock, write, reset, oldpc, newpc);
	input clock;
	input write;
	input reset;
	input [63:0] oldpc;
	output reg [63:0] newpc;

	always @ (posedge clock) begin
		
		if(reset) begin
			newpc = 0;
		end
		else if(write) begin
			newpc = oldpc;
		end
	end

endmodule