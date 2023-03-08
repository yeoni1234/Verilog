module wire4(

input a, b, c,
output w, x, y, z

);

assign w = a;
assign {x, y} = {b, b}; // 입력 b가 x,y에 들어감 / 출력포트 2개이므로 b두번임!
assign z = c;


endmodule