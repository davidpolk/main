`timescale 1ns / 1ps

module EXMEMRegister(Clk, PCin, PCout, zeroIn, zeroOut, ALUResultIn, ALUResultOut, RD2in, RD2out, WRin, WRout,regWIn, regWOut, MemtoRegIn, MemtoRegOut, BranchIn, BranchOut, MemRIn, MemROut, MemWIn, MemWOut, 
AdderIn, Adderout, shiftJumpIn, shiftJumpOut, EXMEMWrite, IFIDPCDisplay, EXMEMPCDisplay, SADSigIn, SADSigOut);

  input [31:0] PCin, ALUResultIn, RD2in, AdderIn, shiftJumpIn, IFIDPCDisplay;
  output reg [31:0] PCout, ALUResultOut, RD2out, Adderout, shiftJumpOut, EXMEMPCDisplay;
    
    input [4:0] WRin;
    output reg [4:0] WRout;

    input [1:0] MemtoRegIn, MemRIn, MemWIn;
    output reg [1:0] MemtoRegOut, MemROut, MemWOut;
    
    input Clk, zeroIn, regWIn, BranchIn, EXMEMWrite, SADSigIn;
    output reg  zeroOut, regWOut, BranchOut, SADSigOut;


  always @ (posedge Clk) begin
    if (EXMEMWrite == 0) begin
        //PCout <= 32'b0;
        zeroOut <= 1'b0;
        ALUResultOut <= 32'b0;
        RD2out <= 32'b0;
        WRout <= 5'b11010; 
        MemtoRegOut <= 2'b0;
        regWOut <= 2'b0;
        BranchOut <= 1'b0;
        MemROut <= 2'b0;
        MemWOut <= 2'b0;
        Adderout <= 32'b0;
        shiftJumpOut <= 32'b0;
        EXMEMPCDisplay <= IFIDPCDisplay;
        SADSigOut <= 0;
    end

    else if (EXMEMWrite == 1) begin
        PCout <= PCin;
        zeroOut <= zeroIn;
        ALUResultOut <= ALUResultIn;
        RD2out <= RD2in;
        WRout <= WRin; 
        MemtoRegOut <= MemtoRegIn;
        regWOut <= regWIn;
        BranchOut <= BranchIn;
        MemROut <= MemRIn;
        MemWOut <= MemWIn;
        Adderout <= AdderIn;
        shiftJumpOut <= shiftJumpIn;
        EXMEMPCDisplay <= IFIDPCDisplay;
        SADSigOut <= SADSigIn;
    end
    
end
    
endmodule