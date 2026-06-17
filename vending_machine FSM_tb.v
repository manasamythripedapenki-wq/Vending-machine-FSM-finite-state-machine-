`timescale 1ns/1ps

module vending_machine_tb;

reg clk, coin;
wire product;

vending_machine uut(
    .clk(clk),
    .coin(coin),
    .product(product)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("vending.vcd");
    $dumpvars(0,vending_machine_tb);

    clk = 0;
    coin = 0;

    #10 coin = 1;   
    #10 coin = 1;   

    #10 coin = 0;

    #10 coin = 1;   
    #10 coin = 1;   

    #20 $finish;
end

endmodule
