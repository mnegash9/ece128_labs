`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2024 04:07:25 PM
// Design Name: 
// Module Name: t_flipflop_tb
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


module t_flipflop_tb(

    );
    reg clk, reset, enable;
    wire Q;
        
    t_flipflop uut1(clk, reset, enable, Q);
        
    always begin
        #5 clk = ~clk;
    end
        
    initial begin
        enable=0; clk = 0; reset = 0;
        #10; 
        #10 reset = 1'b1;
        #10 enable = 1; reset = 0;
        #10 enable = 0;
        #10; $finish; 
    end

endmodule
    

