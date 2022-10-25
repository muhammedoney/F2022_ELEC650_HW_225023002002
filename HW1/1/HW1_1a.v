module HW1_1a (
	input wire A,B,C,
	output wire F
);

  assign F = (~(A+B+C) | ((~A)&B&C) | ((~B)&A&C)) | ((~C)&A&B);

endmodule