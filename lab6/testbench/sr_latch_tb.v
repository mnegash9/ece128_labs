`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2024 02:58:07 PM
// Design Name: 
// Module Name: sr_latch_tb
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


module sr_latch_tb(
    );
    
    reg S, R;
    wire Q, Qbar;
    
    SR_Latch uut1(S, R, Q, Qbar);
    initial begin
        S = 0; R = 0;
        #10; S = 1; R = 0;
        #10; S = 0; R = 0;
        #10; S = 0; R = 1;
        #10; S = 1; R = 1;
        #10; $finish;
    
    end
    
endmodule
