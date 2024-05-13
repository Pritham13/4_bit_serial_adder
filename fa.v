module fa(input a,b,rst,clk,
		output reg  [3:0]out);
always @ (posedge rst , posedge clk)
begin
	if (rst)
		begin
			out<=4'd0; 
		end
	else 
		begin
			out<={a+b,out[3:1]};
		end
end
endmodule
