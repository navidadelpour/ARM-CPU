module SignExtend(clock, input_data, output_data);
	input clock;	
	input [31:0] input_data;
	output reg [63:0] output_data;
	
	initial begin 
		output_data = 0;
	end

	always @ (posedge clock) begin
		output_data = {{32{input_data[31]}}, input_data};
	end
endmodule