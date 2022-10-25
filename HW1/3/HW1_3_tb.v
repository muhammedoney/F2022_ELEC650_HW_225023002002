module HW1_3_tb();

  parameter WIDTH = 16;
  
  reg clk = 0;
  reg A = 0, B = 0, Cin = 0;
  reg [WIDTH-1 : 0]	A16 = 0, B16 = 0;
  
  wire 	S_ha, S_fa, Co_ha, Co_fa, Co_rca;
  wire [WIDTH-1 : 0] S_rca;
  
  HA ha0(
    .A	(A),
    .B	(B),
    .S	(S_ha),
    .Co	(Co_ha)
  );
  
  FA fa0 (
    .A	(A),
    .B	(B),
    .C	(Cin),
    .S	(S_fa),
    .Co	(Co_fa)
  );
  
  RCA #(
    .WIDTH (WIDTH))
  rca0 (
    .A	(A16),
    .B	(B16),
    .C	(Cin),
    .S	(S_rca),
    .Co	(Co_rca)
  );
  
  always #5 clk = ~clk;
  
  initial begin
	$dumpfile("test.vcd");
    $dumpvars(0,HW1_3_tb);
  end
  
  initial begin
    #(150) @(posedge clk);
    $finish();
  end
  
  always @(posedge clk) begin
    A 	<= $urandom_range(0,1);
    B 	<= $urandom_range(0,1);
    Cin <= $urandom_range(0,1);
    A16	<= $urandom;
    B16	<= $urandom;
  end
 
endmodule