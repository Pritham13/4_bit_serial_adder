`include "sa_inter.sv"
`include "sa_tb.sv"
`include "sa.v"

module top_sa();
	bit clk=0;
	always #5 clk=~clk;

	sa_inter i1(clk);
	sa_tb inst1(i1.tb);
        sa dut(.*);

	initial begin 
        $dumpfile("sa.vcd");
        $dumpvars;
        //$monitor($time, "rst = %d, j = %d, k = %d, q = %d",I1.rst,I1.j, I1.k, I1.q);
    end

endmodule

