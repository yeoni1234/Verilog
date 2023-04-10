module bcdadd100(

    input [399:0] a, b,
    input       cin,
    output      cout,
    output [399:0] sum

);

    genvar i;

        add1i u0(a[0], b[0], cin, cout, sum[0]);

    generate 

        for (i = 1; i < 400; i = i +1 ) begin : add_block
            add1i u0(a[i], b[i], cin, cout, sum[i]);
        end

    endgenerate



endmodule

module add1i(

    input a, b, cin,
    output cout, sum


);

    assign cout = a ^ b ^ cin;
    assign sum = ((a ^ b) & cin) | (a & b);

endmodule