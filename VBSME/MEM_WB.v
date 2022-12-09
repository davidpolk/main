`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2022 02:14:51 AM
// Design Name: 
// Module Name: MEM-WBRegister
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MEMWBRegister(Clk, RegWriteIn, RegWriteOut, MemToRegIn, MemToRegOut, RDin, RDout, ALUResultIn, 
ALUResultOut, WriteRegisterIn, WriteRegisterOut, PCin, PCout, EXMEMPCDisplay, PCDisplay, writeData1, writeData2, writeData3,  writeData4, writeData5,
   writeData6, writeData7, writeData8, writeData9, writeData10,
   writeData11, writeData12, writeData13, writeData14, writeData15, writeData16,
   WD1, WD2, WD3, WD4, WD5, WD6, WD7, WD8, WD9, WD10, WD11, WD12, WD13, WD14, WD15, WD16);

    input RegWriteIn, Clk;
    output reg RegWriteOut;

    input [1:0] MemToRegIn;
    output reg [1:0] MemToRegOut;
    
    input [4:0] WriteRegisterIn;
    output reg [4:0]  WriteRegisterOut; 
    
  input [31:0] RDin, ALUResultIn, PCin, EXMEMPCDisplay;
  output reg [31:0] RDout, ALUResultOut, PCout, PCDisplay;
  
  input [31:0] writeData1, writeData2, writeData3,  writeData4, writeData5,
               writeData6, writeData7, writeData8, writeData9, writeData10,
               writeData11, writeData12, writeData13, writeData14, writeData15, writeData16;
  output reg [31:0] WD1, WD2, WD3, WD4, WD5, WD6, WD7, WD8, WD9, WD10, WD11, WD12, WD13, WD14, WD15, WD16;
     
  always @ (posedge Clk) begin
        RegWriteOut <= RegWriteIn;
        RDout <= RDin;
        ALUResultOut <= ALUResultIn; 
        WriteRegisterOut <= WriteRegisterIn;
        MemToRegOut <= MemToRegIn;
        PCout <= PCin;
        PCDisplay <= EXMEMPCDisplay; 
        WD1 <= writeData1;
        WD2 <= writeData2;
        WD3 <= writeData3;
        WD4 <= writeData4;
        WD5 <= writeData5;
        WD6 <= writeData6;
        WD7 <= writeData7;
        WD8 <= writeData8;
        WD9 <= writeData9;
        WD10 <= writeData10;
        WD11 <= writeData11;
        WD12 <= writeData12;
        WD13 <= writeData13;
        WD14 <= writeData14;
        WD15 <= writeData15;
        WD16 <= writeData16;
    end
    
endmodule
