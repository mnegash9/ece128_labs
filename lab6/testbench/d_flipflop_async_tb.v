`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2024 03:56:32 PM
// Design Name: 
// Module Name: d_flipflop_async_tb
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


module d_flipflop_async_tb(
    );
    reg clk, D, reset;
    wire Q;
    
    d_flipflop_async uut1(clk, D, reset, Q);
    
    always begin 
        #5 clk = ~clk;
    end
    
    initial begin
        D=0; clk = 0; reset = 0;
        #10; D=1;
        #10 reset = 1'b1;
        #10 D = 1; reset = 0;
        #10 D = 0;
        #10; $finish; 
    end
endmodule
