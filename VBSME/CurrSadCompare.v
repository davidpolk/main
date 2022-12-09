`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2022 11:38:28 PM
// Design Name: 
// Module Name: CurrSadCompare
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


module CurrSadCompare(Clk, x_coor, y_coor, newSad, xSad, ySad, currSad);
       input signed [31:0] x_coor, y_coor, newSad;
       input Clk;
       output reg [31:0] xSad, ySad;
       output reg signed [31:0] currSad;
       reg signed [31:0] testSub;
       
       initial begin
        currSad <= 9999;
        end
        
        always @ (negedge Clk) begin
//            testSub <= currSad - newSad;
                if (newSad < currSad) begin 
//                    if (newSad != 0) begin
                        xSad <= x_coor;
                        ySad <= y_coor;
                        currSad <= newSad;
//                    end
                end
             
       end
       
       
    
endmodule
