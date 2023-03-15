module GTEcomparator8bit
   (
    input  wire[7:0] a1, b1,		// a adn b are the two 2-bit numbers to compare
    output wire aeqb, GTEOutput,  eq1, gt1, eq2, gt2, eq3, gt3, eq4, gt4		// single bit output. Should be high if a adn b the same
   );

    //The 2bit greater than comparator and the equal to comparator is called for each crumb
    EQcomparator2bit GTE_unit_11 (.a(a1[7:6]), .b(b1[7:6]), .aeqb2(eq1));
    GTcomparator2bit GTE_unit_12 (.a(a1[7:6]), .b(b1[7:6]), .aeqb2(gt1));
    
    EQcomparator2bit GTE_unit_21 (.a(a1[5:4]), .b(b1[5:4]), .aeqb2(eq2));
    GTcomparator2bit GTE_unit_22 (.a(a1[5:4]), .b(b1[5:4]), .aeqb2(gt2));
    
    EQcomparator2bit GTE_unit_31 (.a(a1[3:2]), .b(b1[3:2]), .aeqb2(eq3));
    GTcomparator2bit GTE_unit_32 (.a(a1[3:2]), .b(b1[3:2]), .aeqb2(gt3));
    
    EQcomparator2bit GTE_unit_41 (.a(a1[1:0]), .b(b1[1:0]), .aeqb2(eq4));
    GTcomparator2bit GTE_unit_42 (.a(a1[1:0]), .b(b1[1:0]), .aeqb2(gt4));
    
    //The entire logic is performed in one line as it is simple to understand as its quite repetitive
    assign GTEOutput = (gt1) | (eq1 & gt2) | (eq1 & eq2 & gt3) | (eq1 & eq2 & eq3 &gt4) | (eq1 & eq2 & eq3 &eq4);
    
   
   

endmodule