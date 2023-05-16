module exams(

    input [3:0] x,
    input [3:0] y,
    output [4:0] sum

);

    wire [3:0] cout;

    FA FA0(x[0], y[0], 1'b0       ,cout[0], sum[0]); // cin이 1bit이므로 1'b0으로 표시해야됨
    FA FA1(x[1], y[1], cout[0], cout[1], sum[1]);
    FA FA2(x[2], y[2], cout[1], cout[2], sum[2]);
    FA FA3(x[3], y[3], cout[2], sum[4],  sum[3]);
   


endmodule

module FA(
    input x,
    input y,
    input cin,
    output cout,
    output sum

);

    assign {cout, sum} = x + y + cin;

endmodule

// module tb;

//     reg [3:0] x;
//     reg [3:0] y;
//     wire [4:0] sum;

//     exams u0(.x(x), .y(y), .sum(sum));

//     integer i;

//     initial begin
//         x = 0;
//         y = 0;


//         for (i = 0;  i <16; i = i +1) begin
//         #10
//         x = $random;
//         y = $random;

//     end

//     initial begin
//         $display("x\ty\tsum");
//         $monitor("%b\t%b\t%b", x, y, sum);

//     end

//     initial begin
//         $dumpfile("exams.vcd");
//         $dumpvars;
//     end

// endmodule