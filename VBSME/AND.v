`timescale 1ns/1ps

module AND(A, B, ANDout);
  input A, B;
  output reg ANDout;

  always @*
    begin
      if (A == 1 && B == 1)
        ANDout <= 1;
      else 
        ANDout <= 0;
    end
endmodule
      
  