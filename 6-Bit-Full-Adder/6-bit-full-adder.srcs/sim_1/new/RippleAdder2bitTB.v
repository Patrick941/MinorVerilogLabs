// Listing 1.7
// The `timescale directive specifies that
// the simulation time unit is 1 ns  and
// the simulation timestep is 10 ps
`timescale 1 ns/10 ps

module RippleAdder6bitTB;
    // signal declaration
    reg  signed [5:0] test_in0;
    reg  signed [5:0] test_in1;
    reg selector;
    wire sel;
    wire signed [5:0] sOutput;
    wire signed [5:0] cOutput;
    wire signed [5:0] selectorIn;
    wire overflow, MSBCarryOut;
    
    
    

    //FullAdder1bit full_adder_unit (.a(test_in0[0]), .b(test_in1[0]), .s(sOutput), .cout(cOutput), .cin(0));
    //  test vector generator
    always @ (test_in0 or test_in1 or selector) begin 
        if(selector == 0) begin
            if(cOutput == 6'b000000 && overflow == 0 && MSBCarryOut == 0 &&((test_in0 + test_in1) != sOutput))
            $monitor("Error Ocurred for addition: Input 1 is %d, input 2 is %d, sum output is %d, carry output %d, overflow is %d", test_in0, test_in1, 
            sOutput,cOutput,overflow);
        end
        else if(selector == 1) begin
            if(cOutput == 6'b000000 && overflow == 0 && MSBCarryOut == 0 && ((test_in0 - test_in1) != sOutput))
            $monitor("Error Ocurred for subtraction: Input 1 is %d, input 2 is %d, sum output is %d, carry output %d, overflow is %d", test_in0, test_in1, 
            sOutput,cOutput,overflow);
        end
    end
    always @ (test_in1 or test_in0 or selector) begin
        test_in1[0] = test_in1[0] ^ selector;
        test_in1[1] = test_in1[1] ^ selector;
        test_in1[2] = test_in1[2] ^ selector;
        test_in1[3] = test_in1[3] ^ selector;
        test_in1[4] = test_in1[4] ^ selector;
        test_in1[5] = test_in1[5] ^ selector;
    end  
    
    Ripple_Adder_6bit ripple_adder_unit0 (.inputA(test_in0), .inputB(test_in1), .sumOutput(sOutput), 
    .carryOutput(cOutput), .overflow(overflow), .carryOut(MSBCarryOut));
   
   
   integer count1 = -32;
   integer count2 = -32;
   
    initial 
    begin
       while(count1 <= 31) begin
            //test_in1 = count1;
            test_in0 = count1;
            while(count2 <= 31) begin
                //0 + count
                //test_in1 = 6'b000000;
                selector = 1;
                test_in1 = count2;
                #50;
                selector = 0;
                #50
                count2 = count2 + 1;
            end
            count1 = count1 + 1;
            count2 = -32;
        end
                    
      
      
      // stop simulation
      $stop;
   end

endmodule