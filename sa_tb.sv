program sa_tb(serial_addr_interface.tb t1);
	initial begin 
		t1.rst<=1;
		t1.cb.a<=4'd0; 
		t1.cb.b<=4'd0;
		#10 t1.rst<=0;
		t1.cb.a<=4'd4; 
		t1.cb.b<=4'd5;
		
		#100 $finish;
	end
endprogram
