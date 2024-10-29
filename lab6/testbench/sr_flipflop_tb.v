`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2024 03:29:42 PM
// Design Name: 
// Module Name: sr_flipflop_tb
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


module sr_flipflop_tb(
    );
    
    reg S, R, clk;
    wire Q, Qbar;
    
    always begin
        #5 clk = ~clk;
    end
    
    sr_flipflop uut1(clk, S, R, Q, Qbar);
        initial begin
            S = 0; R = 0; clk = 0;
            #10; S = 1; R = 0;
            #10; S = 1; R = 1;
            #10; S = 0; R = 1;
            #10; $finish;
        
        end
endmodule
