module wire4(

    input a, b, c,
    output w, x, y, z

);

    assign w = a;
    assign {x, y} = {b, b};
    assign z = c;


endmodule