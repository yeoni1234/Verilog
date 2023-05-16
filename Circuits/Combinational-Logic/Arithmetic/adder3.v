module adder3(

    input [2:0] a,
    input [2:0] b,
    input       cin,
    output [2:0] cout,
    output [2:0] sum

);

    

    adder u0(.a(a[0]), .b(b[0]), .cin(cin),     .sum(sum[0]), .cout(cout[0]));
    adder u1(.a(a[1]), .b(b[1]), .cin(cout[0]), .sum(sum[1]), .cout(cout[1]));
    adder u2(.a(a[2]), .b(b[2]), .cin(cout[1]), .sum(sum[2]), .cout(cout[2]));

    
    
endmodule

module adder(
    input a,
    input b,
    input cin,
    output cout,
    output sum

);

    assign {cout, sum} = a + b + cin;

endmodule

module tb;

    reg [2:0] a;
    reg [2:0] b;
    reg      cin;
    wire [2:0] cout;
    wire [2:0] sum;

    adder3 u0(.a(a), .b(b), .cin(cin), .cout(cout), .sum(sum));

    integer i;

    initial begin
        $display("a\tb\tcin\tcout\tsum");
        $monitor("%b\t%b\t%b\t%b\t%b", a, b, cin, cout, sum);

    end

    initial begin

        a   = 0;
        b   = 0;
        cin = 0;
      
        for (i = 0; i <16; i = i + 1) begin 
            #10
            a = $random;
            b = $random;
            cin = $random;
        end
    end 

    initial begin
        $dumpfile("adder3.vcd");
        $dumpvars;
    end
endmodule