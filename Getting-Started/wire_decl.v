`default_nettype none

module wire_decl(

    input a, 
    input b, 
    input c, 
    input d,

    output out,
    output out_n
);


    assign out = (a & b) | (c & d); 
    assign out_n = ~( (a & b) | (c & d)); 

endmodule