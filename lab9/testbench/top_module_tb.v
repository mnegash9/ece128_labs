`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2024 01:08:12 PM
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
    reg [3:0] a, b;
    wire [7:0] result;
    wire [6:0] seg;
    wire [3:0] an;
    
    top_module uut1(.clk(clk), .a(a), .b(b), .sseg_a_o(an), .sseg_c_o(seg));

    
    always begin
        #5; clk = ~clk;
    end
    
    initial begin
        clk = 0;
        #10; a = 4'b0011; b = 4'b0010; // 3 * 2 should be 6
        #10000; a = 4'b1111; b = 4'b1111; // 15 * 15 should be 225
        #10000;
        $finish;
    end
    
    
    
endmodule
