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


module SADCompare6x3(sad1, sad2, sad3, sad4, sad5, sad6, index1, index2, index3, index4, index5, index6,
    sadout1, sadout2, sadout3, indexOut1, indexOut2, indexOut3);

    input [31:0] sad1, sad2, sad3, sad4, sad5, sad6, index1, index2, index3, index4, index5, index6;

    
    reg [31:0]indexout;
    reg [6:0] i;
    reg signed [31:0] indextemp, indexCoorCalc;
    output reg [31:0] sadout1, sadout2, sadout3, indexOut1, indexOut2, indexOut3;
   
  
    
    
    always @ (sad1, sad2, sad3, sad4, sad5, sad6) begin
    

        if (sad1 < sad2)begin
            sadout1 <= sad1; 
            indexOut1 <= index1;
        end
        else begin
            sadout1 <= sad2;
            indexOut1 <= index2;
        end
        
        if (sad3 < sad4)begin
            sadout2 <= sad3;
            indexOut2 <= index3;
        end
        else begin
            sadout2 <= sad4;
            indexOut2 <= index4;
        end
        
        if (sad5 < sad6)begin
            sadout3 <= sad5;
            indexOut3 <= index5;
        end
        else begin
            sadout3 <= sad6;
            indexOut3 <= index6;
        end
        
        
    end


endmodule
