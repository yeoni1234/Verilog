module adder32(

    input [31:0] a,
    input [31:0] b, 
    input        cin,
    output       cout,
    output [31:0] sum


);

    wire [7:0] c_w;


    adder4 inst0(.a(a[3:0]),   .b(b[3:0]),  . cin(cin),     .sum(sum[3:0]),   .cout(c_w[0]));
    adder4 inst1(.a(a[7:4]),   .b(b[7:4]),   .cin(c_w[0]),  .sum(sum[7:4]),   .cout(c_w[1]));
    adder4 inst2(.a(a[11:8]),  .b(b[11:8]),  .cin(c_w[1]),  .sum(sum[11:8]),  .cout(c_w[2]) );
    adder4 inst3(.a(a[15:12]), .b(b[15:12]), .cin(c_w[2]),  .sum(sum[15:12]), .cout(c_w[3]));
    adder4 inst4(.a(a[19:16]), .b(b[19:16]), .cin(c_w[3]),  .sum(sum[19:16]), .cout(c_w[4]));
    adder4 inst5(.a(a[23:20]), .b(b[23:20]), .cin(c_w[4]),  .sum(sum[23:20]), .cout(c_w[5]));
    adder4 inst6(.a(a[27:24]), .b(b[27:24]), .cin(c_w[5]),  .sum(sum[27:24]), .cout(c_w[6]));
    adder4 inst7(.a(a[31:28]), .b(b[31:28]), .cin(c_w[6]),  .sum(sum[31:28]), .cout(cout));
    

endmodule


module adder4(

    input [3:0] a,
    input [3:0] b,
    input       cin,
    output      cout,
    output [3:0] sum


);

    // wire c1, c2, c3;

    // adder1 inst0(.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c1));
    // adder1 inst1(.a(a[1]), .b(b[1]), .cin(c1), .sum(sum[1]), .cout(c2));
    // adder1 inst2(.a(a[2]), .b(b[2]), .cin(c2), .sum(sum[2]), .cout(c3));
    // adder1 inst3(.a(a[3]), .b(b[3]), .cin(c3), .sum(sum[3]), .cout(cout));

    
    wire [4:0] c_w;
    assign c_w[0] = cin;

    adder1 inst0(.a(a[0]), .b(b[0]), .cin(c_w[0]), .sum(sum[0]), .cout(c_w[1]));
    adder1 inst1(.a(a[1]), .b(b[1]), .cin(c_w[1]), .sum(sum[1]), .cout(c_w[2]));
    adder1 inst2(.a(a[2]), .b(b[2]), .cin(c_w[2]), .sum(sum[2]), .cout(c_w[3]));
    adder1 inst3(.a(a[3]), .b(b[3]), .cin(c_w[3]), .sum(sum[3]), .cout(c_w[4]));

    assign cout = c_w[4];
    

endmodule

module adder1(

    input a,
    input b,
    input cin,
    output cout,
    output sum

);

    assign {cout, sum} = a + b + cin;

endmodule

module tb;

    reg [31:0] a;
    reg [31:0] b;
    reg       cin;
    wire [31:0] sum;
    wire        cout;

    assign result_tb = a + b + cin;
    assign result    = {cout, sum};

    adder32 u0(.a(a), .b(b), .cin(cin), .cout(cout), .sum(sum));

    integer i;


    // initial begin
    //     $display("a\tb\tcin\tcout\tsum");
    //     $monitor("%b\t%b\t%b\t%b\t%b", a, b, cin, cout, sum, $time);

    // end

    initial begin   
        a = 0;
        b = 0;
        cin = 0;

        for (i = 0; i < 15; i = i + 1) begin
            #10
            a = $random;
            b = $random;
            cin= $random;
            
           #10
            
            if (result_tb == result)
                $display("PASSED");
            else
                $display("FAILED %d %d", result_tb, result);    
        end

        $finish;
    end 

    initial begin  

        $dumpfile("adder32.vcd");
        $dumpvars;


    end
endmodule