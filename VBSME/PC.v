`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2022 03:26:51 PM
// Design Name: 
// Module Name: PCCounter
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


module PC(PCin, PCout, Rst, Clk);

input [31:0] PCin;
output reg [31:0] PCout;

input Rst, Clk;

initial begin
    PCout <= 0;
  
    
end

always @ (posedge Clk) begin
    if (Rst == 1) begin
        PCout <= 0;
    end
    else begin
        PCout <= PCin;
        end
        
//    else if (Rst == 0 && PCWrite == 1) begin
//        PCout <= PCin;
//    end
//    else if (Rst == 0 && PCWrite == 0) begin
//        PCout <= PCout;
//    end
    
 end
   
        

 
//	(* mark_debug = "true" *)  reg [31:0] PCout;
//	assign debug_reg1 = PCout;

endmodule
