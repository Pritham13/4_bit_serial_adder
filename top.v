`include "adder/adder.v"
`include "d_ff.v"
`include "shift_register/shift_register.v"

module top(input a, b, clk, rst,
           output [3:0] out);

    wire [3:0] buff_a, buff_b;
    wire cin ;
    wire  cout, buff_out;

    shift_register uus1(.d(a), .clk(clk), .en(1'b1), .dir(1'b1), .rst(rst), .out(buff_a));
    shift_register uus2(.d(b), .clk(clk), .en(1'b1), .dir(1'b1), .rst(rst), .out(buff_b));
    adder uuadr(.a(buff_a[0]), .b(buff_b[0]), .cin(cin), .sum(buff_out), .c(cout));
    dff uud(.clk(clk), .reset(rst), .d(cout), .q(cin));
    shift_register uus3(.d(buff_out), .clk(clk), .en(1'b1), .dir(1'b1), .rst(rst), .out(out));

endmodule

