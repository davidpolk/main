`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
// INPUTS:-
// ALUControl: N-Bit input control bits to select an ALU operation.
// A: 32-Bit input port A.
// B: 32-Bit input port B.
//
// OUTPUTS:-
// ALUResult: 32-Bit ALU result output.
// ZERO: 1-Bit output flag. 
//
// FUNCTIONALITY:-
// Design a 32-Bit ALU, so that it supports all arithmetic operations 
// needed by the MIPS instructions given in Labs5-8.docx document. 
//   The 'ALUResult' will output the corresponding result of the operation 
//   based on the 32-Bit inputs, 'A', and 'B'. 
//   The 'Zero' flag is high/1 when 'ALUResult' is '0'. 
// 	High meaning that it would branch
//	The zero flag set to 1 is "ALUResult" is "0"
//   The 'ALUControl' signal should determine the function of the ALU 
//   You need to determine the bitwidth of the ALUControl signal based on the number of 
//   operations needed to support. 
////////////////////////////////////////////////////////////////////////////////

module ALUThread(index, A, B, in1, in2, in3, in4, in5, in6, in7, in8, 
in9, in10, in11, in12, in13, in14, in15, in16, ALU_Result,
 ALUControl, Zero);

  input signed [31:0] A, B,in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16, index;	            // 
  output reg [31:0] ALU_Result;
  output reg Zero;
  input [4:0] ALUControl;
  
  
 reg [31:0]  window11 = 99;
  reg [31:0] window12 = 99;
  reg [31:0] window13 = 99;
  reg [31:0] window14 = 99;
  reg [31:0] window21 = 99;
  reg [31:0] window22 = 99;
  reg [31:0] window23 = 99;
  reg [31:0] window24 = 99;
  reg [31:0] window31 = 99;
  reg [31:0] window32 = 99;
  reg [31:0] window33 = 99;
  reg [31:0] window34 = 99;
  reg [31:0] window41 = 99;
  reg [31:0] window42 = 99;
  reg [31:0] window43 = 99;
  reg [31:0] window44 = 99;

  reg signed [31:0] temp1;
  reg signed [31:0] temp2;
  reg signed [31:0] temp3;
  reg signed [31:0] temp4;
  reg signed [31:0] temp5;
  reg signed [31:0] temp6;
  reg signed [31:0] temp7;
  reg signed [31:0] temp8;
  reg signed [31:0] temp9;
  reg signed [31:0] temp10;
  reg signed [31:0] temp11;
  reg signed [31:0] temp12;
  reg signed [31:0] temp13;
  reg signed [31:0] temp14;
  reg signed [31:0] temp15;
  reg signed [31:0] temp16;
  
  reg signed [31:0] indextemp = 0;

    /* Please fill in the implementation here... */
	// Handle Branching first, if needed to branch set zeroflag high and aluresult to zero 

	always @ (ALUControl,A,B,in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16, index)
	begin
	   Zero <= 0;
		case(ALUControl)
			// Handle Arithmetic ***********************************************************
			5'b00000:    ALU_Result = A + B;// add
			5'b00001:    ALU_Result = A - B;// sub
			5'b00010:    ALU_Result = A * B;// mult
			5'b00011:    ALU_Result = A / B;// Div

			// Handle logical statements ****************************************************
			5'b00100:    ALU_Result = A & B;// And
			5'b00101:    ALU_Result = A & B;// andi      
			5'b00111:    ALU_Result = A | B;// or
			5'b01000:    ALU_Result = ~(A | B);// nor
			5'b01001:    ALU_Result = (A ^ B);// xor
			5'b01010:    ALU_Result = A | B;// ori 
			5'b01011:    ALU_Result = (A ^ B);// xori 
			5'b01100:    ALU_Result = A<<(B[10:6]);// sll
			
			
			5'b01101:    ALU_Result = A>>(B[10:6]);// srl
			5'b01111:    // slt
				begin
					if (A< B) begin
						ALU_Result <= 1;
					end else  begin
						ALU_Result <= 0;
					end
				end 
			5'b10000: // slti 
                begin
                    if (A < B) begin
						ALU_Result <= 1;
					end else  begin
						ALU_Result <= 0;
					end
			    end
			// Handle branching ************************************************************************
			5'b10001: // beq
				begin
					if(A == B) begin
						ALU_Result <= 1;
						Zero <= 1;
					end else begin
						ALU_Result <= 0;
						Zero <= 0;
					end
				end
			5'b10010: // bne
				begin 
					if (A != B) begin
						ALU_Result <=1;
						Zero <= 1;
					end else begin
						ALU_Result <= 0;
						Zero <= 0;
					end
				end
			5'b10011: // bgez & bltz
            
                 begin if(B[20:16] == 5'b00000)begin
                 //start bltz
                 if (A < 0 )begin
                    Zero <= 1;
                    $display("Nice!");
                 end else begin
                    Zero <=0;
                    $display("Not nice!");
                 end
            
                 end else begin
                 //start bgez
                 if (A >= 0) begin
                     Zero <= 1;
                 end else begin
                     Zero <= 0;
                 end
            end
        end
        
        5'b10100: // bgtz if rs >0 then branch
          begin
            if(A >0) begin
              Zero <= 1;
            end else begin
              Zero <= 0;
            end
          end
          
        5'b10101: // blez if rs <= 0 then branch
          begin
            if(A<=0)begin
              Zero <= 1;
            end else begin
              Zero <= 0;
            end
          end
          
        5'b11001: //lw B is offset and add to rt [base+offset]
          ALU_Result <= A + B;
        5'b11010: //sw
          ALU_Result <= A + B;
        5'b11101: //SAD Calculation aka sb
        begin
          temp1 <= (in1 - window11);
          if(temp1 < 0) begin
            temp1 = -temp1;
            end
          temp2 <= (in2 - window12);
           if(temp2 < 0) begin
            temp2 = -temp2;
            end
          temp3 <= (in3 - window13);
           if(temp3 < 0) begin
            temp3 = -temp3;
            end
          temp4 <= (in4 - window14);
           if(temp4 < 0) begin
            temp4 = -temp4;
            end
          temp5 <= (in5 - window21);
           if(temp5 < 0) begin
            temp5 = -temp5;
            end
          temp6 <= (in6 - window22);
           if(temp6 < 0) begin
            temp6 = -temp1;
            end
          temp7 <= (in7 - window23);
           if(temp7 < 0) begin
            temp7 = -temp7;
            end
          temp8 <= (in8 - window24);
           if(temp8 < 0) begin
            temp8 = -temp8;
            end
          temp9 <= (in9 - window31);
           if(temp9 < 0) begin
            temp9 = -temp9;
            end
          temp10 <= (in10 - window32);
           if(temp10 < 0) begin
            temp10 = -temp10;
            end
          temp11 <= (in11 - window33);
           if(temp11 < 0) begin
            temp11 = -temp11;
            end
          temp12 <= (in12 - window34);
           if(temp12 < 0) begin
            temp12 = -temp12;
            end
          temp13 <= (in13 - window41);
           if(temp13 < 0) begin
            temp13 = -temp13;
            end
          temp14 <= (in14 - window42);
           if(temp14 < 0) begin
            temp14 = -temp14;
            end
          temp15 <= (in15 - window43);
           if(temp15 < 0) begin
            temp15 = -temp15;
            end
          temp16 <= (in16 - window44);
           if(temp16 < 0) begin
            temp16 = -temp16;
            end


          ALU_Result <= temp1 + temp2 + temp3 + temp4 + temp5 + temp6 + temp7 + temp8 + temp9 + temp10 + temp11 + temp12 + temp13 + temp14 + temp15 + temp16;
        end

      
        5'b11100: //lh
          ALU_Result <= A + B;
        5'b11011: begin //load SAD aka lb 
//          indextemp <= index<<6;
          ALU_Result <= index + B;
          end

          
        5'b11110: //sh
          ALU_Result <= A + B;
        5'b11111: //JR
        begin
          Zero <= 1;
          ALU_Result <= A;
        end
        endcase
      
    end
endmodule
