`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2024 01:40:08 PM
// Design Name: 
// Module Name: multiples_5bit
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


module multiples_5bit(
input [4:0] num, output reg mul2, mul3, mul4, mul5, mul235);


    always @(*) begin
        if (num[0] == 0) begin
            mul2 = 1'b1;
        end else begin
            mul2 = 1'b0;
        end
        if (num[0] == 0 && num[1] == 0) begin
            mul4 = 1'b1;
        end else begin
            mul4 = 1'b0;
        end
        if ((num == 5'b00101) || (num == 5'b01010) || (num == 5'b01111) || 
        (num == 5'b10100) || (num == 5'b11001) || (num == 5'b11110) || (num == 5'b00000)) begin
            mul5 = 1'b1;
        end else begin
            mul5 = 1'b0;
        end
        if ((num == 5'b00011) || (num == 5'b00110) || (num == 5'b01001) || 
        (num == 5'b01100) || (num == 5'b01111) || (num == 5'b10010) || (num == 5'b10101) ||
        (num == 5'b11000) || (num == 5'b11011) || (num == 5'b11110) || (num == 5'b00000)) begin
            mul3 = 1'b1;
        end else begin
            mul3 = 1'b0;
        end
        if (mul2 && mul3 && mul5) begin
            mul235 = 1'b1;
        end else begin
            mul235 = 1'b0;
        end
        
    
    end
    
endmodule
