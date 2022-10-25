module HW1_2a (
	input wire A,B,C,D,
	output wire F
);
  
  assign F = (A&(~C)&(~D)) | (A&C&D) | (A&C&(~D)) | (A&D&(~B));

endmodule