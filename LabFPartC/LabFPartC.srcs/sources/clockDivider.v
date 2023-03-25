`timescale 1ns / 1ps

module clockDivider(
    input wire clk,
    input wire [31:0] clkscale,
    output reg clk_out
    );
    
    reg[31:0] clkq = 0;
    
    always@(posedge clk)
    begin
        clkq = clkq + 1;
        if(clkq >= clkscale)
        begin
            clk_out=~clk_out;
            clkq=0;
        end
    end
endmodule