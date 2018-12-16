module Clock (clock);

	output reg clock;

	always
		begin 
			#100 clock = 1;
			#100 clock = 0;
  		end

endmodule
