`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2022 04:53:21 PM
// Design Name: 
// Module Name: Thread_Top
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


module Thread_Top(Clk, Reset, xSad, ySad, SAD);

    input Clk, Reset;
    wire [31:0] PCAdderout, Instruction, PCin, PCout, Address, v0, v1, CurrSAD1, CurrSAD2, CurrSAD3, CurrSAD4, CurrSAD5, CurrSAD6, CurrSAD7, CurrSAD8, CurrSAD9, CurrSAD10, CurrSAD11, CurrSAD12, CurrSAD13,
    CurrSAD14, CurrSAD15, CurrSAD16, CurrSAD17, CurrSAD18, CurrSAD19, CurrSAD20, CurrSAD21, CurrSAD22, CurrSAD23, CurrSAD24, CurrSAD25, CurrSAD26, CurrSAD27,
    CurrSAD28, CurrSAD29, CurrSAD30, CurrSAD31, CurrSAD32, CurrSAD33, CurrSAD34, CurrSAD35, CurrSAD36, CurrSAD37, CurrSAD38, CurrSAD39, CurrSAD40, CurrSAD41,
    CurrSAD42, CurrSAD43, CurrSAD44, CurrSAD45, CurrSAD46, CurrSAD47, CurrSAD48, CurrSAD49, CurrSAD50, CurrSAD51, CurrSAD52, CurrSAD53, CurrSAD54, CurrSAD55,
    CurrSAD56, CurrSAD57, CurrSAD58, CurrSAD59,CurrSAD60, sadout,
    index1, index2, index3, index4, index5, index6, index7, index8, index9, index10, index11, index12, index13,
    index14, index15, index16, index17, index18, index19, index20, index21, index22, index23, index24, index25, index26, index27,
    index28, index29, index30, index31, index32, index33, index34, index35, index36, index37, index38, index39, index40, index41,
    index42, index43, index44, index45, index46, index47, index48, index49, index50, index51, index52, index53, index54, index55,
    index56, index57, index58, index59,index60, x_coord, y_coord, x_out, y_out, CurrSAD, CurrSADout, CurrIndex,
    CurrSADOut1_1, CurrSADOut1_2,CurrSADOut1_3, CurrSADOut1_4, CurrSADOut1_5, CurrSADOut1_6, CurrSADOut1_7, CurrSADOut1_8, CurrSADOut1_9, CurrSADOut1_10, 
    CurrSADOut1_11, CurrSADOut1_12, CurrSADOut1_13, CurrSADOut1_14, CurrSADOut1_15, CurrSADOut1_16, CurrSADOut1_17,CurrSADOut1_18, CurrSADOut1_19, 
    CurrSADOut1_20, CurrSADOut1_21, CurrSADOut1_22, CurrSADOut1_23, CurrSADOut1_24, CurrSADOut1_25, CurrSADOut1_26, CurrSADOut1_27, CurrSADOut1_28, 
    CurrSADOut1_29, CurrSADOut1_30,  
    indexOut1_1, indexOut1_2, indexOut1_3,indexOut1_4, indexOut1_5, indexOut1_6, indexOut1_7, indexOut1_8, indexOut1_9, indexOut1_10, indexOut1_11, 
    indexOut1_12, indexOut1_13, indexOut1_14, indexOut1_15, indexOut1_16, indexOut1_17, indexOut1_18, indexOut1_19, indexOut1_20, indexOut1_21, 
    indexOut1_22, indexOut1_23, indexOut1_24, indexOut1_25, indexOut1_26, indexOut1_27, indexOut1_28, indexOut1_29, indexOut1_30,
    CurrSADOut2_1, CurrSADOut2_2,CurrSADOut2_3, CurrSADOut2_4, CurrSADOut2_5, CurrSADOut2_6, CurrSADOut2_7, CurrSADOut2_8, CurrSADOut2_9, CurrSADOut2_10, 
    CurrSADOut2_11, CurrSADOut2_12, CurrSADOut2_13, CurrSADOut2_14, CurrSADOut2_15,
    indexOut2_1, indexOut2_2, indexOut2_3,indexOut2_4, indexOut2_5, indexOut2_6, indexOut2_7, indexOut2_8, indexOut2_9, indexOut2_10, indexOut2_11, 
    indexOut2_12, indexOut2_13, indexOut2_14, indexOut2_15,
    CurrSADOut3_1, CurrSADOut3_2,CurrSADOut3_3, CurrSADOut3_4, CurrSADOut3_5, CurrSADOut3_6, CurrSADOut3_7, CurrSADOut3_8,
    indexOut3_1, indexOut3_2, indexOut3_3,indexOut3_4, indexOut3_5, indexOut3_6, indexOut3_7, indexOut3_8,
    CurrSADOut4_1, CurrSADOut4_2, CurrSADOut4_3, CurrSADOut4_4, indexOut4_1, indexOut4_2, indexOut4_3, indexOut4_4,
    CurrSADOut5_1, CurrSADOut5_2,indexOut5_1, indexOut5_2;
    
    wire PCWrite, SADsignal;
    wire MemtoRegOut;
    output wire [31:0] xSad, ySad, SAD;
    
    
    
    
    //Instruction Fetch to send to individual threads
    PC PC1(PCAdderout, PCout, Reset, Clk);
    InstructionMemory InstructionMem(PCout, Instruction);
    PCAdder PCAdder1(PCout, PCAdderout, 1);
    //InstructionHazard hazard(in1, in2, PCWrite);
    TopThreadController threadController(Instruction, SADsignal);
  

    
    //Each Thread calculates the SAD at that given index
    topLevel thread1(Instruction, Clk, Reset, MemtoRegOut, index1, CurrSAD1, 0);
    topLevel thread2(Instruction, Clk, Reset, MemtoRegOut, index2, CurrSAD2, 1);
    topLevel thread3(Instruction, Clk, Reset, MemtoRegOut, index3, CurrSAD3, 2);
    topLevel thread4(Instruction, Clk, Reset, MemtoRegOut, index4, CurrSAD4, 3);
//    topLevel thread5(Instruction, Clk, Reset, MemtoRegOut, index5, CurrSAD5, 4);
//    topLevel thread6(Instruction, Clk, Reset, MemtoRegOut, index6, CurrSAD6, 5);
//    topLevel thread7(Instruction, Clk, Reset, MemtoRegOut, index7, CurrSAD7, 6);
//    topLevel thread8(Instruction, Clk, Reset, MemtoRegOut, index8, CurrSAD8, 7);
//    topLevel thread9(Instruction, Clk, Reset, MemtoRegOut, index9, CurrSAD9, 8);
//    topLevel thread10(Instruction, Clk, Reset, MemtoRegOut, index10, CurrSAD10, 9);
//    topLevel thread11(Instruction, Clk, Reset, MemtoRegOut, index11, CurrSAD11, 10);
//    topLevel thread12(Instruction, Clk, Reset, MemtoRegOut, index12, CurrSAD12, 11);
//    topLevel thread13(Instruction, Clk, Reset, MemtoRegOut, index13, CurrSAD13, 12);
//    topLevel thread14(Instruction, Clk, Reset, MemtoRegOut, index14, CurrSAD14, 13);
//    topLevel thread15(Instruction, Clk, Reset, MemtoRegOut, index15, CurrSAD15, 14);
//    topLevel thread16(Instruction, Clk, Reset, MemtoRegOut, index16, CurrSAD16, 15);
//    topLevel thread17(Instruction, Clk, Reset, MemtoRegOut, index17, CurrSAD17, 16);
//    topLevel thread18(Instruction, Clk, Reset, MemtoRegOut, index18, CurrSAD18, 17);
//    topLevel thread19(Instruction, Clk, Reset, MemtoRegOut, index19, CurrSAD19, 18);
//    topLevel thread20(Instruction, Clk, Reset, MemtoRegOut, index20, CurrSAD20, 19);
//    topLevel thread21(Instruction, Clk, Reset, MemtoRegOut, index21, CurrSAD21, 20);
//    topLevel thread22(Instruction, Clk, Reset, MemtoRegOut, index22, CurrSAD22, 21);
//    topLevel thread23(Instruction, Clk, Reset, MemtoRegOut, index23, CurrSAD23, 22);
//    topLevel thread24(Instruction, Clk, Reset, MemtoRegOut, index24, CurrSAD24, 23);
//    topLevel thread25(Instruction, Clk, Reset, MemtoRegOut, index25, CurrSAD25, 24);
//    topLevel thread26(Instruction, Clk, Reset, MemtoRegOut, index26, CurrSAD26, 25);
//    topLevel thread27(Instruction, Clk, Reset, MemtoRegOut, index27, CurrSAD27, 26);
//    topLevel thread28(Instruction, Clk, Reset, MemtoRegOut, index28, CurrSAD28, 27);
//    topLevel thread29(Instruction, Clk, Reset, MemtoRegOut, index29, CurrSAD29, 28);
//    topLevel thread30(Instruction, Clk, Reset, MemtoRegOut, index30, CurrSAD30, 29);
//    topLevel thread31(Instruction, Clk, Reset, MemtoRegOut, index31, CurrSAD31, 30);
//    topLevel thread32(Instruction, Clk, Reset, MemtoRegOut, index32, CurrSAD32, 31);
//    topLevel thread33(Instruction, Clk, Reset, MemtoRegOut, index33, CurrSAD33, 32);
//    topLevel thread34(Instruction, Clk, Reset, MemtoRegOut, index34, CurrSAD34, 33);
//    topLevel thread35(Instruction, Clk, Reset, MemtoRegOut, index35, CurrSAD35, 34);
//    topLevel thread36(Instruction, Clk, Reset, MemtoRegOut, index36, CurrSAD36, 35);
//    topLevel thread37(Instruction, Clk, Reset, MemtoRegOut, index37, CurrSAD37, 36);
//    topLevel thread38(Instruction, Clk, Reset, MemtoRegOut, index38, CurrSAD38, 37);
//    topLevel thread39(Instruction, Clk, Reset, MemtoRegOut, index39, CurrSAD39, 38);
//    topLevel thread40(Instruction, Clk, Reset, MemtoRegOut, index40, CurrSAD40, 39);
//    topLevel thread41(Instruction, Clk, Reset, MemtoRegOut, index41, CurrSAD41, 40);
//    topLevel thread42(Instruction, Clk, Reset, MemtoRegOut, index42, CurrSAD42, 41);
//    topLevel thread43(Instruction, Clk, Reset, MemtoRegOut, index43, CurrSAD43, 42);
//    topLevel thread44(Instruction, Clk, Reset, MemtoRegOut, index44, CurrSAD44, 43);
//    topLevel thread45(Instruction, Clk, Reset, MemtoRegOut, index45, CurrSAD45, 44);
//    topLevel thread46(Instruction, Clk, Reset, MemtoRegOut, index46, CurrSAD46, 45);
//    topLevel thread47(Instruction, Clk, Reset, MemtoRegOut, index47, CurrSAD47, 46);
//    topLevel thread48(Instruction, Clk, Reset, MemtoRegOut, index48, CurrSAD48, 47);
//    topLevel thread49(Instruction, Clk, Reset, MemtoRegOut, index49, CurrSAD49, 48);
//    topLevel thread50(Instruction, Clk, Reset, MemtoRegOut, index50, CurrSAD50, 49);
//    topLevel thread51(Instruction, Clk, Reset, MemtoRegOut, index51, CurrSAD51, 50);
//    topLevel thread52(Instruction, Clk, Reset, MemtoRegOut, index52, CurrSAD52, 51);
//    topLevel thread53(Instruction, Clk, Reset, MemtoRegOut, index53, CurrSAD53, 52);
//    topLevel thread54(Instruction, Clk, Reset, MemtoRegOut, index54, CurrSAD54, 53);
//    topLevel thread55(Instruction, Clk, Reset, MemtoRegOut, index55, CurrSAD55, 54);
//    topLevel thread56(Instruction, Clk, Reset, MemtoRegOut, index56, CurrSAD56, 55);
//    topLevel thread57(Instruction, Clk, Reset, MemtoRegOut, index57, CurrSAD57, 56);
//    topLevel thread58(Instruction, Clk, Reset, MemtoRegOut, index58, CurrSAD58, 57);
//    topLevel thread59(Instruction, Clk, Reset, MemtoRegOut, index59, CurrSAD59, 58);
//    topLevel thread60(Instruction, Clk, Reset, MemtoRegOut, index60, CurrSAD60, 59);
    
    

    
    SADCompare1x2 CurrSADCompare1_1(CurrSAD1, CurrSAD2, index1, index2, CurrSADOut1_1, indexOut1_1);
    SADCompare1x2 CurrSADCompare1_2(CurrSAD3, CurrSAD4, index3, index4, CurrSADOut1_2, indexOut1_2);
//    SADCompare1x2 CurrSADCompare1_3(CurrSAD5, CurrSAD6, index5, index6, CurrSADOut1_3, indexOut1_3);
//    SADCompare1x2 CurrSADCompare1_4(CurrSAD7, CurrSAD8, index7, index8, CurrSADOut1_4, indexOut1_4);
//    SADCompare1x2 CurrSADCompare1_5(CurrSAD9, CurrSAD10, index9, index10, CurrSADOut1_5, indexOut1_5);
//    SADCompare1x2 CurrSADCompare1_6(CurrSAD11, CurrSAD12, index11, index12, CurrSADOut1_6, indexOut1_6);
//    SADCompare1x2 CurrSADCompare1_7(CurrSAD13, CurrSAD14, index13, index14, CurrSADOut1_7, indexOut1_7);
//    SADCompare1x2 CurrSADCompare1_8(CurrSAD15, CurrSAD16, index15, index16, CurrSADOut1_8, indexOut1_8);
//    SADCompare1x2 CurrSADCompare1_9(CurrSAD17, CurrSAD18, index17, index18, CurrSADOut1_9, indexOut1_9);
//    SADCompare1x2 CurrSADCompare1_10(CurrSAD19, CurrSAD20, index19, index20, CurrSADOut1_10, indexOut1_10);
//    SADCompare1x2 CurrSADCompare1_11(CurrSAD21, CurrSAD22, index21, index22, CurrSADOut1_11, indexOut1_11);
//    SADCompare1x2 CurrSADCompare1_12(CurrSAD23, CurrSAD24, index23, index24, CurrSADOut1_12, indexOut1_12);
//    SADCompare1x2 CurrSADCompare1_13(CurrSAD25, CurrSAD26, index25, index26, CurrSADOut1_13, indexOut1_13);
//    SADCompare1x2 CurrSADCompare1_14(CurrSAD27, CurrSAD28, index27, index28, CurrSADOut1_14, indexOut1_14);
//    SADCompare1x2 CurrSADCompare1_15(CurrSAD29, CurrSAD30, index29, index30, CurrSADOut1_15, indexOut1_15);
//    SADCompare1x2 CurrSADCompare1_16(CurrSAD31, CurrSAD32, index31, index32, CurrSADOut1_16, indexOut1_16);
//    SADCompare1x2 CurrSADCompare1_17(CurrSAD33, CurrSAD34, index33, index34, CurrSADOut1_17, indexOut1_17);
//    SADCompare1x2 CurrSADCompare1_18(CurrSAD35, CurrSAD36, index35, index36, CurrSADOut1_18, indexOut1_18);
//    SADCompare1x2 CurrSADCompare1_19(CurrSAD37, CurrSAD38, index37, index38, CurrSADOut1_19, indexOut1_19);
//    SADCompare1x2 CurrSADCompare1_20(CurrSAD39, CurrSAD40, index39, index40, CurrSADOut1_20, indexOut1_20);
//    SADCompare1x2 CurrSADCompare1_21(CurrSAD41, CurrSAD42, index41, index42, CurrSADOut1_21, indexOut1_21);
//    SADCompare1x2 CurrSADCompare1_22(CurrSAD43, CurrSAD44, index43, index44, CurrSADOut1_22, indexOut1_22);
//    SADCompare1x2 CurrSADCompare1_23(CurrSAD45, CurrSAD46, index45, index46, CurrSADOut1_23, indexOut1_23);
//    SADCompare1x2 CurrSADCompare1_24(CurrSAD47, CurrSAD48, index47, index48, CurrSADOut1_24, indexOut1_24);
//    SADCompare1x2 CurrSADCompare1_25(CurrSAD49, CurrSAD50, index49, index50, CurrSADOut1_25, indexOut1_25);
//    SADCompare1x2 CurrSADCompare1_26(CurrSAD51, CurrSAD52, index51, index52, CurrSADOut1_26, indexOut1_26);
//    SADCompare1x2 CurrSADCompare1_27(CurrSAD53, CurrSAD54, index53, index54, CurrSADOut1_27, indexOut1_27);
//    SADCompare1x2 CurrSADCompare1_28(CurrSAD55, CurrSAD56, index55, index56, CurrSADOut1_28, indexOut1_28);
//    SADCompare1x2 CurrSADCompare1_29(CurrSAD57, CurrSAD58, index57, index58, CurrSADOut1_29, indexOut1_29);
//    SADCompare1x2 CurrSADCompare1_30(CurrSAD59, CurrSAD60, index59, index60, CurrSADOut1_30, indexOut1_30);
    
    SADCompare1x2 CurrSADCompare2_1(CurrSADOut1_1, CurrSADOut1_2, indexOut1_1, indexOut1_2, CurrSAD, CurrIndex);
//    SADCompare1x2 CurrSADCompare2_2(CurrSADOut1_3, CurrSADOut1_4, indexOut1_3, indexOut1_4, CurrSADOut2_2, indexOut2_2);
//    SADCompare1x2 CurrSADCompare2_3(CurrSADOut1_5, CurrSADOut1_6, indexOut1_5, indexOut1_6, CurrSADOut2_3, indexOut2_3);
//    SADCompare1x2 CurrSADCompare2_4(CurrSADOut1_7, CurrSADOut1_8, indexOut1_7, indexOut1_8, CurrSADOut2_4, indexOut2_4);
//    SADCompare1x2 CurrSADCompare2_5(CurrSADOut1_9, CurrSADOut1_10, indexOut1_9, indexOut1_10, CurrSADOut2_5, indexOut2_5);
//    SADCompare1x2 CurrSADCompare2_6(CurrSADOut1_11, CurrSADOut1_12, indexOut1_11, indexOut1_12, CurrSADOut2_6, indexOut2_6);
//    SADCompare1x2 CurrSADCompare2_7(CurrSADOut1_13, CurrSADOut1_14, indexOut1_13, indexOut1_14, CurrSADOut2_7, indexOut2_7);
//    SADCompare1x2 CurrSADCompare2_8(CurrSADOut1_15, CurrSADOut1_16, indexOut1_15, indexOut1_16, CurrSADOut2_8, indexOut2_8);
//    SADCompare1x2 CurrSADCompare2_9(CurrSADOut1_17, CurrSADOut1_18, indexOut1_17, indexOut1_18, CurrSADOut2_9, indexOut2_9);
//    SADCompare1x2 CurrSADCompare2_10(CurrSADOut1_19, CurrSADOut1_20, indexOut1_19, indexOut1_20, CurrSADOut2_10, indexOut2_10);
//    SADCompare1x2 CurrSADCompare2_11(CurrSADOut1_21, CurrSADOut1_22, indexOut1_21, indexOut1_22, CurrSADOut2_11, indexOut2_11);
//    SADCompare1x2 CurrSADCompare2_12(CurrSADOut1_23, CurrSADOut1_24, indexOut1_23, indexOut1_24, CurrSADOut2_12, indexOut2_12);
//    SADCompare1x2 CurrSADCompare2_13(CurrSADOut1_25, CurrSADOut1_26, indexOut1_25, indexOut1_26, CurrSADOut2_13, indexOut2_13);
//    SADCompare1x2 CurrSADCompare2_14(CurrSADOut1_27, CurrSADOut1_28, indexOut1_27, indexOut1_28, CurrSADOut2_14, indexOut2_14);
//    SADCompare1x2 CurrSADCompare2_15(CurrSADOut1_29, CurrSADOut1_30, indexOut1_29, indexOut1_30, CurrSADOut2_15, indexOut2_15);
    
//    SADCompare1x2 CurrSADCompare3_1(CurrSADOut2_1, CurrSADOut2_2, indexOut2_1, indexOut2_2, CurrSADOut3_1, indexOut3_1);
//    SADCompare1x2 CurrSADCompare3_2(CurrSADOut2_3, CurrSADOut2_4, indexOut2_3, indexOut2_4, CurrSADOut3_2, indexOut3_2);
//    SADCompare1x2 CurrSADCompare3_3(CurrSADOut2_5, CurrSADOut2_6, indexOut2_5, indexOut2_6, CurrSADOut3_3, indexOut3_3);
//    SADCompare1x2 CurrSADCompare3_4(CurrSADOut2_7, CurrSADOut2_8, indexOut2_7, indexOut2_8, CurrSADOut3_4, indexOut3_4);
//    SADCompare1x2 CurrSADCompare3_5(CurrSADOut2_9, CurrSADOut2_10, indexOut2_9, indexOut2_10, CurrSADOut3_5, indexOut3_5);
//    SADCompare1x2 CurrSADCompare3_6(CurrSADOut2_11, CurrSADOut2_12, indexOut2_11, indexOut2_12, CurrSADOut3_6, indexOut3_6);
//    SADCompare1x2 CurrSADCompare3_7(CurrSADOut2_13, CurrSADOut2_14, indexOut2_13, indexOut2_14, CurrSADOut3_7, indexOut3_7);
//    SADCompare1x2 CurrSADCompare3_8(CurrSADOut2_15, CurrSADOut3_7, indexOut2_15, indexOut3_7, CurrSADOut3_8, indexOut3_8);
    
//    SADCompare1x2 CurrSADCompare4_1(CurrSADOut3_1, CurrSADOut3_2, indexOut3_1, indexOut3_2, CurrSADOut4_1, indexOut4_1);
//    SADCompare1x2 CurrSADCompare4_2(CurrSADOut3_3, CurrSADOut3_4, indexOut3_3, indexOut3_4, CurrSADOut4_2, indexOut4_2);
//    SADCompare1x2 CurrSADCompare4_3(CurrSADOut3_5, CurrSADOut3_6, indexOut3_5, indexOut3_6, CurrSADOut4_3, indexOut4_3);
//    SADCompare1x2 CurrSADCompare4_4(CurrSADOut3_7, CurrSADOut3_8, indexOut3_7, indexOut3_8, CurrSADOut4_4, indexOut4_4);
    
    
//    SADCompare1x2 CurrSADCompare5_1(CurrSADOut4_1, CurrSADOut4_2, indexOut4_1, indexOut4_2, CurrSADOut5_1, indexOut5_1);
//    SADCompare1x2 CurrSADCompare5_2(CurrSADOut4_3, CurrSADOut4_4, indexOut4_3, indexOut4_4, CurrSADOut5_2, indexOut5_2);
    
//    SADCompare1x2 CurrSADCompare6_1(CurrSADOut5_1, CurrSADOut5_2, indexOut5_1, indexOut5_2, CurrSAD, CurrIndex);
    

    
    //    SADCompare30x15 CurrSADCompare1(CurrSAD1, CurrSAD2, CurrSAD3, CurrSAD4, CurrSAD5, 
//    CurrSAD6, CurrSAD7, CurrSAD8, CurrSAD9, CurrSAD10, CurrSAD11, CurrSAD12, CurrSAD13,
//    CurrSAD14, CurrSAD15, CurrSAD16, CurrSAD17, CurrSAD18, CurrSAD19, CurrSAD20, CurrSAD21, 
//    CurrSAD22, CurrSAD23, CurrSAD24, CurrSAD25, CurrSAD26, CurrSAD27, CurrSAD28, CurrSAD29, CurrSAD30,
//    index1, index2, index3, index4, index5, index6, index7, index8, index9, index10, index11, 
//    index12, index13, index14, index15, index16, index17, index18, index19, index20, index21, index22, 
//    index23, index24, index25, index26, index27, index28, index29, index30, CurrSADout1, CurrSADout2, 
//    CurrSADout3, CurrSADout4, CurrSADout5, CurrSADout6, CurrSADout7, CurrSADout8, CurrSADout9, CurrSADout10, 
//    CurrSADout11, CurrSADout12, CurrSADout13, CurrSADout14, CurrSADout15,indexOut1, indexOut2, indexOut3, 
//    indexOut4, indexOut5, indexOut6, indexOut7, indexOut8, indexOut9, indexOut10, indexOut11, indexOut12, 
//    indexOut13, indexOut14, indexOut15);
    
//    SADCompare30x15 CurrSADCompare2(CurrSAD31, CurrSAD32, CurrSAD33, CurrSAD34, CurrSAD35, 
//    CurrSAD36, CurrSAD37, CurrSAD38, CurrSAD39, CurrSAD40, CurrSAD41, CurrSAD42, CurrSAD43,
//    CurrSAD44, CurrSAD45, CurrSAD46, CurrSAD47, CurrSAD48, CurrSAD49, CurrSAD50, CurrSAD51, 
//    CurrSAD52, CurrSAD53, CurrSAD54, CurrSAD55, CurrSAD56, CurrSAD57, CurrSAD58, CurrSAD59, CurrSAD60,
//    index31, index32, index33, index34, index35, index36, index37, index38, index39, index40, index41, 
//    index42, index43, index44, index45, index46, index47, index48, index49, index50, index51, index52, 
//    index53, index54, index55, index56, index57, index58, index59, index60, CurrSADout16, CurrSADout17, 
//    CurrSADout18, CurrSADout19, CurrSADout20, CurrSADout21, CurrSADout22, CurrSADout23, CurrSADout24, CurrSADout25, 
//    CurrSADout26, CurrSADout27, CurrSADout28, CurrSADout29, CurrSADout30, indexOut16, indexOut17, indexOut18, 
//    indexOut19, indexOut20, indexOut21, indexOut22, indexOut23, indexOut24, indexOut25, indexOut26, indexOut27, 
//    indexOut28, indexOut29, indexOut30);
//    SADCompare30x15 CurrSADCompare3(CurrSADout1, CurrSADout2, 
//    CurrSADout3, CurrSADout4, CurrSADout5, CurrSADout6, CurrSADout7, CurrSADout8, CurrSADout9, CurrSADout10, 
//    CurrSADout11, CurrSADout12, CurrSADout13, CurrSADout14, CurrSADout15, CurrSADout16, CurrSADout17, 
//    CurrSADout18, CurrSADout19, CurrSADout20, CurrSADout21, CurrSADout22, CurrSADout23, CurrSADout24, CurrSADout25, 
//    CurrSADout26, CurrSADout27, CurrSADout28, CurrSADout29, CurrSADout30, indexOut1, indexOut2, indexOut3, 
//    indexOut4, indexOut5, indexOut6, indexOut7, indexOut8, indexOut9, indexOut10, indexOut11, indexOut12, 
//    indexOut13, indexOut14, indexOut15, indexOut16, indexOut17, indexOut18, 
//    indexOut19, indexOut20, indexOut21, indexOut22, indexOut23, indexOut24, indexOut25, indexOut26, indexOut27, 
//    indexOut28, indexOut29, indexOut30, CurrSADout1_1, CurrSADout1_2, 
//    CurrSADout1_3, CurrSADout1_4, CurrSADout1_5, CurrSADout1_6, CurrSADout1_7, CurrSADout1_8, CurrSADout1_9, CurrSADout1_10, 
//    CurrSADout1_11, CurrSADout1_12, CurrSADout1_13, CurrSADout1_14, CurrSADout1_15,indexOut1_1, indexOut1_2, indexOut1_3, 
//    indexOut1_4, indexOut1_5, indexOut1_6, indexOut1_7, indexOut1_8, indexOut1_9, indexOut1_10, indexOut1_11, indexOut1_12, 
//    indexOut1_13, indexOut1_14, indexOut1_15);
    
//    SADCompare14x7 CurrSADCompare4(CurrSADout1_1, CurrSADout1_2, 
//    CurrSADout1_3, CurrSADout1_4, CurrSADout1_5, CurrSADout1_6, CurrSADout1_7, CurrSADout1_8, CurrSADout1_9, CurrSADout1_10, 
//    CurrSADout1_11, CurrSADout1_12, CurrSADout1_13, CurrSADout1_14, indexOut1_1, indexOut1_2, indexOut1_3, 
//    indexOut1_4, indexOut1_5, indexOut1_6, indexOut1_7, indexOut1_8, indexOut1_9, indexOut1_10, indexOut11, indexOut1_12, 
//    indexOut1_13, indexOut1_14, sadout2_1, sadout2_2, sadout2_3, sadout2_4, sadout2_5, sadout2_6, sadout2_7, 
//    indexOut2_1, indexOut2_2, indexOut2_3, indexOut2_4, indexOut2_5, indexOut2_6, indexOut2_7);
    
//    SADCompare6x3 CurrSADCompare5(sadout2_1, sadout2_2, sadout2_3, sadout2_4, sadout2_5, sadout2_6, indexOut2_1, indexOut2_2, indexOut2_3,
//    indexOut2_4, indexOut2_5, indexOut2_6, sadout3_1, sadout3_2, sadout3_3, indexOut3_1, indexOut3_2, indexOut3_3);
    
//    SADCompare1x2 CurrSADCompare6(sadout3_1, sadout3_2, indexOut3_1, indexOut3_2, sadout4_1, indexOut4_1);
//    SADCompare1x2 CurrSADCompare7(CurrSADout1_15, sadout2_7, indexOut1_15, indexOut2_7, sadout4_2, indexOut4_2);
    
//    SADCompare1x2 CurrSADCompare8(sadout4_1, sadout4_2, indexOut4_1, indexOut4_2, sadout5_1, indexOut5_1);
//    SADCompare1x2 CurrSADCompare9(sadout5_1, sadout3_3, indexOut5_1, indexOut3_3, CurrSAD, CurrIndex);
    
//    SADCompare compare(CurrSAD1, CurrSAD2, CurrSAD3, CurrSAD4, CurrSAD5, CurrSAD6, CurrSAD7, CurrSAD8, CurrSAD9, CurrSAD10, CurrSAD11, CurrSAD12, CurrSAD13,
//    CurrSAD14, CurrSAD15, CurrSAD16, CurrSAD17, CurrSAD18, CurrSAD19, CurrSAD20, CurrSAD21, CurrSAD22, CurrSAD23, CurrSAD24, CurrSAD25, CurrSAD26, CurrSAD27,
//    CurrSAD28, CurrSAD29, CurrSAD30, CurrSAD31, CurrSAD32, CurrSAD33, CurrSAD34, CurrSAD35, CurrSAD36, CurrSAD37, CurrSAD38, CurrSAD39, CurrSAD40, CurrSAD41,
//    CurrSAD42, CurrSAD43, CurrSAD44, CurrSAD45, CurrSAD46, CurrSAD47, CurrSAD48, CurrSAD49, CurrSAD50, CurrSAD51, CurrSAD52, CurrSAD53, CurrSAD54, CurrSAD55,
//    CurrSAD56, CurrSAD57, CurrSAD58, CurrSAD59,CurrSAD60, sadout, 
//    index1, index2, index3, index4, index5, index6, index7, index8, index9, index10, index11, index12, index13,
//    index14, index15, index16, index17, index18, index19, index20, index21, index22, index23, index24, index25, index26, index27,
//    index28, index29, index30, index31, index32, index33, index34, index35, index36, index37, index38, index39, index40, index41,
//    index42, index43, index44, index45, index46, index47, index48, index49, index50, index51, index52, index53, index54, index55,
//    index56, index57, index58, index59,index60, x_coord, y_coord);
    
    SADCoordinateX SADCoorX(CurrIndex, x_coord);
    SADCoordinateY SADCoorY(CurrIndex, x_coord, y_coord);
    Mux32Bit6To3 SADInstructionMux(CurrSAD, x_coord, y_coord, 9999, 99, 99, CurrSADout, x_out, y_out, SADsignal);
    CurrSadCompare SadOut(Clk, x_out, y_out, CurrSADout, xSad, ySad, SAD);
    
    
endmodule
