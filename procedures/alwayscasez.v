module alwayscasez(

    input [7:0] in,
    output reg [2:0] pos 

);

    always @(*) begin

        case (in[7:0])
            4'bzzz1 : pos = 0;
            4'bzz10 : pos = 1;
            4'bzz11 : pos = 2;
            4'bz100 : pos = 3;
            4'bz101 : pos = 4;
            4'bz110 : pos = 5;
            4'bz111 : pos = 6;
            4'b1111 : pos = 7;

            default : pos = 0;

        endcase


    end


endmodule