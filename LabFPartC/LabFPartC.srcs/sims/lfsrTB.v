`timescale 1ns / 1ps

module lfsr_tb;
    reg clk, reset;
    wire max_tick;
    wire lfsr_out;
    wire [31:0] counterOne, counterZero;
    
    lfsr lsft_unit(.clk(clk), .reset(reset), .lfsr_out(lfsr_out), .max_tick(max_tick));
    tracker tracker_unit(.clk(clk), .val(lfsr_out), .counterOne(counterOne), .counterZero(counterZero), .loop(max_tick), .reset(reset));
    always
    begin
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;
    end
    
    initial
    begin
        reset = 1'b1;
        #200;
        reset = 1'b0;
        #200;
        reset = 1'b1;
        #20;
        reset = 1'b0;
    end
endmodule