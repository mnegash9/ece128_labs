`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2024 03:20:46 PM
// Design Name: 
// Module Name: top_module_lookahead
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


module top_module_lookahead(
    input [1:0] a, b, input c_in, output [6:0] seg);
    
    wire [1:0] p, g, c, s;
    wire c_out, c1x, c0x;
    wire [3:0] bcd_w;
    
    
    assign p[0] = a[0] ^ b[0];
    assign p[1] = a[1] ^ b[1];
    
    assign g[0] = a[0] & b[0];
    assign g[1] = a[1] & b[1];
    
    assign c[0] = c_in;
    assign c[1] = g[0] | p[0] & c[0];
    
    assign c_out =  g[1] | p[1] & c[1];
    
    full_adder_1bit a1(a[0], b[0], c[0], c0x, s[0]);
    full_adder_1bit a2(a[1], b[1], c[1], c1x, s[1]);
    
    assign bcd_w = {1'b0, c_out, s};
    
    bcd_7_seg b1(bcd_w, seg);
    
endmodule
