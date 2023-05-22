module adder100(

    input [99:0] a,
    input [99:0] b,
    input        cin,
    output       cout,
    output [99:0] sum

);

    genvar i; // module instance할 때는 generate구문 사용

    wire [98:0] c_w;

    add u1(.a(a[0]), .b(b[0]), .cin(cin),     .cout(c_w[0]), .sum(sum[0]));
    add u2(.a(a[99]), .b(b[99]), .cin(c_w[98]), .cout(cout), .sum(sum[99]));

    
    generate 
        for (i = 1; i <99; i = i+1) begin : fa
            add u0(
                .a(a[i]),
                .b(b[i]),
                .cin(c_w[i-1]),
                .cout(c_w[i]),
                .sum(sum[i])
            );
            

        end
    endgenerate




endmodule

module add(

    input a,
    input b,
    input cin,
    output cout,
    output sum
);

    assign {cout, sum} = a + b + cin;

endmodule

module tb;

    reg [99:0] a;
    reg [99:0] b;
    reg        cin;
    wire [99:0] sum;
    wire        cout;

    assign result_tb = a + b + cin;
    assign result    = {cout, sum};

    adder100 u0(.a(a), .b(b), .cin(cin), .cout(cout), .sum(sum));

    integer i;

    initial begin
        a = 0;
        b = 0;
        cin = 0;

        for (i = 0; i <16; i = i+1) begin
            #10
            a = $random;
            b = $random;
            cin = $random;

            #10
            if (result_tb == result)
                $display("PASSED");
            else
                $display("ERROR %d %d", result_tb, result);

        end

        $finish;

    end

    initial begin   
        $dumpfile("adder100.vcd");
        $dumpvars;

    end

endmodule