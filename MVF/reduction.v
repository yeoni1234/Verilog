module reduction(

    input [7:0] in,
    output parity

);

    assign parity =  ^in;


endmodule

/*

    & a[3:0]     // AND: a[3]&a[2]&a[1]&a[0]. Equivalent to (a[3:0] == 4'hf)
    | b[3:0]     // OR:  b[3]|b[2]|b[1]|b[0]. Equivalent to (b[3:0] != 4'h0)
    ^ c[2:0]     // XOR: c[2]^c[1]^c[0]



*/
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