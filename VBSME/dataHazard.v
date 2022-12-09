`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - Mux32Bit2To1.v
// Description - Performs signal multiplexing between 2 32-Bit words.
////////////////////////////////////////////////////////////////////////////////

module DataHazard(Instruction, Mem_RD, WB_RD, out, IFIDWrite, ControlMux);

  input [31:0] Instruction; 
  input [4:0] Mem_RD, WB_RD; 
  reg [4:0] rs, rt;
  output reg out, ControlMux, IFIDWrite; 

    /* Fill in the implementation here ... */ 
    initial begin
        IFIDWrite <= 1;
        out <= 1;
        ControlMux <= 1;
        end
        
      always @ * begin
      case(Instruction[31:26])
        6'b000000: begin//ADD, SLL, SUB takes sign extension to differ from the two
          if(Instruction[5:0] == 6'b000000)begin //SLL
            rt <= Instruction[20:16];
            rs <= 5'b00000;
          end 
          
          else if (Instruction[5:0] == 6'b000010)begin//SRL
            rt <= Instruction[20:16];
            rs <= 5'b00000;
          end 
          
          else if(Instruction[5:0] == 6'b001000)begin //JR
            rs <= Instruction[25:21];
            rt <= 5'b00000;
          end 
          
          else begin
            rt <= Instruction[20:16];
            rs <= Instruction[25:21];
          end
          
        end
        
        6'b000001:  begin //BGEZ & BLTZ
            rs <= Instruction[25:21];
            rt <= 5'b00000;
          end
          
        6'b000010: begin //J
            rs <= 5'b00000;
            rt <= 5'b00000;
          end

        6'b000011: begin //JAL
            rs <= 5'b00000;
            rt <= 5'b00000;
          end

        6'b000100: begin//BEQ
            rt <= Instruction[20:16];
            rs <= Instruction[25:21];
          end

        6'b000101: begin  //BNE
            rt <= Instruction[20:16];
            rs <= Instruction[25:21];
          end

        6'b000110: begin  //BLEZ
            rs <= Instruction[25:21];
            rt <= 5'b00000;
          end
          
        6'b000111: begin  //BGTZ
            rs <= Instruction[25:21];
            rt <= 5'b00000;
          end
          
        6'b001000: begin  //ADDI
            //rt <= Instruction[20:16];
            rs <= Instruction[25:21];
            rt <= 5'b00000;
          end
          
        6'b001010: begin  //SLTI
            //rt <= Instruction[20:16];
            rs <= Instruction[25:21];
            rt <= 5'b00000;
          end
          
        6'b001100: begin  //ANDI
            //rt <= Instruction[20:16];
            rs <= Instruction[25:21];
            rt <= 5'b00000;
          end
          
        6'b001101: begin  //ORI
            //rt <= Instruction[20:16];
            rs <= Instruction[25:21];
            rt <= 5'b00000;
          end
          
        6'b001110: begin  //XORI
            //rt <= Instruction[20:16];
            rs <= Instruction[25:21];
            rt <= 5'b00000;
          end  
          
        6'b101011: begin  // sw
            rt <= Instruction[20:16];
            rs <= 5'b00000;
            //rs <= 
          end
          
        6'b100011: begin  //lw
            //rt <= Instruction[20:16];
            rs <= Instruction[25:21] + Instruction[15:0];
            rt <= 5'b00000;
          end
          
        6'b100001: begin  //lh
            //rt <= Instruction[20:16];
            rs <= Instruction[25:21] + Instruction[15:0];
            rt <= 5'b00000;
          end
          
        6'b101000: begin  //sb
            rt <= Instruction[20:16];
            rs <= 5'b00000;
            //rs <= 
          end
          
        6'b100000: begin  //lb
          //rt <= Instruction[20:16];
            rs <= Instruction[25:21] + Instruction[15:0];
            rt <= 5'b00000;
          end
          
        6'b101001: begin  //sh
            rt <= Instruction[20:16];
            rs <= 5'b00000;
            //rs <= 
          end
          
        6'b011100: begin  //mul
            rt <= Instruction[20:16];
            rs <= Instruction[25:21];
          end
          
      endcase

             

      if ((Mem_RD == rt | Mem_RD == rs) && (Mem_RD != 0)) begin
        out <= 0;
        ControlMux <= 0; 
        IFIDWrite <= 0;
         
      end 
      
      else if ((WB_RD == rt | WB_RD == rs) && (WB_RD != 0)) begin
        out <= 0; 
        ControlMux <= 0; 
        IFIDWrite <= 0;
      end 
      
      else if ((WB_RD != rt && WB_RD != rs) && (Mem_RD != rt && Mem_RD != rs))begin
        out <= 1;
        ControlMux <= 1;
        IFIDWrite <= 1;
      end
      
//      if (Instruction == 0) begin
//        IFIDWrite <= 1;
//        out <= 1;
//        ControlMux <= 1;
//     end        
      
       
    end

endmodule
