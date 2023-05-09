module alwaysblock(

    input a, b,
    output wire out_assign,
    output reg out_alwaysblock

);

    assign out_assign = a & b;

    always @(*) begin
        out_alwaysblock <= a & b;
    end

endmodule

module tb;

    reg a, b;
    wire out_alwaysblock, out_assign;

    alwayscombi u0 (.a(a), .b(b), .out_alwaysblock(out_alwaysblock), .out_assign(out_assign));

    
    initial begin

        a = 1'b0;
        b = 1'b1;
        #5

        a = 1'b1;
        b = 1'b0;
        
    end

    initial begin

        $dumpfile("alwayscombi.vcd");
        $dumpvars;

    end

endmodule