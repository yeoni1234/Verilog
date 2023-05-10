module mux256to1v(

    input [1024: 0] in,
    input [7:0]     sel,
    output [3:0]    out


);

    
    assign out = in[sel * 4 + 3 -: 4];
    
endmodule