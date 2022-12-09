`timescale 1ns / 1ps


module IFIDRegister(InstructionIn, InstructionOut, Complete, CompleteIF);

    input [31:0]  InstructionIn;
    input Complete;
    output reg CompleteIF;
    output reg [31:0]InstructionOut;
    
  always @* begin
     
            CompleteIF <= 0;
            InstructionOut <= InstructionIn; 
          
        end

endmodule