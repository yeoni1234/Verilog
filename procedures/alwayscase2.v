module alwayscase2(
   
    input [3:0] in,
    output reg [1:0] pos 
);

    always @(*) begin

        case (in[3:0])
            /*
            4'b0000 : pos = in[0];
            4'b0001 : pos = in[1];
            4'b0010 : pos = in[2];
            4'b0011 : pos = in[3];
            */
            in[0] ==1'b1 : pos = 0;
            in[1] ==1'b1 : pos = 1;
            in[2] ==1'b1 : pos = 1;
            in[3] ==1'b1 : pos = 1;

            default : pos = 2'b00;
        endcase

    end

endmodule

         