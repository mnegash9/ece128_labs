`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2024 04:16:52 PM
// Design Name: 
// Module Name: bcd_7_seg_tb
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


module bcd_7_seg_tb();
    reg [3:0] bcd;
    wire [6:0] seg;
    integer i;
    bcd_7_seg uut1(bcd, seg);
    initial 
    begin
        for (i=0; i < 4; i = i +1) begin
            bcd = i;
            #10;
        end
        $stop;
    end
endmodule
