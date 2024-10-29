`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2024 01:38:34 PM
// Design Name: 
// Module Name: sr_flipflop
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


module sr_flipflop(input clk, S, R, output reg Q, Qbar);
    
    always @(posedge clk) begin
        if(S == 1'b1 && R == 1'b1) begin // invalid input set to invalid
            Q <= 1'bx; Qbar <= 1'bx;
        end else if (S == 1'b0 && R == 1'b1) begin // set Q to zero Qbar to 1
            Q <= 1'b0; Qbar <= 1'b1;
        end else if (S == 1'b1 && R == 1'b0) begin // set Qbar to zero Q to 1
            Q <= 1'b1; Qbar <= 1'b0;
        end else if (S == 1'b0 && R == 1'b0) begin // latch the value
            Q <= Q; Qbar <= ~Q;
        end
    end
    
endmodule
