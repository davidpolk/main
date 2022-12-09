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


module SADCompare14x7(sad1, sad2, sad3, sad4, sad5, sad6, sad7, sad8, sad9, sad10, sad11, sad12, sad13, sad14,
    index1, index2, index3, index4, index5, index6, index7, index8, index9, index10, index11, index12, index13, index14, 
    sadout1, sadout2, sadout3, sadout4, sadout5, sadout6, sadout7, 
    indexOut1, indexOut2, indexOut3, indexOut4, indexOut5, indexOut6, indexOut7);

    input [31:0] sad1, sad2, sad3, sad4, sad5, sad6, sad7, sad8, sad9, sad10, sad11, sad12, sad13, sad14,
    index1, index2, index3, index4, index5, index6, index7, index8, index9, index10, index11, index12, index13,index14;

    
    reg [31:0]indexout;
    reg [6:0] i;
    reg signed [31:0] indextemp, indexCoorCalc;
    output reg [31:0] sadout1, sadout2, sadout3, sadout4, sadout5, sadout6, sadout7, 
                      indexOut1, indexOut2, indexOut3, indexOut4, indexOut5, indexOut6, indexOut7;
   
  
    
    
    always @ (sad1, sad2, sad3, sad4, sad5, sad6, sad7, sad8, sad9, sad10, sad11, sad12, sad13, sad14) begin
    

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
        
        if (sad7 < sad8)begin
            sadout4 <= sad7;
            indexOut4 <= index7;
        end
        else begin
            sadout4 <= sad8;
            indexOut4 <= index8;
        end
        
        if (sad9 < sad10)begin
            sadout5 <= sad9;
            indexOut5 <= index9;
        end
        else begin
            sadout5 <= sad10;
            indexOut5 <= index10;
        end
        
        if (sad11 < sad12)begin
            sadout6 <= sad11;
            indexOut6 <= index11;
        end
        else begin
            sadout6 <= sad12;
            indexOut6 <= index12;
        end
        
        if (sad13 < sad14)begin
            sadout7 <= sad13;
            indexOut7 <= index13;
        end
        else begin
            sadout7 <= sad14;
            indexOut7 <= index14;
        end

    end


endmodule
