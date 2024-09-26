`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2024 02:11:21 PM
// Design Name: 
// Module Name: bcd_7_seg
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


module bcd_7_seg(ytt, seg);
    
    input [3:0] ytt;
    output reg [6:0] seg;
    always@(*)
    begin
        case(ytt)
            0: seg = 7'b1000000; //0
            1: seg = 7'b1111001; //1
            2: seg = 7'b0100100; //2
            3: seg = 7'b0110000; //3
            4: seg = 7'b0011001; // 4
            5: seg = 7'b0010010; // 5
            6: seg = 7'b0000010; // 6
            7: seg = 7'b1111000; // 7
            8: seg = 7'b0000000; // 8
            9: seg = 7'b0010000; // 9
            default: seg = 7'b1111111; // All segments off
        endcase
    end

endmodule
