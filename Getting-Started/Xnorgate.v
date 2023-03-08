module Xnorgate(

    input a, b, 
    output out

);
    // Xnor = 입력 같을때만 1출력
    
    assign out = (!a | b) & (a | !b);

endmodule