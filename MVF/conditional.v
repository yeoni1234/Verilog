module conditional(

    input [7:0] a, b, c, d,
    output [7:0] min

);

    wire [7:0] min1;
    wire [7:0] min2;


 // assign intermediate_result1 = compare? true: false;
    assign min1 = (a < b) ? a : b;
    assign min2 = (c < d) ? c : d;
    
    assign min = (min1 < min2) ? min1 : min2;





endmodule

module tb;

    reg [7:0] a, b, c, d;
    wire [7:0] min;

    integer i;


    conditional u0(.a(a), .b(b), .c(c), .d(d), .min(min));

    initial begin

        $display("a\tb\tc\td\tmin");
        $monitor("%d\t%d\t%d\t%d\t%d", a, b, c, d, min);
        
    end

    initial begin

        a = 0; b = 0; c = 0; d = 0; 

        for (i = 0; i<16; i = i+1) begin
            #10
            a = $random; b = $random;  c = $random;  d = $random; 

        end
    end

endmodule