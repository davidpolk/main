`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2022 03:17:23 PM
// Design Name: 
// Module Name: ID_EX
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


module IDEXRegister(Clk, ALUopin, ALUopout, PCin, PCout, RD1in, RD1out, RD2in, RD2out, I15_0in, I15_0out, I20_16in, I20_16out, I15_11in, I15_11out, ALUsrcIn, ALUsrcOut, REGdstIn, REGdstOut, MemWIn, MemWOut, MemRIn, MemROut, BranchIn, BranchOut, MemtoRegIn, MemtoRegOut, RegWIn, RegWOut, I25_0in, I25_0out, JAL_Sig_in, JAL_Sig_out);

    input [31:0] PCin, RD1in, RD2in, I15_0in;
    output reg [31:0] PCout, RD1out, RD2out, I15_0out;

    input [25:0] I25_0in;
    output reg [25:0] I25_0out;
    
    input [4:0] I20_16in, I15_11in;
    output reg [4:0] I20_16out, I15_11out;

    input[5:0] ALUopin;
    output reg[5:0] ALUopout;
    
    input [1:0] REGdstIn, MemtoRegIn, MemWIn, MemRIn;
    output reg [1:0] REGdstOut, MemtoRegOut, MemWOut, MemROut;
    
    input Clk, ALUsrcIn, BranchIn, RegWIn, JAL_Sig_in;
    output reg ALUsrcOut, BranchOut, RegWOut, JAL_Sig_out;
    
    
  always @ * begin
        PCout <= PCin;
        RD1out <= RD1in;
        RD2out <= RD2in;
        I15_0out <= I15_0in;
        I20_16out <= I20_16in;
        I15_11out <= I15_11in;
        I25_0out <= I25_0in;
        ALUopout <= ALUopin;
        ALUsrcOut <= ALUsrcIn;
        REGdstOut <= REGdstIn;
        MemWOut <= MemWIn;
        MemROut <= MemRIn;
        BranchOut <= BranchIn;
        MemtoRegOut <= MemtoRegIn;
        RegWOut <= RegWIn;
        JAL_Sig_out <= JAL_Sig_in; 
      
    end

endmodule