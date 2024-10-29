`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 02:09:34 PM
// Design Name: 
// Module Name: clockdivider
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


module clockdivider(input clk, output new_clock
    );
    
    wire clock_half;
    
    t_flipflop divider1(.clk(clk), .reset(0), .enable(1), .Q(clock_half));
    t_flipflop divider2(.clk(clock_half), .reset(1'b0), .enable(1'b1), .Q(new_clock));
    
endmodule
