`timescale 1ns/1ps

module Controller(ControlInput, aluOp, regW, jump, regDst, ALUsrc, Branch, MemR, MemW, MemReg, Reg1Signal, JALSig, SADMuxSel, SADSignal);

  input [31:0] ControlInput;
  output reg [5:0] aluOp;
  output reg [1:0] regDst, MemReg, MemR, MemW;
  output reg regW, jump, ALUsrc, Branch, Reg1Signal, JALSig, SADMuxSel, SADSignal;

  always @ (ControlInput) begin
      case(ControlInput[31:26])
        6'b000000: begin//ADD, SLL, SUB takes sign extension to differ from the two
          if(ControlInput[5:0] == 6'b000000)begin //SLL
            aluOp = 6'b000000;
          regW <= 1; 
          jump <= 0;
          regDst  <= 0;
          ALUsrc <= 1;
          Branch  <= 0;
          MemR <= 0;
          MemW <= 0;
          MemReg <= 1;
          Reg1Signal <= 1;
          SADMuxSel <= 0;
          SADSignal <=0;
          end else if (ControlInput[5:0] == 6'b000010)begin//SRL
            aluOp = 6'b000000;
          regW <= 1; 
          jump <= 0;
          regDst  <= 0;
          ALUsrc <= 1;
          Branch  <= 0;
          MemR <= 0;
          MemW <= 0;
          MemReg <= 1;
          Reg1Signal <= 1;
          JALSig <= 0;
          SADMuxSel <= 0;
          SADSignal <=0;
          end else if(ControlInput[5:0] == 6'b001000)begin //JR
              aluOp = 6'b000000;
              regW <= 0; 
              jump <= 0;
              regDst  <= 2;
              ALUsrc <= 0;
              Branch  <= 1;
              MemR <= 0;
              MemW <= 0;
              MemReg <= 0;
              Reg1Signal <= 0;
              JALSig <= 1;
              SADMuxSel <= 0;
              SADSignal <=0;
          end else begin
          
          aluOp = 6'b000000; //Rest of 000000 instructions
          regW <= 1; 
          jump <= 0;
          regDst  <= 0;
          ALUsrc <= 0;
          Branch  <= 0;
          MemR <= 0;
          MemW <= 0;
          MemReg <= 1;
          Reg1Signal <= 0;
          JALSig <= 0;
          SADMuxSel <= 0;
          SADSignal <=0;
          end
          
        end
        
        6'b000001:  begin //BGEZ & BLTZ
          aluOp = 6'b000001;
          regW <= 0;
          jump <= 0;
          regDst  <= 0;
          ALUsrc <= 0;
          Branch  <= 1;
          MemR <= 0;
          MemW <= 0;
          MemReg <= 0;
          Reg1Signal <= 0;
          JALSig <= 0;
          SADMuxSel <= 0;
          SADSignal <=0;
          end
          
           6'b000010: begin //J
          aluOp = 6'b000010;
          regW <= 0;
          jump <= 1;
          regDst  <= 0;
          ALUsrc <= 0;
          Branch  <= 0;
          MemR <= 0;
          MemW <= 0;
          MemReg <= 0;
          Reg1Signal <= 0;
          JALSig <= 0;
          SADMuxSel <= 0;
          SADSignal <=0;
          end

        6'b000011: begin //JAL
          aluOp = 6'b000011;
          regW <= 1;
          jump <= 1;
          regDst  <= 2;
          ALUsrc <= 0;
          Branch  <= 0;
          MemR <= 0;
          MemW <= 0;
          MemReg <= 2;
          Reg1Signal <= 0;
          JALSig <= 0;
          SADMuxSel <= 0;
          SADSignal <=0;
          end

        6'b000100: begin//BEQ
          aluOp = 6'b000100;
          regW <= 0;
          jump <= 0;
          regDst  <= 0;
          ALUsrc <= 0;
          Branch  <= 1;
          MemR <= 0;
          MemW <= 0;
          MemReg <= 0;
          Reg1Signal <= 0;
          JALSig <= 0;
          SADMuxSel <= 0;
          SADSignal <=0;
          end

        6'b000101: begin  //BNE
          aluOp = 6'b000101;
          regW <= 0;
          jump <= 0;
          regDst  <= 0;
          ALUsrc <= 0;
          Branch  <= 1;
          MemR <= 0;
          MemW <= 0;
          MemReg <= 0;
          Reg1Signal <= 0;
          JALSig <= 0;
          SADMuxSel <= 0;
          SADSignal <=0;
          end

        6'b000110: begin  //BLEZ
          aluOp = 6'b000110;
          regW <= 0;
          jump <= 0;
          regDst  <= 0;
          ALUsrc <= 0;
          Branch  <= 1;
          MemR <= 0;
          MemW <= 0;
          MemReg <= 0;
          Reg1Signal <= 0;
          JALSig <= 0;
          SADMuxSel <= 0;
          SADSignal <=0;
          end
          
        6'b000111: begin  //BGTZ
          aluOp = 6'b000111;
          regW <= 0;
          jump <= 0;
          regDst  <= 0;
          ALUsrc <= 0;
          Branch  <= 1;
          MemR <= 0;
          MemW <= 0;
          MemReg <= 0;
          Reg1Signal <= 0;
          JALSig <= 0;
          SADMuxSel <= 0;
          SADSignal <=0;
          end
          
        6'b001000: begin  //ADDI
          aluOp = 6'b001000;
          regW <= 1;
          jump <= 0;
          regDst  <= 1;
          ALUsrc <= 1;
          Branch  <= 0;
          MemR <= 0;
          MemW <= 0;
          MemReg <= 1;
          Reg1Signal <= 0;
          JALSig <= 0;
          SADMuxSel <= 0;
          SADSignal <=0;
          end
          
        6'b001010: begin  //SLTI
          aluOp = 6'b001010;
          regW <= 1;
          jump <= 0;
          regDst  <= 1;
          ALUsrc <= 1;
          Branch  <= 0;
          MemR <= 0;
          MemW <= 0;
          MemReg <= 1;
          Reg1Signal <= 0;
          JALSig <= 0;
          SADMuxSel <= 0;
          SADSignal <=0;
          end
          
        6'b001100: begin  //ANDI
          aluOp = 6'b001100;
          regW <= 1;
          jump <= 0;
          regDst  <= 1;
          ALUsrc <= 1;
          Branch  <= 0;
          MemR <= 0;
          MemW <= 0;
          MemReg <= 1;
          Reg1Signal <= 0;
          JALSig <= 0;
          SADMuxSel <= 0;
          SADSignal <=0;
          end
          
        6'b001101: begin  //ORI
          aluOp = 6'b001101;
          regW <= 1;
          jump <= 0;
          regDst  <= 1;
          ALUsrc <= 1;
          Branch  <= 0;
          MemR <= 0;
          MemW <= 0;
          MemReg <= 1;
          Reg1Signal <= 0;
          JALSig <= 0;
          SADMuxSel <= 0;
          SADSignal <=0;
          end
          
        6'b001110: begin  //XORI
          aluOp = 6'b001110;
          regW <= 1;
          jump <= 0;
          regDst  <= 1;
          ALUsrc <= 1;
          Branch  <= 0;
          MemR <= 0;
          MemW <= 0;
          MemReg <= 1;
          Reg1Signal <= 0;
          JALSig <= 0;
          SADMuxSel <= 0;
          SADSignal <=0;
          end  
          
        6'b101011: begin  // sw
          aluOp = 6'b101011;
          regW <= 0;
          jump <= 0;
          regDst  <= 0;
          ALUsrc <= 1;
          Branch  <= 0;
          MemR <= 0;
          MemW <= 1;
          MemReg <= 0;
          Reg1Signal <= 0;
          JALSig <= 0;
          SADMuxSel <= 0;
          SADSignal <=0;
          end
          
        6'b100011: begin  //lw
          aluOp = 6'b100011;
          regW <= 1;
          jump <= 0;
          regDst  <= 1;
          ALUsrc <= 1;
          Branch  <= 0;
          MemR <= 1;
          MemW <= 0;
          MemReg <= 0;
          Reg1Signal <= 0;
          JALSig <= 0;
          SADMuxSel <= 0;
          SADSignal <=0;
          end
          
        6'b100001: begin  //lh
          aluOp = 6'b100001;
          regW <= 1;
          jump <= 0;
          regDst  <= 1;
          ALUsrc <= 1;
          Branch  <= 0;
          MemR <= 2;
          MemW <= 0;
          MemReg <= 0;
          Reg1Signal <= 0;
          JALSig <= 0;
          SADMuxSel <= 0;
          SADSignal <=0;
          end
          
        6'b101000: begin  //sb aka SAD Calculation
          aluOp = 6'b101000;
          regW <= 0;
          jump <= 0;
          regDst  <= 0;
          ALUsrc <= 0;
          Branch  <= 0;
          MemR <= 0;
          MemW <= 3;
          MemReg <= 0;
          Reg1Signal <= 0;
          JALSig <= 0;
          SADMuxSel <= 1;
          SADSignal <=0;
          end
          
        6'b100000: begin  //lb aka loadSAD
          aluOp = 6'b100000;
          regW <= 1;
          jump <= 0;
          regDst  <= 1;
          ALUsrc <= 1;
          Branch  <= 0;
          MemR <= 3;
          MemW <= 0;
          MemReg <= 0;
          Reg1Signal <= 0;
          JALSig <= 0;
          SADMuxSel <= 0;
          SADSignal <= 1;
          end
          
        6'b101001: begin  //sh
          aluOp = 6'b101001;
          regW <= 0;
          jump <= 0;
          regDst  <= 0;
          ALUsrc <= 1;
          Branch  <= 0;
          MemR <= 0;
          MemW <= 2;
          MemReg <= 0;
          Reg1Signal <= 0;
          JALSig <= 0;
          SADMuxSel <= 0;
          SADSignal <=0;
          end
          
        6'b011100: begin  //mul
          aluOp = 6'b011100;
          regW <= 1;
          jump <= 0;
          regDst  <= 0;
          ALUsrc <= 0;
          Branch  <= 0;
          MemR <= 0;
          MemW <= 0;
          MemReg <= 1;
          Reg1Signal <= 0;
          JALSig <= 0;
          SADMuxSel <= 0;
          SADSignal <=0;
          end
          
    endcase
    end
    
endmodule
          
      
          
          
         
          
     
          
        
        
          
          
  