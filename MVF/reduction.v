module reduction(

    input [7:0] in,
    output parity

);

    assign parity =  ^in;


endmodule

module tb;

    reg [7:0] in;
    wire parity;

    reduction u0(.in(in), .parity(parity));

    integer i;

    initial begin

        $display("in\tparity");
        $monitor("%d\t%d", in, parity);

    end

    initial begin

        in = 0;
            for(i = 0; i < 10; i = i+1) begin
            #10
            in = $random;
            end
    end 

endmodule