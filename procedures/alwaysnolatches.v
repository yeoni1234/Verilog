module alwaysnolatches(

    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up


);

    always @(*) begin

        {left, right, up, down} = 4'b0000;

        case(scancode)
            16'he06b : left  = 1;
            16'he072 : down  = 1;
            16'he074 : right = 1;
            16'he075 : up    = 1;

            default : {left, right, up, down} = 4'b0000;
            
            endcase

    end

endmodule