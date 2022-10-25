module HW1_1b(
	input wire A,B,C,
	output wire F
);

  assign F = (A&B&C) | (A&(~B)&C) | (A&(~B)&(~C)) | ((~A)&(~B)&C);

endmodule