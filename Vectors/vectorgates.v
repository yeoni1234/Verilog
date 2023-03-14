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


module tb;
    reg a, b;
    wire out_or_bitwise, out_or_logical, out_not;

    vectorgates u0 (.a(a), .b(b), .out_not(out_not), .out_or_bitwise(out_or_bitwise), .out_or_logical(out_or_logical));

    initial begin
        a = 1'b0;
        b = 1'b0;  
    end


    initial begin
        $monitor("%b", out_or_bitwise);
        $monitor("%b", out_or_logical);
        $monitor("%b", out_not);
        $finish;
    end

endmodule