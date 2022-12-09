`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - Mux32Bit2To1.v
// Description - Performs signal multiplexing between 2 32-Bit words.
////////////////////////////////////////////////////////////////////////////////

module SADMux(Clk, out, inA, inB, sel);

    output reg [31:0] out;
    
    input [31:0] inA, inB;
    input Clk, sel;

    /* Fill in the implementation here ... */ 
    always @ (inA, sel)
        begin
            if (sel == 0)
             out <= inB;
           
             else 
             out <= inA;
            
    end

endmodule
