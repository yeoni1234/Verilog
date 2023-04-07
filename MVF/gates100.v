module gates100(

    input [99:0] in,
    output out_and,
    output out_or,
    output out_xor

);

    assign out_and = &in;
    assign out_or = |in;
    assign out_xor = ^in;


endmodule

module tb;

    reg [99:0] in;
    wire out_and;
    wire out_or;
    wire out_xor;


    gates100 u0(.in(in), .out_and(out_and), .out_or(out_or), .out_xor(out_xor));

    initial begin

        $display("in\tout_and\tout_or\tout_xor");
        $monitor("%d\t%d\t%d\t%d", in, out_and, out_or, out_xor);

    end
endmodule