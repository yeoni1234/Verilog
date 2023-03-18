module moduleshift(

    input clk, d,
    output q

);

    wire q1,q2; // 새로 나오는 출력 선언!

    my_dff instance1 (.clk(clk), .d(d), .q(q1));    // q1=첫번째1출력
    my_dff instance2 (.clk(clk), .d(q1), .q(q2));   // 두번째 d에 들어가는 입력 = q1, 출력 = q2
    my_dff instance3 (.clk(clk), .d(q2), .q(q));    // 번째 d에 들어가는 입력 = q2

    

endmodule