`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - Mux32Bit2To1.v
// Description - Performs signal multiplexing between 2 32-Bit words.
////////////////////////////////////////////////////////////////////////////////

module Mux32Bit6To3(A1, A2, A3, B1, B2, B3, out1, out2, out3, signal);

    output reg [31:0] out1, out2, out3;
    
    input [31:0] A1, A2, A3, B1, B2, B3;
    input signal;


    /* Fill in the implementation here ... */ 
    always @ (A1, A2, A3, B1, B2, B3, signal)
        begin
            if (signal == 1) begin
                out1 <= A1;
                out2 <= A2;
                out3 <= A3;
            end
            else begin
                out1 <= B1;
                out2 <= B2;
                out3 <= B3;
            end
            
    end

endmodule
