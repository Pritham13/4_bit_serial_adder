`include "interface.sv"
`include "sa_tb.sv"
`include "sa.v"

module top_sa();
	bit clk=0;
	always #5 clk=~clk;

	serial_addr_interface i1(clk);
	sa_tb inst1(i1.tb);
        sa dut(.a(i1.a),.b(i1.b),.rst(i1.rst),.clk(i1.clk),.out(i1.out));

	initial begin 
        $dumpfile("sa.vcd");
        $dumpvars;
        //$monitor($time, "rst = %d, j = %d, k = %d, q = %d",I1.rst,I1.j, I1.k, I1.q);
    end

endmodule

