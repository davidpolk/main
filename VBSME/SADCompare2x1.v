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


module SADCompare1x2(sad1, sad2, index1, index2, sadout1, indexOut1);

    input [31:0] sad1, sad2, index1, index2;

    
    reg [31:0]indexout;
    reg [6:0] i;
    reg signed [31:0] indextemp, indexCoorCalc;
    output reg [31:0] sadout1, indexOut1;
   
  
    initial begin
        sadout1 <= 0;
        indexOut1 <= 0;
    end
    
    always @ (sad1, sad2) begin
        if (sad1 < sad2)begin
            sadout1 <= sad1; 
            indexOut1 <= index1;
        end
        else begin
            sadout1 <= sad2;
            indexOut1 <= index2;
        end
        
    end


endmodule
