module HW1_2b (
	input wire A,B,C,D,
	output wire F
);
  
  assign F = (A&C) | (A&(~C)&(~A)) | ((~A)&B&D) | ((~C)&D);

endmodule