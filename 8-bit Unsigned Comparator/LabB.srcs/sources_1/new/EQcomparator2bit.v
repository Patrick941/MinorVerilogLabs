module EQcomparator2bit
   (
    input  wire[1:0] a, b,		// a adn b are the two 2-bit numbers to compare
    output wire aeqb, aeqb1, aeqb2			// single bit output. Should be high if a adn b the same
   );

   // internal signal declaration, used to wire outpus of the 1 bit comparators
   wire e0, e1, e2;

   // body
   // instantiate two 1-bit comparators that we already know are tested and work
   // named instantiation allows us to change order of ports.
   EQcomparator1bit eq_bit0_unit (.i0(a[0]), .i1(b[0]), .eq(e0));
   EQcomparator1bit eq_bit1_unit (.i0(a[1]), .i1(b[1]), .eq(e1));
   assign e2 = e1 & e0;

   // a and b are equal if individual bits are equal, which comes from the 1-bit comparators
   assign aeqb2 = e2;
   
   

endmodule