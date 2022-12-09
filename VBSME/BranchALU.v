//`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//// ECE369 - Computer Architecture
//// 
//// Module - ALU32Bit.v
//// Description - 32-Bit wide arithmetic logic unit (ALU).
////
//// INPUTS:-
//// ALUControl: N-Bit input control bits to select an ALU operation.
//// A: 32-Bit input port A.
//// B: 32-Bit input port B.
////
//// OUTPUTS:-
//// ALUResult: 32-Bit ALU result output.
//// ZERO: 1-Bit output flag. 
////
//// FUNCTIONALITY:-
//// Design a 32-Bit ALU, so that it supports all arithmetic operations 
//// needed by the MIPS instructions given in Labs5-8.docx document. 
////   The 'ALUResult' will output the corresponding result of the operation 
////   based on the 32-Bit inputs, 'A', and 'B'. 
////   The 'Zero' flag is high/1 when 'ALUResult' is '0'. 
//// 	High meaning that it would branch
////	The zero flag set to 1 is "ALUResult" is "0"
////   The 'ALUControl' signal should determine the function of the ALU 
////   You need to determine the bitwidth of the ALUControl signal based on the number of 
////   operations needed to support. 
//////////////////////////////////////////////////////////////////////////////////

//module ALU32Bit(ALUControl, A, B, ALU_Result, Zero);

//	input [4:0] ALUControl;         // control bits for ALU operation 16 possible operations with initial 4 bits	
//				                    // CHANGED TO 5 BITS to handle more operations including branching (32 Operations)
//					                //  Check to add another bit so that you can handle all the MIPS instructions 
//                                    // you need to adjust the bitwidth as needed 
//	input signed [31:0] A, B;	     // Inputs
//	output reg PCSrc;	            // Zero=1 if ALUResult == 0

//    /* Please fill in the implementation here... */
//	// Handle Branching first, if needed to branch set zeroflag high and aluresult to zero 

//	always @ (ALUControl,A,B)
//	begin
//	   PCSrc <= 0;
//		case(ALUControl)
//			// Handle Arithmetic ***********************************************************
//			5'b00000:    ALU_Result = A + B;// add
//			5'b00001:    ALU_Result = A - B;// sub
//			5'b00010:    ALU_Result = A * B;// mult
//			5'b00011:    ALU_Result = A / B;// Div

//			// Handle logical statements ****************************************************
//			5'b00100:    ALU_Result = A & B;// And
//			5'b00101:    ALU_Result = A & B;// andi      
//			5'b00111:    ALU_Result = A | B;// or
//			5'b01000:    ALU_Result = ~(A | B);// nor
//			5'b01001:    ALU_Result = (A ^ B);// xor
//			5'b01010:    ALU_Result = A | B;// ori 
//			5'b01011:    ALU_Result = (A ^ B);// xori 
//			5'b01100:    ALU_Result = A<<(B[10:6]);// sll
			
			
//			5'b01101:    ALU_Result = A>>(B[10:6]);// srl
//			5'b01111:    // slt
//				begin
//					if (A< B) begin
//						ALU_Result <= 1;
//					end else  begin
//						ALU_Result <= 0;
//					end
//				end 
//			5'b10000: // slti 
//                begin
//                    if (A < B) begin
//						ALU_Result <= 1;
//					end else  begin
//						ALU_Result <= 0;
//					end
//			    end
//			// Handle branching ************************************************************************
//			5'b10001: // beq
//				begin
//					if(A == B) begin
//						ALU_Result <= 1;
//						Zero <= 1;
//					end else begin
//						ALU_Result <= 0;
//						Zero <= 0;
//					end
//				end
//			5'b10010: // bne
//				begin 
//					if (A != B) begin
//						ALU_Result <=1;
//						Zero <= 1;
//					end else begin
//						ALU_Result <= 0;
//						Zero <= 0;
//					end
//				end
//			5'b10011: // bgez & bltz
            
//                 begin if(B[20:16] == 5'b00000)begin
//                 //start bltz
//                 if (A < 0 )begin
//                    Zero <= 1;
//                    $display("Nice!");
//                 end else begin
//                    Zero <=0;
//                    $display("Not nice!");
//                 end
            
//                 end else begin
//                 //start bgez
//                 if (A >= 0) begin
//                     Zero <= 1;
//                 end else begin
//                     Zero <= 0;
//                 end
//            end
//        end
        
//        5'b10100: // bgtz if rs >0 then branch
//          begin
//            if(A >0) begin
//              Zero <= 1;
//            end else begin
//              Zero <= 0;
//            end
//          end
          
//        5'b10101: // blez if rs <= 0 then branch
//          begin
//            if(A<=0)begin
//              Zero <= 1;
//            end else begin
//              Zero <= 0;
//            end
//          end
          
//        5'b11001: //lw B is offset and add to rt [base+offset]
//          ALU_Result <= A + B;
//        5'b11010: //sw
//          ALU_Result <= A + B;
//        5'b11011: //sb
//          ALU_Result <= A + B;
//        5'b11100: //lh
//          ALU_Result <= A + B;
//        5'b11101: //lb
//          ALU_Result <= A + B;
//        5'b11110: //sh
//          ALU_Result <= A + B;
//        5'b11111: //JR
//        begin
//          Zero <= 1;
//          ALU_Result <= A;
//        end
//        endcase
      
//    end
//endmodule
