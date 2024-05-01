`timescale 1ns / 1ps
`include "adder.v"
module testbench;

    // Inputs
    reg a, b, cin;

    // Outputs
    wire sum, c;

    // Instantiate the adder module
    adder dut(
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .c(c)
    );
        initial begin
            $dumpfile("adder_tb.vcd"); // Specify the desired file name
            $dumpvars(0, testbench);
        end
    // Initial stimulus
    initial begin
        // Initialize inputs
        a = 0;
        b = 0;
        cin = 0;

        // Test case 1
        #10 a = 1; b = 0; cin = 0;
        #10 a = 0; b = 1; cin = 0;
        #10 a = 1; b = 1; cin = 0;
        #10 a = 0; b = 0; cin = 1;
        #10 a = 1; b = 0; cin = 1;
        #10 a = 0; b = 1; cin = 1;
        #10 a = 1; b = 1; cin = 1;

        // End simulation
        #10 $finish;
    end

endmodule

