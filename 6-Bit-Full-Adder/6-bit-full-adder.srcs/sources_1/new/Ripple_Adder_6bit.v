module Ripple_Adder_6bit(inputA, inputB, carryIn, sumOutput, carryOutput, overflow, carryOut);
    
    input wire [5:0]inputA, inputB, carryIn;
  
    // s is the sum of a and b. cout is any carry out bit
    // wires since just using assign here
    output wire [5:0]sumOutput;
    output wire [5:0]carryOutput;
    output wire overflow;
    output wire carryOut;
    
    
    //Ripple adder implementation, carry is passed from carryOutput to carryIn at each step
    assign carryIn[0] = 0;
    FullAdder1bit full_adder_unit1 ( .a(inputA[0]), .b(inputB[0]), .cin(carryIn[0]), .cout(carryOutput[0]), 
    .s(sumOutput[0]));
    assign carryIn[1] = carryOutput[0];
    FullAdder1bit full_adder_unit2 ( .a(inputA[1]), .b(inputB[1]), .cin(carryIn[1]), .cout(carryOutput[1]), 
    .s(sumOutput[1]));
    assign carryIn[2] = carryOutput[1];
    FullAdder1bit full_adder_unit3 ( .a(inputA[2]), .b(inputB[2]), .cin(carryIn[2]), .cout(carryOutput[2]), 
    .s(sumOutput[2]));
    assign carryIn[3] = carryOutput[2];
    FullAdder1bit full_adder_unit4 ( .a(inputA[3]), .b(inputB[3]), .cin(carryIn[3]), .cout(carryOutput[3]), 
    .s(sumOutput[3]));
    assign carryIn[4] = carryOutput[3];
    FullAdder1bit full_adder_unit5 ( .a(inputA[4]), .b(inputB[4]), .cin(carryIn[4]), .cout(carryOutput[4]), 
    .s(sumOutput[4]));
    assign carryIn[5] = carryOutput[4];
    FullAdder1bit full_adder_unit6 ( .a(inputA[5]), .b(inputB[5]), .cin(carryIn[5]), .cout(carryOutput[5]), 
    .s(sumOutput[5]));
    assign carryOut = carryOutput[5];
    assign overflow = carryOutput[4] ^ carryOutput[5];  
    
endmodule
