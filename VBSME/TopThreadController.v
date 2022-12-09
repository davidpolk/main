`timescale 1ns/1ps

module TopThreadController(instruction, SADsignal);

  input [31:0] instruction;
  output reg SADsignal;

  always @ (instruction) begin
      case(instruction[31:26])
        6'b101000: begin  //sb aka SAD Calculation
          SADsignal <= 1;
          end
          
        6'b100000: begin  //lb aka loadSAD
          SADsignal <= 0;
          end
       
          
    endcase
    end
    
endmodule
          
      
          
          
         
          
     
          
        
        
          
          
  