module bcdadd4(

    input [15:0] a,
    input [15:0] b,
    input        cin,
    output [15:0] sum,
    output       cout
);

    wire [4:0] c_w;
    assign c_w[0] = cin;

    bcd_fadd u0(.a(a[3:0]),   .b(b[3:0]),   .cin(c_w[0]),  .sum(sum[3:0]),   .cout(c_w[1]));
    bcd_fadd u1(.a(a[7:4]),   .b(b[7:4]),   .cin(c_w[1]),  .sum(sum[7:4]),   .cout(c_w[2]));
    bcd_fadd u2(.a(a[11:8]),  .b(b[11:8]),  .cin(c_w[2]),  .sum(sum[11:8]),  .cout(c_w[3]));
    bcd_fadd u3(.a(a[15:12]), .b(b[15:12]), .cin(c_w[3]),  .sum(sum[15:12]), .cout(c_w[4]));

    assign cout = c_w[4];

endmodule

