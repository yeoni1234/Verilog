`timescale 10ns/1ns

module alwayscase2(
   
    input [3:0] in,
    output reg [1:0] pos 
);

    always @(*) begin // combi

        casex (in)
            
            4'bxxx1 : pos = 2'b00;
            4'bxx1x : pos = 2'b01;
            4'bx1xx : pos = 2'b10;
            4'b1xxx : pos = 2'b11;
                     
           
            default : pos = 2'b00;
        endcase

    end

endmodule

module tb;

    reg [3:0] in;
    wire [1:0] pos;

    alwayscase2 u0(.in(in), .pos(pos));

    initial begin

        in = 4'b0000;
        #5
        in = 4'b0001;
        #5
        in = 4'b0010;
        #5
        in = 4'b0011;
        #5
        in = 4'b0100;
         #5
        in = 4'b0101;
         #5
        in = 4'b0110;
         #5
        in = 4'b0111;
         #5
        in = 4'b1000;
         #5
        in = 4'b1001;
         #5
        in = 4'b1010;
         #5
        in = 4'b1011;
         #5
        in = 4'b1100;
         #5
        in = 4'b1101;
         #5
        in = 4'b1110;
         #5
        in = 4'b1111;
         

        $finish;
    end

    initial begin

        $dumpfile("alwayscase2.vcd");
        $dumpvars;

    end
endmodule
         