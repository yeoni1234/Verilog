module vector100r(

    input [99:0] in,
    output [99:0] out
);

    integer i;

    always @(*) begin

        for(i = 0; i <100; i = i+1) begin

             out[i] = in[99-i];

        end


    end



endmodule

module tb;

    reg [99:0] in;
    wire[99:0] out;

    integer i;

    vector100r u0(.in(in), .out(out));

    initial begin

        $display("in\tout");
        $monitor("%b\t%b", in, out);

    end

    initial begin

        in = 0;

        for(i = 0; i <11; i = i+1) begin
        #10
        in = $random;
        end
    end

endmodule