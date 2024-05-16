interface serial_addr_interface(input bit clk);
	logic [3:0} a,b;
	logic rst;
	logic [3:0]out;
	
	clocking cb @(posedge clk);
		default input #2ns output #3ns ;
		input [3:0]op;
		output [3:0]a,b;
	endclocking

	modport tb(clocking cb,output rst);
	
	endinterface

