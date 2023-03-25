`timescale 1ns / 1ps
module lfsr (
    input wire clk, reset,
    output wire lfsr_out,
    output reg max_tick
    );
    localparam lfsr_seed = 15'b111110010001000; 
    reg [14:0] lfsr_reg;
    reg [14:0] lfsr_next;
    reg lfsr_tap;

    integer cycle_ctr;

    always @(posedge clk, posedge reset)
        if (reset)
            begin
                lfsr_reg <= lfsr_seed;
                max_tick <= 1'b0;
                cycle_ctr <= 0;
            end
        else
            begin
                lfsr_reg <= lfsr_next;
                cycle_ctr <= cycle_ctr + 1;
                if (cycle_ctr == 2**15 - 1)
                    begin
                    max_tick <= 1'b1;
                    cycle_ctr = 0;
                    end
                else
                    max_tick <= 1'b0;
            end

    always @*
    begin
        lfsr_tap = lfsr_reg[13] ~^ lfsr_reg[14];
        lfsr_next = {lfsr_reg[13:0],lfsr_tap}; 
    end 

    assign lfsr_out = lfsr_reg[14];
endmodule