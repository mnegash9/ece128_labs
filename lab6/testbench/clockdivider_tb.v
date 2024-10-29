`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 02:11:47 PM
// Design Name: 
// Module Name: clockdivider_tb
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


module clockdivider_tb(
    );
    
    reg clk;
    wire new_clock;
    
    clockdivider uut1(clk, new_clock);
    
    always begin
        #5 clk = ~clk;
    end
    
    initial begin
        clk = 0;
        #100;
        #10; $finish;
    
    end
endmodule
