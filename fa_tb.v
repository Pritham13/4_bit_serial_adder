`include "fa.v"
module fa_tv();

reg a,b,rst,clk;
wire [3:0]out;

fa inst1 (.a(a),.b(b),.rst(rst),.clk(clk),.out(out));
initial 
begin
$dumpfile("fa_tb.vcd");
$dumpvars;
end
initial 
begin
	clk=0;
	rst=1;
	a=1;
	b=1;
	#10
	rst=0;
	a=1;
	b=0;#10
	a=1;
	b=1;#10
	$finish;
end
always
begin
clk = ~clk ;#5;
end
endmodule
