`include "fa.v"
module top( input [3:0]a,b,
		input rst,clk,
		output [3:0]out);

reg [3:0]count=4'd0;
reg buff_a,buff_b;

fa fa_inst(.a(buff_a),.b(buff_b),.rst(rst),.clk(clk),.out(out));
always@(posedge rst,posedge clk)
begin
	if (rst)
	begin
		// out<=4'd0;
		count<=4'd0;
		buff_a<=4'd0;
		buff_b<=4'd0;
	end
	else
	begin
		count<= count +4'd1;
		if(count<=4'd3)
		begin
			buff_a<=a[count];
			buff_b<=b[count];
		end	
		else 
			count<=4'd0;
		
	end

end
endmodule
