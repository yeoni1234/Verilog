module alwaysif2(

    input           cpu_overheated,
    output reg      shut_off_computer,
    input           arrived,
    input           gas_tank_empty,
    output reg      keep_driving


);

    always @(*) begin 
        if (cpu_overheated)
            shut_off_computer = 1;
        else 
            shut_off_computer 0 ; // 모든 경우의 수를 적어줌으로써 latch 방지
        end

    always @(*) begin
        if (~arrived)
            keep_driving = ~gas_tank_empty;
        else    
            keep_driving = 0; // 여기도 마찬가지
        end


endmodule