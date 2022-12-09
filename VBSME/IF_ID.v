`timescale 1ns / 1ps


module IFIDRegister(Clk, PCin, PCout, InstructionIn, InstructionOut, IFIDWrite, Branch, PCDisplay, IFIDPCDisplay, jump);

    input [31:0] PCin, InstructionIn, PCDisplay;
    output reg [31:0] PCout, InstructionOut, IFIDPCDisplay;
    
    input Clk, IFIDWrite, Branch, jump;

    
  always @ (posedge Clk) begin
       if (IFIDWrite == 1) begin
            PCout <= PCin;
            InstructionOut <= InstructionIn; 
            IFIDPCDisplay <= PCDisplay;
            
            if (Branch == 1 || jump == 1) begin
                InstructionOut <= 0;
            end
          
        end
         
        
         
         
    end

endmodule