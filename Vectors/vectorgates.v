module vectorgates(

    input [2:0] a, b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);

    assign out_or_bitwise = a | b;
    assign out_or_logical = a||b;
    assign out_not [5:3] = ~b; // bitwise not
    assign out_not [2:0] = ~a;
    

endmodule
