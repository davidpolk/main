module ALU32BitController(SE_out, ALU_OP, ALU_Control);

  input [5:0] ALU_OP;
  input [31:0] SE_out;

  output reg [4:0] ALU_Control;

  always@(ALU_OP, SE_out)
    begin
      case(ALU_OP)
        6'b000000: 
        begin//ADD, SLL, SUB takes sign extension to differ from the two
          if(SE_out[5:0] == 6'b100000) //ADD
              ALU_Control <= 0;
            
          else if (SE_out[5:0] == 6'b000000) //SLL
              ALU_Control <= 5'b01100;
           
          else if (SE_out[5:0] == 6'b000010) //SRL
              ALU_Control <= 5'b01101;
          
          else if (SE_out[5:0] == 6'b100100) //AND
            ALU_Control <= 5'b00100;
          
          else if(SE_out[5:0] == 6'b100101) //OR
            ALU_Control <= 5'b00111;
          
          else if(SE_out[5:0] == 6'b100110) //XOR
            ALU_Control <= 5'b01001;
          
          else if(SE_out[5:0] == 6'b101010)//SLT
            ALU_Control <= 5'b01111;
          
          else if (SE_out[5:0] == 6'b001000) //JR
            ALU_Control <= 5'b11111;
          
          else if (SE_out[5:0] == 6'b100111) //NOR
            ALU_Control <= 5'b01000;
          
          else 
            ALU_Control <= 5'b00001;//SUB
          
        end
        
  
        6'b000001:  //BGEZ & BLTZ
          ALU_Control <= 5'b10011;

        //6'b000011: //JAL
          //ALU_Control <= 5'b11000;

        6'b000100: //BEQ
          ALU_Control <= 5'b10001;

        6'b000101: //BNE
          ALU_Control <= 5'b10010;

        6'b000110: //BLEZ
          ALU_Control <= 5'b10101;
        6'b000111: //BGTZ
          ALU_Control <= 5'b10100;
        6'b001000: //ADDI
          ALU_Control <= 5'b00000;
        6'b001010: //SLTI
          ALU_Control <= 5'b10000;
        6'b001100: //ANDI
          ALU_Control <= 5'b00101;
        6'b001101: //ORI
          ALU_Control <= 5'b01010;
        6'b001110: //XORI
          ALU_Control <= 5'b01011;
        6'b101011: // sw
          ALU_Control <= 5'b11010;
        6'b100011: //lw
          ALU_Control <= 5'b11001;
        6'b100001: //lh
          ALU_Control <= 5'b11100;
        6'b101000: //sb
          ALU_Control <= 5'b11101;
        6'b100000: //lb
          ALU_Control <= 5'b11011;
        6'b101001: //sh
          ALU_Control <= 5'b11110;
        6'b011100: //mul
          ALU_Control <= 5'b00010;
          
      endcase
      
      end
      
endmodule
        
          
          
  