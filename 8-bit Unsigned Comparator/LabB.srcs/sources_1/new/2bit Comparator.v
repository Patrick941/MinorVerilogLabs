// Listing 1.1
module GTcomparator1bit
   // I/O ports
   (
    input wire i0, i1,
    output wire eq
   );

   // signal declaration
   wire p0, p1;

   // body
   // sum of two product terms
   assign eq = i0 & ~i1;
   // product term
   

endmodule