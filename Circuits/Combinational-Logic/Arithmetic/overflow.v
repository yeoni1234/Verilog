module overflow(

    input [7:0] a, 
    input [7:0] b,
    output [7:0] s,
    output overflow // cout

);

    assign s = a + b;
    assign overflow = a[7] && b[7] && (~s[7]) || (~a[7]) && (~b[7]) && (s[7]);

endmodule

module tb;

    reg [7:0] a;
    reg [7:0] b;
    wire [7:0] s;
    wire overflow;

    overflow u0(.a(a), .b(b), .s(s), .overflow(overflow) );

    integer i;

    initial begin
        a = 0;
        b = 0;

      for (i = 0; i < 16; i = i +1) begin
        a = $random;
        b = $random;
      end
    end

    initial begin
        $display("a\tb\ts\toverflow");
        $monitor("%b\t%b\t%b\t%b", a, b, s, overflow);
    end
endmodule