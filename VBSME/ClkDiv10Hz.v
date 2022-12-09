`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2018 09:50:27 AM
// Design Name: 
// Module Name: ClkDiv10Hz
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


module ClkDiv10Hz(Clk, Rst, ClkOut2);
    
    input Clk, Rst;
       output reg ClkOut2;
    
       parameter DivVal = 100000;
       reg[31:0] DivCnt;
       reg ClkInt;
    
       always @(posedge Clk) begin
//          if( Rst == 1 )begin
//             DivCnt <= 0;
//             ClkOut2 <= 0;
//             ClkInt <= 0;
//          end
//          else begin
             if( DivCnt == DivVal ) begin
                ClkOut2 <= ~ClkInt;
                ClkInt <= ~ClkInt;
                DivCnt <= 0;
             end
             else begin
                ClkOut2 <= ClkInt;
                ClkInt <= ClkInt;
                DivCnt <= DivCnt + 1;
             end
          end
//       end
endmodule
