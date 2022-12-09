`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2022 01:45:10 AM
// Design Name: 
// Module Name: ShiftLeft2
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


module Shift(A, B, out, sel);

    input [4:0] A, B;
    output reg [4:0] out;
    
    input sel;
    
    
    always @* begin       
        if (sel == 0)
            out <= A << B;
            
        else if (sel == 1)
            out <= A >> B;
        
    end
    
endmodule
