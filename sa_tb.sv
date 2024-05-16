program sa_tb(sa_inter.tb t1);
	initial begin 
		t1.rst<=1;
		t1.cb.a<=4'b1000; 
		t1.cb.b<=4'b1111;
		#4 t1.rst<=0;
		#100 $finish;
	end
endprogram
