module vending_machine(
    input clk,
    input coin,
    output reg product
);

reg [1:0] state;

parameter S0 = 2'b00,
          S1 = 2'b01,
          S2 = 2'b10;

always @(posedge clk)
begin
    case(state)
        S0: begin
            product <= 0;
            if(coin)
                state <= S1;
        end

        S1: begin
            product <= 0;
            if(coin)
                state <= S2;
        end

        S2: begin
            product <= 1;
            state <= S0;
        end
    endcase
end

initial begin
    state = S0;
    product = 0;
end

endmodule
