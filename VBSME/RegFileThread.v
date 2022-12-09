`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
//
//
// Student(s) Name and Last Name: FILL IN YOUR INFO HERE!
//    Richardo Larez 33.33%
//    David Polk  33.33%
//    Paz Davila  33.33%
//
// Module - register_file.v
// Description - Implements a register file with 32 32-Bit wide registers.


module RegFileThread( WriteData1, WriteData2, WriteData3, WriteData4, WriteData5,
 WriteData6, WriteData7, WriteData8, WriteData9, WriteData10, WriteData11, WriteData12, WriteData13, WriteData14, WriteData15, WriteData16, 
 RegWrite, Clk, ReadData1, ReadData2, ReadData3, ReadData4, ReadData5, ReadData6, ReadData7, ReadData8, ReadData9, ReadData10, ReadData11, 
 ReadData12, ReadData13, ReadData14, ReadData15, ReadData16);

	/* Please fill in the implementation here... */
	
   
   input RegWrite;
   output reg[31:0] ReadData1, ReadData2, ReadData3, ReadData4, ReadData5, ReadData6, ReadData7, ReadData8, ReadData9, ReadData10, ReadData11, 
 ReadData12, ReadData13, ReadData14, ReadData15, ReadData16;
   input [31:0] WriteData1, WriteData2, WriteData3, WriteData4, WriteData5,
 WriteData6, WriteData7, WriteData8, WriteData9, WriteData10, WriteData11, WriteData12, WriteData13, WriteData14, WriteData15, WriteData16;
   input Clk;

   reg [31:0] RegFile [0:31];
   
   initial begin
        RegFile[0] <= 32'h00000000;
        RegFile[1] <= 32'h00000000;
        RegFile[2] <= 32'h00000000;
        RegFile[3] <= 32'h00000000;
        RegFile[8] <= 32'h00000000;
        RegFile[9] <= 32'h00000000;
        RegFile[10] <= 32'h00000000;
        RegFile[11] <= 32'h00000000;
        RegFile[12] <= 32'h00000000;
        RegFile[13] <= 32'h00000000;
        RegFile[14] <= 32'h00000000;
        RegFile[15] <= 32'h00000000;
        RegFile[16] <= 32'h00000000;
        RegFile[17] <= 32'h00000000;
        RegFile[18] <= 32'h00000000;
        RegFile[19] <= 32'h00000000;
        RegFile[20] <= 32'h00000000;
        RegFile[21] <= 32'h00000000;
        RegFile[22] <= 32'h00000000;
        RegFile[23] <= 32'h00000000;
        RegFile[24] <= 32'h00000000;
        RegFile[25] <= 32'h00000000;
        RegFile[29] <= 32'd252; 
        RegFile[31] <= 32'h00000000;
    end
   
   
   // Write procedure
   always @(posedge Clk) begin
        if(RegWrite == 1) begin
          RegFile[0] <= WriteData1;
          RegFile[1] <= WriteData2;
          RegFile[2] <= WriteData3;
          RegFile[3] <= WriteData4;
          RegFile[4] <= WriteData5;
          RegFile[5] <= WriteData6;
          RegFile[6] <= WriteData7;
          RegFile[7] <= WriteData8;
          RegFile[8] <= WriteData9;
          RegFile[9] <= WriteData10;
          RegFile[10] <= WriteData11;
          RegFile[11] <= WriteData12;
          RegFile[12] <= WriteData13;
          RegFile[13] <= WriteData14;
          RegFile[14] <= WriteData15;
          RegFile[15] <= WriteData16;
        end 

   end

   // Read procedure
   always @(negedge Clk) begin
        ReadData1 = RegFile[0];
        ReadData2 = RegFile[1];
        ReadData3 = RegFile[2];
        ReadData4 = RegFile[3];
        ReadData5 = RegFile[4];
        ReadData6 = RegFile[5];
        ReadData7 = RegFile[6];
        ReadData8 = RegFile[7];
        ReadData9 = RegFile[8];
        ReadData10 = RegFile[9];
        ReadData11 = RegFile[10];
        ReadData12 = RegFile[11];
        ReadData13 = RegFile[12];
        ReadData14 = RegFile[13];
        ReadData15 = RegFile[14];
        ReadData16 = RegFile[15];
     
    
   end
   
//   (* mark_debug = "true" *)  reg [31:0] RegFile[WriteData];
//	assign debug_reg2 = RegFile[WriteData];

endmodule