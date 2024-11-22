`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2024 02:11:34 PM
// Design Name: 
// Module Name: top_module_tb
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


module top_module_tb(
    );
    
    reg clk;
    wire [6:0] seg;
    wire [3:0] an;
    
    top_module uut5(clk, seg, an);
    
    always begin
        #5; clk = ~clk;
    end
    
    initial begin
        clk = 0; 
        #100000;
        $finish;
    end
endmodule
