module shift_register(input d,clk,en,dir,rst,
			output reg [3:0]out);
	always @ (posedge clk)
	if (rst)
		out <=0;
	else begin
		if (en)
			case (dir)
				0:out<={out[2:0],d};
				1:out<={d,out[3:1]};
			endcase
		else
			out<=out;
	end
endmodule
