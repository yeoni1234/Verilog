`timescale 1ms/1ns

module vector3(

    input [4:0] a, b, c, d, e, f, 
    output [7:0] w, x, y, z

);

    assign {w, x, y, z} = {a, b, c, d, e, f, 2'b11};
    

    //Concatenation needs to know the width of every component (or how would you know the length of the result?). 
    //Thus, {1, 2, 3} is illegal and results in the error message: unsized constants are not allowed in concatenations.
	//The concatenation operator can be used on both the left and right sides of assignments.
    
    //wire [31:0] concat_reg; //raise an error when work with reg. Reason unknown???
    //assign concat_reg = {a[4:0], b[4:0], c[4:0], d[4:0], e[4:0], f[4:0], 2'b11};
    // assign w = concat_reg[31:24];
    // assign x = concat_reg[23:16];
    // assign y = concat_reg[15:8];
    // assign z = concat_reg[7:0];
  

endmodule


module tb;

    reg [4:0] a, b, c, d, e, f;  //input = reg
    wire [7:0] w, x, y, z;      //output = wire
    wire [7:0] w, 
    wire [3:0] x, 
    wire  z[3:0];
    integer i;
    vector3 inst1 (a, b, c, d, e, f, w, x, y, z);

   // vector3 u0(.a(a), .b(b), .c(c), .d(d), .e(e), .f(f),.x(x), .y(y), .w(w), .z(z) );
    
    initial begin // 임의로 값 주기
    a = 0;
    b = 0;
    c = 0;
    d = 0;
    e = 0;
    f = 0;
        for (i = 0; i <16; i += 1) begin
            #10
            a = (a+1)%31;
            b = (b+2)%31;
            c = (c+3)%31;
            d = (d+4)%31;
            e = (e+5)%31;
            f = (f+6)%31;
    end

    end
    initial begin
      $dumpfile("vector3.vcd");
      $dumpvars;
      #10000 $finish;

    end
endmodule


