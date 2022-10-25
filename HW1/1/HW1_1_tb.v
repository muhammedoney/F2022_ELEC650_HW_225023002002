module HW1_1_tb();
 
  reg clk = 0;
  reg A = 0, B = 0, C = 0;
  wire 	F_1a, F_1b;
  
  HW1_1a hw1a(
    .A	(A),
    .B	(B),
    .C	(C),
    .F	(F_1a)
  );
  
  HW1_1b hw1b (
    .A	(A),
    .B	(B),
    .C	(C),
    .F	(F_1b)
  );
  
  always #5 clk = ~clk;
  
  initial begin
	$dumpfile("test.vcd");
    $dumpvars(0,HW1_1_tb);
  end
  
  initial begin
    #(150) @(posedge clk);
    $finish();
  end
  
  always @(posedge clk) begin
    A <= $urandom_range(0,1);
    B <= $urandom_range(0,1);
    C <= $urandom_range(0,1);
  end
 
endmodule