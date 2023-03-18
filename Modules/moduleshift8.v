module moduleshift8(

    input clk,
    input [7:0] d,
    input [1:0] sel,
    output [7:0] q
);

    wire[7:0] q1;
    wire[7:0] q2;

    my_dff instance1 ( .clk(clk), .d(d), .q(q1));
    my_dff instance2 ( .clk(clk), .d(q1), .q2(q2));
    my_dff instance3 ( .clk(clk), .q2(q2), .q(q));


endmodule