module mux2to1v(

    input [99:0] a,
    input [99:0] b,
    input        sel,
    output [99:0] out

);


    always @(*) begin
        case (sel)
            0 : out = a;
            1 : out = b;
            
        endcase

    end

endmodule