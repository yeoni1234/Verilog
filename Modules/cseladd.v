module cseladd(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [15:0] cin;
    wire [15:0] cout;
    wire [15:0] s1, s2;

    add16   (a[15:0], b[15:0], 0, sum[15:0], cin);
    add16_1 (a[31:16], b[31:16], 0, s1, cout);
    add16_2 (a[31:16], b[31:16], 1, s2, cout);

    always @ (cout, s1, s2) begin

        if      (cout == 0) sum [31:16] = s1;
        else if (cout == 1) sum [31:16] = s2;

    end

    
endmodule