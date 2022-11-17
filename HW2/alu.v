`timescale 1ns / 1ps

module alu(
  input       [15:0] A,B,
  input       [3:0]  opcode,
  output reg  [31:0] Y,
  output reg         C,Z,E,G
);

  always @(*) begin
    C = 0;
    Z = (Y == 0);
    E = 0;
    G = 0;
    Y = 0;
    case(opcode)
      4'd0 : begin    // ADD
        Y = A + B;
        C = Y[16];
      end
      4'd1 : begin    // SUB
        Y = A - B;
      end
      4'd2 : begin    // MUL
        Y = A * B;
      end
      4'd3 : begin    // DIV
        if(B!=0)
          Y = A / B;
        else 
          Y = 'dX;
      end
      4'd4 : begin    // SLL
        Y = A << 1;
      end
      4'd5 : begin    // SRL
        Y = A >> 1;
      end
      4'd6 : begin    // Rotate Left
        Y[15:0] = {A[14:0],A[15]};
      end
      4'd7 : begin    // Rotate Right
        Y[15:0] = {A[0],A[15:1]};
      end
      4'd8 : begin    // AND
        Y = A & B;
      end
      4'd9 : begin    // OR
        Y = A | B;
      end
      4'd10 : begin   // XOR
        Y = A ^ B;
      end
      4'd11 : begin   // NOR
        Y = ~( A | B );
      end
      4'd12 : begin   // NAND
        Y = ~( A & B );
      end
      4'd13 : begin   // XNOR
        Y = ~( A ^ B);
      end
      4'd14 : begin   // Greater
        if(A > B) begin
          Y = A;
          G = 1'b1;
        end else begin
          Y = 0; 
        end
      end
      4'd15 : begin   // Equal
        E = (A == B);
      end
      default : begin
        Y = 0;
      end
    endcase
  end

endmodule
