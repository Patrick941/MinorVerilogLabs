// Listing 1.7
// The `timescale directive specifies that
// the simulation time unit is 1 ns  and
// the simulation timestep is 10 ps
`timescale 1 ns/10 ps

module testbench2bit;
   // signal declaration
   reg  [1:0] test_in0, test_in1;
   wire  GTtest_out, GTtest_out1, GTtest_out2, EQtest_out, EQtest_out1, EQtest_out2;

   // instantiate the circuit under test
   GTcomparator2bit GTunit
      (.a(test_in0), .b(test_in1), .aeqb(GTtest_out), .aeqb1(GTtest_out1), .aeqb2(GTtest_out2));
   EQcomparator2bit EQunit
      (.a(test_in0), .b(test_in1), .aeqb(EQtest_out), .aeqb1(EQtest_out1), .aeqb2(EQtest_out2));

   //  test vector generator
   always @ (test_in0 or test_in1) begin
        $monitor("input 1 is =%d,input 2 is =%d,equality comparator output is =%d , greater than comparator is =%d", test_in0, test_in1, EQtest_out2, GTtest_out2);
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
      // test vector 4
      test_in0 = 2'b10;
      test_in1 = 2'b10;
      # 200;
       // test vector 5
      test_in0 = 2'b10;
      test_in1 = 2'b11;
      # 200;
       // test vector 5
      test_in0 = 2'b10;
      test_in1 = 2'b01;
      # 200;
      // test vector 6
      test_in0 = 2'b11;
      test_in1 = 2'b11;
      # 200;
      // test vector 7
      test_in0 = 2'b11;
      test_in1 = 2'b01;
      # 200;
      // test vector 7
      test_in0 = 2'b11;
      test_in1 = 2'b00;
      // test vector 7
      test_in0 = 2'b11;
      test_in1 = 2'b00;
      # 200;
      // stop simulation
      $stop;
   end
   /*
   initial begin
    $monitor("t=%3d x=%d,y=%d,z=%d \n",$time,x,y,z, );
   end*/

endmodule