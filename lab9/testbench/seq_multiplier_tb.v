`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2024 11:58:25 AM
// Design Name: 
// Module Name: seq_multiplier_tb
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


module seq_multiplier_tb(
    );
    
    reg clk;
    reg [3:0] a, b;
    wire [7:0] product;
    
    seq_multiplier uut1(clk, a, b, product);
    
    always begin
        #5 clk = ~clk;
    end
    
    initial begin
        clk = 0;
        #10; a = 4'b0011; b = 4'b0010;
        #150;
        $finish;
        
    end
endmodule