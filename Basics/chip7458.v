module chip7458(

    input a1, b1, c1, d1, e1, f1,
    output y1, 
    input a2, b2, c2, d2, 
    output y2
);

    assign y1 = (a1 & b1 & c1) | (d1 & e1 & f1);
    assign y2 = (a2 & b2) | (c2 & d2);

endmodule


