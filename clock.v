module Clock (clock);

	output reg clock;

	initial begin
		clock = 0;
	end

	always
		begin 
			#100 clock = 1;
			#100 clock = 0;
  		end

endmodule
