`timescale 1ns/1ps

module PCAdder(PCout, Adderout, B);
  input[31:0] PCout, B;
  output reg [31:0] Adderout;
  
  initial begin
    Adderout <= 0;
  end

  always @(PCout, B)
    begin
      Adderout <= PCout + B;
    end
endmodule
      
  