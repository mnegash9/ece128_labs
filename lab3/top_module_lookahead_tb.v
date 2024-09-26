`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2024 04:54:15 PM
// Design Name: 
// Module Name: top_module_lookahead_tb
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


module top_module_lookahead_tb();
   wire seg;
   reg [1:0] a, b;
   reg c_in;
   
   top_module_lookahead uut3(a, b, c_in, seg);
   
   
   integer i, j, k;
   
   initial begin
       for (i = 0; i < 4; i = i + 1) begin
           a = i;
           #10;
           for (j = 0; j < 4; j = j + 1) begin
               b = j;
               #10;
               for (k = 0; k < 2; k = k + 1) begin
                   c_in = k;
                   #10;
               end
           end
       end
   
   
   end


endmodule
