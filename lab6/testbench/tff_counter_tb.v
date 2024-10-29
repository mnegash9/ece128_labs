`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 01:49:47 PM
// Design Name: 
// Module Name: tff_counter_tb
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


module tff_counter_tb(
    );
    
    reg clk, enable, clear;
    wire [2:0] Q;
    
    tff_counter uut1(clk, clear, enable, Q);
    
    always begin
        #5 clk = ~clk;
    end
    
    initial begin
        enable=1; clk=0; clear=1;
        #10; clear=0;
        #80; $finish;
    end
    
endmodule
