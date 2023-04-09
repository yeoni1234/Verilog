module adder100i(

    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum

);

    assign sum = a ^ b ^ cin;
    assign cout = ((a ^ b) & cin) | (a & b);

endmodule