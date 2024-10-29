`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2024 04:19:56 PM
// Design Name: 
// Module Name: tff_counter
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


module tff_counter(input clk, clear, enable, output [2:0] Q);
    
    t_flipflop c0(clk, clear, enable, Q[0]);
    t_flipflop c1(clk, clear, Q[0], Q[1]);
    t_flipflop c2(clk, clear, Q[1] & Q[0], Q[2]);
    
endmodule
