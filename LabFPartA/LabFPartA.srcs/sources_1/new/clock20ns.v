`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Trinity College Dublin
// Engineer: Patrick Farmer 20331828
// 
// Create Date: 24.03.2023 9:51:15
// Module Name: dtypeReset
// 
//////////////////////////////////////////////////////////////////////////////////


module clock20ns (
  output reg reset,
  output reg clk,
  output integer count
);

    /*always @(posedge reset) begin
        count <= 0;
        clk <= 0;
        reset <= 0;
    end*/

    initial begin
        count = 0;
        clk = 0;
        //reset = 0;
        repeat(3000) begin
            if (count == 1000) begin
                reset = 1;
                clk = 0;
                count = 0;
                #10;
                reset = 0;
            end else begin
                clk = ~clk;
                count = count + 1;
                #10;
            end;
        end
    end

    initial begin 
        reset = 1;
        #35;
        reset = 0;
        #80;
        reset = 1;
        #30;
        reset = 0;
    end



endmodule
