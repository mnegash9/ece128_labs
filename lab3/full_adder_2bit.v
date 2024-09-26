`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2024 02:30:01 PM
// Design Name: 
// Module Name: full_adder_2bit
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


module full_adder_2bit(input [1:0] a, b, input c_in, output c_out, output [1:0] s);
    
    wire c;
    
    full_adder_1bit a0(a[0], b[0], c_in, c, s[0]);
    full_adder_1bit a1(a[1], b[1], c, c_out, s[1]);
    

endmodule
