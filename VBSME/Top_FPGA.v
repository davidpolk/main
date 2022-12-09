`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//          Richardo Larez 33.33%
//          David Polk 33.33%
//          Paz Davila 33.33%
// 
// Create Date: 10/25/2022 05:34:54 PM
// Design Name: 
// Module Name: Top_FPGA
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


module Top_FPGA(Clk, Reset, en_out, out7);

    input Clk, Reset;
    output [7:0] en_out;
    output [6:0] out7;
    wire[31:0] xSad, ySad, SAD;
    
//    wire [31:0] v0, v1;
    wire Clk_Out;
    
    
    //ClkDiv10Hz Clk_Div(Clk, Reset, Clk_Out);
    Thread_Top threadTop(Clk, Reset, xSad, ySad, SAD);
    
//    topLevel Top_Datapath(Clk_Out, Reset, v0, v1);
    
    Two4DigitDisplay two_Digit_Display(Clk, xSad[15:0], ySad[15:0], out7, en_out);
    
endmodule
