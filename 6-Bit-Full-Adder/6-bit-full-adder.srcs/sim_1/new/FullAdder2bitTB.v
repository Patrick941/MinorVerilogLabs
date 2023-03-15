// Listing 1.7
// The `timescale directive specifies that
// the simulation time unit is 1 ns  and
// the simulation timestep is 10 ps
`timescale 1 ns/10 ps

module testbench2bit;
    // signal declaration
    reg  [1:0] test_in0, test_in1;
    wire    sOutput, cOutput;

    FullAdder1bit full_adder_unit (.a(test_in0[0]), .b(test_in1[0]), .s(sOutput), .cout(cOutput), .cin(0));
    //  test vector generator
    always @ (test_in0 or test_in1) begin
        $monitor("Input 1 is %d, input 2 is %d, sum output is %d, carry output %d", test_in0, test_in1, 
        sOutput,cOutput);
    end
   
   
    initial
    begin
        // test vector 1
        test_in0 = 2'b00;
        test_in1 = 2'b00;
        # 200;
        // test vector 1
        test_in0 = 2'b00;
        test_in1 = 2'b01;
        # 200;
        // test vector 1
        test_in0 = 2'b00;
        test_in1 = 2'b11;
        # 200;
        // test vector 2
        test_in0 = 2'b01;
        test_in1 = 2'b01;
        # 200;
        // test vector 2
        test_in0 = 2'b01;
        test_in1 = 2'b10;
        # 200;
        // test vector 3
        test_in0 = 2'b01;
        test_in1 = 2'b11;
        # 200;
        $stop;
    end

endmodule