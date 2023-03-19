module addsub(

    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire cin;
    wire [31:0] b_xor;

    assign b_xor = {32{sub}}^b;

    add16_1(a[15:0], b_xor[15:0], sub, sum[15:0],cin );
    add16_2(a[31:16], b_xor[31:16], cin, sum[31:16]);


endmodule