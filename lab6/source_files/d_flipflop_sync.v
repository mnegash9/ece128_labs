`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2024 01:40:01 PM
// Design Name: 
// Module Name: d_flipflop_sync
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

module d_flipflop_sync (input clk, D, reset, output reg Q);

	always @ ( posedge clk) begin
        if (reset) begin
	       Q <= 1'b0;
        end else begin
            Q <= D; 
        end
    end
    
endmodule