`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2024 02:43:02 PM
// Design Name: 
// Module Name: top_module
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


module top_module(input [1:0] d0, d1, d2, d3, s, output [6:0] seg);
    
    
    wire [1:0] yt;
    wire [3:0] ytt;
    assign ytt = { 2'b00, yt};
    
    mux uut1(d0, d1, d2, d3, s, yt);
    bcd_7_seg uut2(ytt, seg);

endmodule
