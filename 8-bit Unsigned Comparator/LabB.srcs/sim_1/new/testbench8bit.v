// Listing 1.7
// The `timescale directive specifies that
// the simulation time unit is 1 ns  and
// the simulation timestep is 10 ps
`timescale 1 ns/10 ps

module testbench8bit;
   // signal declaration
   reg  [7:0] test_in0, test_in1;
   wire   GT10, GT20, GT30, GT40, EQ10, EQ20, EQ30, EQ40;
   wire   GTEtest_out;

    //GTcomparator2bit GTunit
      //(.a(test_in0), .b(test_in1), .aeqb(GTtest_out), .aeqb1(GTtest_out1), .aeqb2(GTtest_out2));

   // instantiate the circuit under test
    GTEcomparator8bit GTEUnit(.a1(test_in0), .b1(test_in1), .GTEOutput(GTEtest_out), .gt1(GT10), .gt2(GT20)
    , .gt3(GT30), .gt4(GT40), .eq1(EQ10), .eq2(EQ20), .eq3(EQ30), .eq4(EQ40));
    //GTcomparator1bit gt_bit1_unit (.i0(test_inA), .i1(test_inB), .eq(e1));


    always @ (test_in0 or test_in1) begin
        $monitor("input 1 is =%d,input 2 is =%d,Greater Than or Equal To output is =%d", test_in0, test_in1, GTEtest_out);
    end
   
   //  test vector generator
    initial
    begin
      // test vector 1
      test_in0 = 8'b10100100;
      test_in1 = 8'b00100000;
      # 200;
      // test vector 2
      test_in0 = 8'b00100000;
      test_in1 = 8'b00001000;
      # 200;
      // test vector 3
      test_in0 = 8'b01001010;
      test_in1 = 8'b11000000;
      # 200;
      // test vector 4
      test_in0 = 8'b10001000;
      test_in1 = 8'b11000000;
      # 200;
      // test vector 5
      test_in0 = 8'b10010000;
      test_in1 = 8'b00000001;
      # 200;
      // test vector 6
      test_in0 = 8'b11011000;
      test_in1 = 8'b11100100;
      # 200;
      // test vector 7
      test_in0 = 8'b11001100;
      test_in1 = 8'b01110000;
      # 200;
      // test vector 7
      test_in0 = 8'b01101100;
      test_in1 = 8'b01010000;
      # 200;
      // stop simulation
      $stop;
   end
   

endmodule