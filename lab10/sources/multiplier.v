`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2024 06:23:34 PM
// Design Name: 
// Module Name: multiplier
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


module multiplier(input [3:0] a, b, output [7:0] product);

    wire [3:0] m0;
    wire [3:0] m1;
    wire [3:0] m2;
    wire [3:0] m3;
    wire [7:0] s0, s1, s2, s3;
    
    assign m0 = {b[0]&a[3], b[0]&a[2],  b[0]&a[1], b[0]&a[0]};
    assign m1 = {b[1]&a[3], b[1]&a[2],  b[1]&a[1], b[1]&a[0]};
    assign m2 = {b[2]&a[3], b[2]&a[2],  b[2]&a[1], b[2]&a[0]};
    assign m3 = {b[3]&a[3], b[3]&a[2],  b[3]&a[1], b[3]&a[0]};
    
    assign s0 = m0;
    assign s1 = m1 << 1;
    assign s2 = m2 << 2;
    assign s3 = m3 << 3;
    assign product = s0 + s1 + s2 + s3;
    
    

endmodule

