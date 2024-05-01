`timescale 1ns / 1ps

module testbench;

    // Inputs
    reg d, clk, en, dir, rst;

    // Outputs
    wire [3:0] out;

    // Instantiate the module
    shift_register dut(
        .d(d),
        .clk(clk),
        .en(en),
        .dir(dir),
        .rst(rst),
        .out(out)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Initial stimulus
    initial begin
	$dumpfile("waveform.vcd");
        $dumpvars(0, testbench);
        // Initialize inputs
        d = 0;
        clk = 0;
        en = 1;
        dir = 0;
        rst = 1;

        // Reset
        #10 rst = 0;

        // Test case 1
        #10 d = 1; // Input data
        #10 d = 0; // Input data
        #10 d = 1; // Input data
        #10;      // Wait for shift to happen

        // Test case 2
        en = 0;   // Disable shifting
        #10 d = 0; // Input data
        #10;      // Wait without shifting

        // Test case 3
        en = 1;   // Re-enable shifting
        dir = 1;  // Change direction
        #10 d = 1; // Input data
        #10 d = 0; // Input data
        #10 d = 1; // Input data
        #10;      // Wait for shift to happen

        // End simulation
        #10 $finish;
    end

endmodule
	
