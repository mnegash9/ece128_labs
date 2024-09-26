`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2024 02:35:43 PM
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


module top_module(input [1:0] a, b, input c_in, output [6:0] seg);
    
    wire c_out;
    wire [1:0] s;
    wire [3:0] bcd_w;
    
    full_adder_2bit a1(a, b, c_in, c_out, s);
    
    assign bcd_w = {1'b0, c_out, s};
    
    bcd_7_seg b1(bcd_w, seg);
    
     

endmodule