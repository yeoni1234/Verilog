module moduleshift8(

    input       clk,
    input [7:0] d,
    input [1:0] sel,
    output reg [7:0] q
);

    wire[7:0] q1;
    wire[7:0] q2;
    wire[7:0] q3;

    my_dff instance1( .clk(clk), .d(d), .q(q1)); // my_dff8 d_flop1
    my_dff instance2( .clk(clk), .d(q1), .q(q2)); //my_dff8 d_flop2
    my_dff instance3( .clk(clk), .d(q2), .q(q3)); //my_dff8 d_flop3

    always @ (*) begin
      case (sel)
        2'b00 : q = d;
        2'b01 : q = q1;
        2'b10 : q = q2;
        2'b11 : q = q3;
      endcase

/*
      if        (sel == 2'b00)  q = d;
      else if   (sel == 2'b01)  q = q1;
      else if   (sel == 2'b10)  q = q2;
      else if   (sel == 2'b11)  q = q3;
*/     

    end


endmodule