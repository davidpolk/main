`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//      - Richardo Larez : 33.33%
//      - David Polk     : 33.33%
//      - Paz Davila     : 33.33%
// 
// Create Date: 10/24/2022 10:35:37 AM
// Design Name: 
// Module Name: toplevel_tb
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


module topLevel_tb();

  reg clk, reset;
  wire [31:0] xSad, ySad, SAD;
  wire [15:0] en_out, out7;
  
  Thread_Top topLevel_tb(clk, reset, xSad, ySad, SAD);
  //Top_FPGA top(clk, reset, en_out, out7);

  always begin
    clk <= 1;
    #1000;
    clk <= 0;
    #1000;
  end

  initial begin
    #1000;
    #1000;
    reset <= 1;
    #1000;
    reset <= 0;
    #1000;

  end
endmodule
