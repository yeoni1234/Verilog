module adder3(

    input [2:0] a,
    input [2:0] b,
    input       cin,
    output [2:0] cout,
    output [2:0] sum

);

    wire [2:0] c_w;
    assign c_w = cin;

    full_adder u0(.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c_w[0]));
    full_adder u1(.a(a[1]), .b(b[1]), .cin(c_w[0]), .sum(sum[1]), .cout(c_w[1]));
    full_adder u2(.a(a[2]), .b(b[2]), .cin(c_w[1]), .sum(sum[2]), .cout(c_w[2]));

    assign cout = c_w[2];
    
endmodule