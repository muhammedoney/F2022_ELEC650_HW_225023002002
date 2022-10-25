module RCA #(parameter WIDTH=16)(
  input  wire [WIDTH-1:0] A,B,
  input  wire			  C,
  output wire [WIDTH-1:0] S,
  output wire	          Co
);
  
  wire [WIDTH:0]     Co_gen;

  assign Co_gen[0] = C;        
  assign Co		   = Co_gen[WIDTH];
  
  genvar i;
  generate 
    for (i=0; i<WIDTH; i=i+1) 
      begin
        FA FA_gen( 
          .A	(A[i]),
          .B	(B[i]),
          .C	(Co_gen[i]),
          .S	(S[i]),
          .Co	(Co_gen[i+1])
        );
      end
  endgenerate

endmodule