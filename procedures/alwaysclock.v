module alwaysclock(

    input a, b, clk,

    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff


);

    assign out_assign = a ^ b;
    always @(*) out_always_comb = a ^ b;
    always @(posedge clk) out_always_ff = a ^ b;


endmodule


module tb;

    reg a, b, clk;
    wire out_always_comb, out_always_ff, out_assign;

    alwaysclock u0 (.a(a), .b(b), .out_always_comb(out_always_comb), .out_always_ff(out_always_ff), .out_assign(out_assign));

    initial begin

        a = 1'b0;
        b = 1'b1;
        #5

        a = 1'b1;
        b = 1'b0;


    end


    initial begin

        $dumpfile("alwaysclock.vcd");
        $dumpvars;

    end 
endmodule