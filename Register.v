module Register #(parameter n = 64) (clock, reset, new_output, old_output);

	input clock;
	input reset;
	input [n - 1 : 0] new_output;

	output reg [n - 1 : 0] old_output;

	always @ (posedge clock) begin
		
		if(reset == 1)
			old_output = 0;
		else
			old_output = new_output;
	end

endmodule