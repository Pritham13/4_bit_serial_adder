module fa(input a,b,rst,clk,
		output reg  [3:0]out);
reg sum,carry;
always @ (posedge rst , posedge clk)
begin
	if (rst)
		begin
			{sum,carry}<=2'd0;
			out<=4'd0; 
		end
	else 
		begin
			sum <= a^b^carry;
        		carry <= (a&b)|(b&carry)|(carry&a);
			out<={sum,out[3:1]};
		end
end
endmodule
