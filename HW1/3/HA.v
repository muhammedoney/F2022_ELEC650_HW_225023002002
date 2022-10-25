module HA (
	input wire A,B,
	output wire S,Co
);
  
  assign Co = A & B;
  assign S  = A ^ B;

endmodule