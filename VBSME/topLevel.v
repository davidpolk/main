`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//          Richardo Larez 33.33%
//          David Polk 33.33%
//          Paz Davila 33.33%
// 
// Create Date: 10/21/2022 05:43:16 PM
// Design Name: 
// Module Name: TopLevel
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision: 1.0 
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module topLevel(InstructionOut, Clk, Reset, completeMEMWB, SADIndexOut, SADValOut, index);

  input Clk, Reset;
  input [31:0] InstructionOut;
  input [31:0] index;
  // output [7:0] SSDisplay;
  wire [31:0] MemtoRegOut;
  output [31:0] SADValOut, SADIndexOut;
  output completeMEMWB;
  
  wire [31:0]  JumpMuxOut, PCout, PCplusJump, PCDisplay;
  wire [31:0] Instruction, PCMuxOut, PCAdderout, IFIDPCout, IDEXPCout, EXMEMPCout, InstructionIn, InstructionOut, EXMEMPCDisplay, IFIDPCDisplay;
  wire [31:0]  IDEX_RD1out, IDEX_RD2out, EXMEM_RD2out, SEOut, IDEX_SEout, EXMEMSLL2out;
  wire [31:0] SLLout, JumpSLL2out, AdderOut, EXMEMAdderOut, ALUBinput, ALUResult, EXMEM_ALUResultOut, MEMWB_ALUResultOut, MemReadData, MEMWBMemRDout, JAL_MUX_OUT;
  wire [5:0] aluOp, ALUopout;
  wire [4:0] WriteRegisterOut, IDEXI20_16out, IDEXI15_11out, ALUcontrol, RegDstMuxOut, EXMEMWriteRegOut, Register1;
  wire [1:0] regDst, IDEXRegDstOut, MemReg, IDEXMemRegOut, EXMEMMemRegOut, MEMWBMemRegOut;
  wire [1:0] MemR, MemW, IDEXMemWOut, IDEXMemROut, EXMEMMemWOut, EXMEMMemROut;
  wire [25:0] IDEXI25_0out;
  wire Zero, EXMEMzeroOut, Reg1Signal, JAL_signal, JAL_SigOut, SADMuxSel, SADSignal, SADSigOut;
  wire regW, IDEXRegWout, EXMEMRegWOut, MEMWBRegWOut, jump, IDEXjumpOut, ALUsrc, IDEXALUsrcOut, Branch, IDEXBranchOut, EXMEMBranchOut, RegWriteOut, ANDout, EXMEMWrite, PCWrite, IFIDWrite;
  wire [31:0] in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16;
  wire [31:0]WD1, WD2, WD3, WD4, WD5, WD6, WD7, WD8, WD9, WD10, WD11, WD12, 
  WD13, WD14, WD15, WD16,
  writeData1, writeData2, writeData3,  writeData4, writeData5,
  writeData6, writeData7, writeData8, writeData9, writeData10,
  writeData11, writeData12, writeData13, writeData14, writeData15, writeData16,
  ReadData1, ReadData2, ReadData3, ReadData4, ReadData5, ReadData6, ReadData7, ReadData8, ReadData9, ReadData10, ReadData11, 
  ReadData12, ReadData13, ReadData14, ReadData15, ReadData16;

  
  
  // Stage 1
  
  
  //PC PC1(JumpMuxOut, PCout, Reset, Clk, PCWrite);
  
//  InstructionMemory InstructionMem(PCout, Instruction);
  
  //PCAdder PCAdder1(PCout, PCAdderout, 4);

  // IFIDRegister IFID(Instruction, InstructionOut,Complete, CompleteIF);

  //Stage 2
  
  DataHazard HazDect(InstructionOut, EXMEMWriteRegOut, WriteRegisterOut, PCWrite, IFIDWrite, EXMEMWrite);
  
  Controller Controller1(InstructionOut, aluOp, regW, jump, regDst, ALUsrc, Branch, MemR, MemW, MemReg, Reg1Signal, JAL_signal, SADMuxSel, SADSignal);
  
  Mux5Bit2To1 Register1Mux(Register1, InstructionOut[25:21], InstructionOut[20:16], Reg1Signal);

  //RegisterFile RegisterFile1(Register1, InstructionOut[20:16], WriteRegisterOut, MemtoRegOut, MEMWBRegWOut, Clk, ReadData1, ReadData2, v0, v1);
  RegFileThread RegThread(WD1, WD2, WD3, WD4, WD5, WD6, WD7, WD8, WD9, WD10, WD11, WD12, WD13, WD14, WD15, WD16, MEMWBRegWOut, Clk, 
  ReadData1, ReadData2, ReadData3, ReadData4, ReadData5, ReadData6, ReadData7, ReadData8, ReadData9, ReadData10, ReadData11, 
  ReadData12, ReadData13, ReadData14, ReadData15, ReadData16);

  ShiftLeft2 SLL2_Jump(InstructionOut [25:0], JumpSLL2out); //Double Check
  
  SignExtension SignExtend1(InstructionOut[15:0], SEOut);

  //ID/EX Pipeline Stage

  //IDEXRegister IDEX(Clk, aluOp, ALUopout, IFIDPCout, IDEXPCout, ReadData1, IDEX_RD1out, ReadData2, IDEX_RD2out, SEOut, IDEX_SEout, InstructionOut [20:16], IDEXI20_16out, InstructionOut [15:11], IDEXI15_11out, ALUsrc, IDEXALUsrcOut, regDst, IDEXRegDstOut, MemW, IDEXMemWOut, MemR, IDEXMemROut, Branch, IDEXBranchOut, MemReg, IDEXMemRegOut, regW, IDEXRegWout, InstructionOut [25:0], IDEXI25_0out, JAL_signal, JAL_SigOut);
  
  ShiftLeft2_32Bit SLL2_32(SEOut, SLLout);
  
  Adder AdderBranch(IFIDPCout, SLLout, AdderOut);

  Mux32Bit2To1 ALUsrcMux(ALUBinput, ReadData2, SEOut, ALUsrc);
  
  ALU32BitController ALUController (SEOut, aluOp, ALUcontrol);

//  ALU32Bit ALU(ALUcontrol, ReadData1, ALUBinput, ALUResult, Zero); 
  
  ALUThread ALU1(index, ReadData1, ALUBinput, ReadData1, ReadData2, ReadData3, ReadData4, ReadData5, ReadData6, ReadData7, 
  ReadData8, ReadData9, ReadData10, ReadData11, 
  ReadData12, ReadData13, ReadData14, ReadData15, ReadData16, ALUResult, ALUcontrol, Zero);

  SADMux SADValMux(Clk, SADValOut, ALUResult, 9999, SADMuxSel);
  
  Adder SADindexCalc(SEOut, index, SADIndexOut);
  
//  SADMux SADIndexMux(Clk, SADIndexOut, ALUResult, 99, SADMuxSel);
  
  AND ANDGate(Branch, Zero, ANDout);

  RegDstMux3x1 RegDstMux(RegDstMuxOut, InstructionOut [15:11], InstructionOut [20:16],  5'b11111, regDst); 
  
  Mux32Bit2To1 JALMux(JAL_MUX_OUT, AdderOut, ReadData1, JAL_signal);
  
 
  
  //STAGE 3 
  EXMEMRegister EXMEM(Clk, IFIDPCout, EXMEMPCout, Zero, EXMEMzeroOut, ALUResult, EXMEM_ALUResultOut, ReadData2, 
  EXMEM_RD2out, RegDstMuxOut, EXMEMWriteRegOut, regW, EXMEMRegWOut, MemReg, EXMEMMemRegOut, Branch, EXMEMBranchOut, 
  MemR, EXMEMMemROut, MemW, EXMEMMemWOut, JAL_MUX_OUT, EXMEMAdderOut, JumpSLL2out, EXMEMSLL2out, EXMEMWrite, IFIDPCDisplay, 
  EXMEMPCDisplay, SADSignal, SADSigOut);

//  AND ANDGate(EXMEMBranchOut, EXMEMzeroOut, ANDout);
  
  //DataMemory MemoryRegister(EXMEM_ALUResultOut, EXMEM_RD2out, Clk, EXMEMMemWOut, EXMEMMemROut, MemReadData); 
   DataMemoryThread DMThread(EXMEM_ALUResultOut, Clk, SADSigOut,
    writeData1, writeData2, writeData3, writeData4, writeData5, writeData6, writeData7, 
    writeData8, writeData9, writeData10,
    writeData11, writeData12, writeData13, writeData14, writeData15, writeData16); 
  

  //PIPLINE REGISTERS
  
  MEMWBRegister MEMWB(Clk, EXMEMRegWOut, MEMWBRegWOut, EXMEMMemRegOut, MEMWBMemRegOut, MemReadData, 
                        MEMWBMemRDout, EXMEM_ALUResultOut, MEMWB_ALUResultOut, EXMEMWriteRegOut, WriteRegisterOut, EXMEMPCout, 
                        PCplusJump, EXMEMPCDisplay, PCDisplay, writeData1, writeData2, writeData3,  writeData4, writeData5,
                        writeData6, writeData7, writeData8, writeData9, writeData10,
                        writeData11, writeData12, writeData13, writeData14, writeData15, writeData16,
                        WD1, WD2, WD3, WD4, WD5, WD6, WD7, WD8, WD9, WD10, WD11, WD12, WD13, WD14, WD15, WD16);

  Mux32Bit3To1 MemtoRegMux(MemtoRegOut, MEMWBMemRDout, MEMWB_ALUResultOut, PCplusJump, MEMWBMemRegOut);

  Mux32Bit2To1 PCMux(PCMuxOut, PCAdderout, JAL_MUX_OUT, ANDout);

  Mux32Bit2To1 jumpMux(JumpMuxOut, PCMuxOut, JumpSLL2out, jump);
  
  
//  (* mark_debug = "true" *) wire [31:0] debug_reg1;
//  (* mark_debug = "true" *) wire [31:0] debug_reg2;

 
endmodule
