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


module SADCompare30x15(sad1, sad2, sad3, sad4, sad5, sad6, sad7, sad8, sad9, sad10, sad11, sad12, sad13,
    sad14, sad15, sad16, sad17, sad18, sad19, sad20, sad21, sad22, sad23, sad24, sad25, sad26, sad27,
    sad28, sad29, sad30,
    index1, index2, index3, index4, index5, index6, index7, index8, index9, index10, index11, index12, index13,
    index14, index15, index16, index17, index18, index19, index20, index21, index22, index23, index24, index25, index26, index27,
    index28, index29, index30,
    sadout1, sadout2, sadout3, sadout4, sadout5, sadout6, sadout7, sadout8, sadout9, sadout10, sadout11, sadout12, sadout13, sadout14, sadout15,
    indexOut1, indexOut2, indexOut3, indexOut4, indexOut5, indexOut6, indexOut7, indexOut8, indexOut9, indexOut10, indexOut11, indexOut12, indexOut13, indexOut14, indexOut15);

    input [31:0] sad1, sad2, sad3, sad4, sad5, sad6, sad7, sad8, sad9, sad10, sad11, sad12, sad13,
    sad14, sad15, sad16, sad17, sad18, sad19, sad20, sad21, sad22, sad23, sad24, sad25, sad26, sad27,
    sad28, sad29, sad30, 
    index1, index2, index3, index4, index5, index6, index7, index8, index9, index10, index11, index12, index13,
    index14, index15, index16, index17, index18, index19, index20, index21, index22, index23, index24, index25, index26, index27,
    index28, index29, index30;

    reg [6:0] i;
    reg signed [31:0] indextemp, indexCoorCalc;
    output reg [31:0] sadout1, sadout2, sadout3, sadout4, sadout5, sadout6, sadout7, sadout8, sadout9, sadout10, sadout11, 
                      sadout12, sadout13, sadout14, sadout15, indexOut1, indexOut2, indexOut3, indexOut4, indexOut5, indexOut6, indexOut7, 
                      indexOut8, indexOut9, indexOut10, indexOut11, indexOut12, indexOut13, indexOut14, indexOut15;
   
  
    
    
    always @ (sad1, sad2, sad3, sad4, sad5, sad6, sad7, sad8, sad9, sad10, sad11, sad12, sad13,
    sad14, sad15, sad16, sad17, sad18, sad19, sad20, sad21, sad22, sad23, sad24, sad25, sad26, sad27,
    sad28, sad29, sad30) begin
    

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
        
        if (sad15 < sad16)begin
            sadout8 <= sad15;
            indexOut8 <= index15;
        end
        else begin
            sadout8 <= sad16;
            indexOut8 <= index16;
        end
        
        if (sad17 < sad18)begin
            sadout9 <= sad17;
            indexOut9 <= index17;
        end
        else begin
            sadout9 <= sad18;
            indexOut9 <= index18;
        end
        
        if (sad19 < sad20)begin
            sadout10 <= sad19;
            indexOut10 <= index19;
        end
        else begin
            sadout10 <= sad20;
            indexOut10 <= index20;
        end
        
        if (sad21 < sad22)begin
            sadout11 <= sad21;
            indexOut11 <= index21;
        end
        else begin
            sadout11 <= sad22;
            indexOut11 <= index22;
        end
        
        if (sad23 < sad24)begin
            sadout12 <= sad23;
            indexOut12 <= index23;
        end
        else begin
            sadout12 <= sad24;
            indexOut12 <= index24;
        end
        
        if (sad25 < sad26)begin
            sadout13 <= sad25;
            indexOut13 <= index25;
        end
        else begin
            sadout13 <= sad26;
            indexOut13 <= index26;
        end
        
        if (sad27 < sad28)begin
            sadout14 <= sad27;
            indexOut14 <= index27;
        end
        else begin
            sadout14 <= sad28;
            indexOut14 <= index28;
        end
        
        if (sad29 < sad30)begin
            sadout15 <= sad29;
            indexOut15 <= index29;
        end
        else begin
            sadout15 <= sad30;
            indexOut15 <= index30;
        end

    end


endmodule
