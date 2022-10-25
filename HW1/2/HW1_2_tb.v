module HW1_2_tb();
 
  reg clk = 0;
  reg A = 0, B = 0, C = 0, D = 0;
  wire 	F_2a, F_2b;
  
  HW1_2a hw2a(
    .A	(A),
    .B	(B),
    .C	(C),
    .D	(D),
    .F	(F_2a)
  );
  
  HW1_2b hw2b (
    .A	(A),
    .B	(B),
    .C	(C),
    .D	(D),
    .F	(F_2b)
  );
  
  always #5 clk = ~clk;
  
  initial begin
	$dumpfile("test.vcd");
    $dumpvars(0,HW1_2_tb);
  end
  
  initial begin
    #(150) @(posedge clk);
    $finish();
  end
  
  always @(posedge clk) begin
    A <= $urandom_range(0,1);
    B <= $urandom_range(0,1);
    C <= $urandom_range(0,1);
    D <= $urandom_range(0,1);
  end
 
endmodule