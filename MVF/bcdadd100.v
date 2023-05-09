module bcdadd100(

    input [399:0]  a, b,
    input          cin,
    output         cout,
    output [399:0] sum

);

    wire [99:0] cout_wires;

    genvar i;

        bcd_fadd fadd0(a[3:0], b[3:0], cin, cout_wires[0], sum[3:0]);

    generate 

        for (i = 1; i < 100; i = i +1 ) begin : fadd_400
            bcd_fadd fadd0( a[ (i *4) + 3 : i *4],
                            b[ (i *4) + 3 : i *4],
                            cout_wires[ i-1 ],
                            cout_wires[ i ],
                            sum[ (i *4) + 3 : i *4] );
        end

    endgenerate

    assign cout = cout_wires[99];



endmodule

module bcd_fadd(

    input [3:0] a,
    input [3:0] b,
    input       cin,
    output [3:0] sum,
    output       cout


);

    assign {cout, sum} = a + b + cin;

endmodule

/*

module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
	
    wire[99:0] cout_wires;
    genvar i;
    
    generate
        bcd_fadd(a[3:0], b[3:0], cin, cout_wires[0],sum[3:0]);
        for (i=4; i<400; i=i+4) begin: bcd_adder_instances
            bcd_fadd bcd_adder(a[i+3:i], b[i+3:i], cout_wires[i/4-1],cout_wires[i/4],sum[i+3:i]);
        end
    endgenerate
    
    assign cout = cout_wires[99];
endmodule


*/