`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Trinity College Dublin
// Engineer: Patrick Farmer 20331828
// 
// Create Date: 21.03.2023 16:51:15
// Module Name: dtypeReset
// 
//////////////////////////////////////////////////////////////////////////////////


// Listing 4.2
module dtypeReset
   (
    input wire clock, reset,
    input wire d,
    output reg q
   );

   // body
   always @(negedge clock)
      if (reset)
         q <= 1'b0;
      else
         q <= d;

endmodule
