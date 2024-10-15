`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2024 04:09:06 PM
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


module top_module_tb();
    reg clk;
    reg [15:0] bcd_in;
    wire [3:0] sseg_a_o;
    wire [6:0] sseg_c_o;
  
    top_module uut1(clk, bcd_in, sseg_a_o, sseg_c_o);
  
    always begin
        #5 clk = ~clk;
    end
    
    initial begin
        clk =0;
        bcd_in = 16'b0001001000110100; // print 1234
        #1280;
        bcd_in = 16'b1001011001010011; // print 9653
        #1280;
        bcd_in = 16'b0100011110000010; // print 4782
        #1280;
        bcd_in = 16'b0000100100100100; // print 0924
        #1280;
        bcd_in = 16'b0111000001000001; // print 7041
        #1280;
        $finish;
    end
    
    
endmodule
