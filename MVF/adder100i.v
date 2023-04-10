module adder100i(

    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum

);

    genvar i;

    add1i u0(a[0], b[0], cin, cout[0], sum[0]);

    generate

        for (i = 1 ; i < 100, i = i + 1) begin : add_block
            add1i u0(a[i], b[i], cout[i-1], cout[i], sum[i]);
        end 

    endgenerate 

endmodule

module add1i(

    input a, b, cin,
    output cout, sum

);

    assign cout = a ^ b ^ cin;
    assign sum = ((a ^ b) & cin) | (a & b); // (a & b) | (a & cin) | (b & cin);

endmodule