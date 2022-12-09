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


module ShiftLeft2(in, out);

    input [25:0] in;
    reg [31:0] temp;
    output reg [31:0] out;
    
    
    always @* begin       
        temp[25:0] <= in;
        temp[31:26] <= 6'b000000; 
        out <= temp << 2;
    end
    
    
endmodule
