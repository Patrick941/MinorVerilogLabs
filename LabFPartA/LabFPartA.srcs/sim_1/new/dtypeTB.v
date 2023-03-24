`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Trinity College Dublin
// Engineer: Patrick Farmer 20331828
// 
// Create Date: 21.03.2023 17:01:15
// Module Name: dtypeTB
// 
//////////////////////////////////////////////////////////////////////////////////

module dtypeTB();

    wire clk;
    wire reset;
    reg d;
    wire q;
    wire [31:0]count;

    clock20ns clock_unit (.clk(clk), .reset(reset), .count(count));
    dtypeReset reset_unit (.clock(clk), .reset(reset), .d(d), .q(q));

    initial begin
        d = 0;
        #20;
        d = 1;
        #25;
        d = 0;
        #30;
        d = 1;
        #100;
        d = 0;
    end

endmodule
