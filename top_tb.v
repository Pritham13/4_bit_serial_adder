`timescale 1ns/1ps
`include "sa.v"
module top_tb;

    // Inputs
    reg [3:0]a, b;
    reg  clk, rst;
    
    // Outputs
    wire [3:0] out;
    
    // Instantiate the Unit Under Test (UUT)
    sa uut (
        .a(a),
        .b(b),
        .clk(clk),
        .rst(rst),
        .out(out)
    );
    
    // Initialize clock and reset
    initial begin
        clk = 1;
        rst = 1;
        #10 rst = 0;
    end
    
    // Generate clock
    always #5 clk = ~clk;
    
    // Apply test inputs
    initial begin
        // Test case 1: a = 0101, b = 1010
        a = 4'd0; b = 4'd0;
        #40 a = 4'd1; b = 4'd2;
        #40 a = 4'd0; b = 4'd1;
        #40 a = 4'd3; b = 4'd2;
        #40 a = 4'd0; b = 4'd0;
                        
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
