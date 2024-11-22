`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2024 03:07:08 PM
// Design Name: 
// Module Name: counter_tb
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


module counter_tb(
    );
    
    reg clk;
    wire [11:0] count;
    
    counter uut1(clk, count);
    
    always begin
        #5; clk = ~clk;
    end
    
    initial begin
        clk = 0;
        #81920; $finish;
    end
endmodule
