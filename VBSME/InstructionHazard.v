`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2022 04:46:18 AM
// Design Name: 
// Module Name: InstructionHazard
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


module InstructionHazard(complete, instruction, pcstall, instSignal );

    input complete;
    input [31:0] instruction;
    output reg pcstall, instSignal;
    reg completeCheck;
    
    
    initial begin
        pcstall <= 0;
        instSignal <= 0;
        completeCheck <= 0;
        
       
    end
    
    always @ (complete) begin
        completeCheck <= complete;
        if (instruction != 0) begin
            pcstall <= 1;
            instSignal <= 1;
        end
        else if (completeCheck == 1)begin
            pcstall <= 0;
            instSignal <= 0;
            completeCheck <= 0;
            
            
            end
    
    end

endmodule
