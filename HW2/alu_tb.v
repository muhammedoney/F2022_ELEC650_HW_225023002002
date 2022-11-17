`timescale 1ns / 1ps

module alu_tb();

  reg clk = 0;
  reg [3:0]  opcode = 0;
  reg [15:0] A = 0, B = 0;
  
  alu dut(
    .A        (A),
    .B        (B),   
    .opcode   (opcode),
    .Y        (),     
    .C        (),
    .Z        (),
    .E        (),
    .G        ()
  );
  
  always #5 clk = ~clk;
  
  initial begin
    #(500) @(posedge clk);
    $finish();
  end
  
  always @(posedge clk) begin
    A       <= $random();
    B       <= $random();
    opcode  <= $random();
  end
endmodule
