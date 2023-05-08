module add32(

    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);


endmodule

module add16(

    input [15:0] a,
    input [15:0] b,
    input        cin,
    output [15:0] sum,
    output       cout

);


module add1(

    input a,
    input b,
    input cin,
    output sum,
    output cout

);

    assign {cout, sum} = a+b+cin;

endmodule




/*
module fadd(

    input [31:0] a,
    input [31:0] b,
    output [31:0] sum

);

    wire o1, o2;


    add16_1(a[15:0], b[15:0], 0, sum[15:0], o1);
    add16_2(a[31:16], b[31:16], o1, sum[31:16], o2); 

endmodule   


module add1 (input a, input b, input Cin, output sum, output Cout);

    assign sum = a^b^Cin;
    assign cout = (a&b) | (a&Cin) | (b&Cin);

endmodule
*/

