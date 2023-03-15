module GTcomparator2bit
   (
    input  wire[1:0] a, b,		// a adn b are the two 2-bit numbers to compare
    output wire aeqb, aeqb1, aeqb2			// single bit output. Should be high if a adn b the same
   );

   // internal signal declaration, used to wire outpus of the 1 bit comparators
   wire e0, e1, e2, gt1, gt2, xor1, and1, or1, eq1;
   
   	

   //1bit comparators called the determine the necessary logical states for calculation
   GTcomparator1bit gt_bit0_unit (.i0(a[0]), .i1(b[0]), .eq(gt1));
   GTcomparator1bit gt_bit1_unit (.i0(a[1]), .i1(b[1]), .eq(gt2));
   EQcomparator1bit eq_bit0_unit (.i0(a[0]), .i1(b[0]), .eq(eq1));
   

    //logic to determine whether it is greater than overall
   assign xor1 = eq1 ^ gt1;
   assign and1 = xor1 & gt2;
   assign or1 = gt2 | and1;
   assign aeqb2 = or1;

   
   

endmodule