//full adder using data-flow modeling
module adder (
    input a,b,cin,
    output sum,c
);

assign sum = a ^ b ^ cin;
assign c = (a & b) | (b & cin)  | (cin & a) ;

endmodule
