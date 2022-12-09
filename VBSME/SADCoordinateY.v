`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2022 08:46:38 PM
// Design Name: 
// Module Name: SADCompare
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


module SADCoordinateY(index, x, y);

    input [31:0] index, x;
    reg [6:0] i;
    reg signed [31:0] indextemp, xtemp;
    output reg [31:0] y;
   
   initial begin
        y <= 0;
        i <= 0;
        indextemp <= 0;
        end
  
    
    
    always @ (index, x) begin 
        y = index - (x << 6); 
//        indextemp <= index;
//        for (i = 0; i < 64; i = i + 1) begin
//            if((indextemp - 64) >= 0) begin
//                x <= x + 1;
//                indextemp <= indextemp - 64;
//            end
//        end
         
////        x <= xtemp; 
       
            
    
    
    end


endmodule
