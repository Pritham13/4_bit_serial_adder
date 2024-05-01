`timescale 1ns/1ps
`include "top.v"
module top_tb;

    // Inputs
    reg a, b, clk, rst;
    
    // Outputs
    wire [3:0] out;
    
    // Instantiate the Unit Under Test (UUT)
    top uut (
        .a(a),
        .b(b),
        .clk(clk),
        .rst(rst),
        .out(out)
    );
    
    // Initialize clock and reset
    initial begin
        clk = 0;
        rst = 1;
        #10 rst = 0;
    end
    
    // Generate clock
    always #5 clk = ~clk;
    
    // Apply test inputs
    initial begin
        // Test case 1: a = 0101, b = 1010
        a = 1'b0; b = 1'b0;
        #20 a = 1'b0; b = 1'b1;
        #10 a = 1'b0; b = 1'b0;
        #10 a = 1'b1; b = 1'b1;
        #10 a = 1'b0; b = 1'b0;
        
        // Test case 2: a = 1111, b = 1111
        #60 a = 1'b1; b = 1'b1;
        #10 a = 1'b1; b = 1'b1;
        #10 a = 1'b1; b = 1'b1;
        #10 a = 1'b1; b = 1'b1;
        
        // Add more test cases as needed
        
        #100 $finish;
    end
    initial begin
    $dumpfile("top_tb.vcd"); // Specify the desired file name
    $dumpvars(0, top_tb);
	end
    
    // Monitor outputs
    initial begin
        $monitor("a = %b, b = %b, out = %b", a, b, out);
    end

endmodule
