module add(

    input[31:0] a,
    input[31:0] b,
    output[31:0] sum
);

    wire Cin;
    wire Cout;

    add16 adder_1( a[15:0], b[15:0], 0, sum[15:0] ,Cin);
    add16 adder_2( a[31:16], b[31:16], Cin, sum[31:16] ,Cout);

endmodule


/*
module add16 (
    input   [15 : 0]    a,
    input   [15 : 0]    b,
    input               cin,
    output  [15 : 0]    sum,
    output              cout
);

    assign {cout, sum} = a + b + cin;

endmodule
*/