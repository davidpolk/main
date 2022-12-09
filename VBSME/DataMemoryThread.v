`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - data_memory.v
// Description - 32-Bit wide data memory.
//
// INPUTS:-
// Address: 32-Bit address input port.
// WriteData: 32-Bit input port.
// Clk: 1-Bit Input clock signal.
// MemWrite: 1-Bit control signal for memory write.
// MemRead: 1-Bit control signal for memory read.
//
// OUTPUTS:-
// ReadData: 32-Bit registered output port.
//
// FUNCTIONALITY:-
// Design the above memory similar to the 'RegisterFile' model in the previous 
// assignment.  Create a 1K memory, for which we need 10 bits.  In order to 
// implement byte addressing, we will use bits Address[11:2] to index the 
// memory location. The 'WriteData' value is written into the address 
// corresponding to Address[11:2] in the positive clock edge if 'MemWrite' 
// signal is 1. 'ReadData' is the value of memory location Address[11:2] if 
// 'MemRead' is 1, otherwise, it is 0x00000000. The reading of memory is not 
// clocked.
//
// you need to declare a 2d array. in this case we need an array of 1024 (1K)  
// 32-bit elements for the memory.   
// for example,  to declare an array of 256 32-bit elements, declaration is: reg[31:0] memory[0:255]
// if i continue with the same declaration, we need 8 bits to index to one of 256 elements. 
// however , address port for the data memory is 32 bits. from those 32 bits, least significant 2 
// bits help us index to one of the 4 bytes within a single word. therefore we only need bits [9-2] 
// of the "Address" input to index any of the 256 words. 
////////////////////////////////////////////////////////////////////////////////

module DataMemoryThread (Address, Clk, signalSAD,
writeData1, writeData2, writeData3, writeData4, writeData5, writeData6, writeData7, 
writeData8, writeData9, writeData10,
writeData11, writeData12, writeData13, writeData14, writeData15, writeData16); 

  input [31:0] Address; 	// Input Address 
  input signalSAD, Clk;
  output reg [31:0] writeData1, writeData2, writeData3, writeData4, writeData5, writeData6, writeData7, writeData8, writeData9, writeData10; 
  output reg [31:0] writeData11, writeData12, writeData13, writeData14, writeData15, writeData16;

  /* Please fill in the implementation here */
  reg[31:0] memory[0:4096];
    
  initial begin 
    $readmemh("memory.mem", memory);
  end

  always @ (posedge Clk) begin
    if (signalSAD == 1) begin
      writeData1  <= memory[(Address)];
      writeData2  <= memory[(Address + 1)];
      writeData3  <= memory[(Address + 2)];
      writeData4  <= memory[(Address + 3)];
      writeData5  <= memory[(Address + 64)];
      writeData6  <= memory[(Address + 65)];
      writeData7  <= memory[(Address + 66)];
      writeData8  <= memory[(Address + 67)];
      writeData9  <= memory[(Address + 128)];                                      
      writeData10 <= memory[(Address + 129)];
      writeData11 <= memory[(Address + 130)];
      writeData12 <= memory[(Address + 131)];
      writeData13 <= memory[(Address + 192)];
      writeData14 <= memory[(Address + 193)];
      writeData15 <= memory[(Address + 194)];
      writeData16 <= memory[(Address + 195)];
    end
  end
  endmodule
                                        