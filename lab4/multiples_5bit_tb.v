`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2024 01:50:08 PM
// Design Name: 
// Module Name: multiples_5bit_tb
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


module multiples_5bit_tb();
    reg [4:0] num;
    wire mul2, mul3, mul4, mul5, mul235;
    integer i;
    multiples_5bit uut1(num, mul2, mul3, mul4, mul5, mul235);
    
    initial begin
        #10;
        num = 5'b0;
        for(i = 0; i < 32; i = i + 1) begin
            num = num + 1'b1; 
            #10;
        end
        $stop;
    end
    
endmodule
