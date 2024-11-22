`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2024 03:00:15 PM
// Design Name: 
// Module Name: top_module
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


module top_module(
   input clk,
   output wire [6:0] seg,
   output wire [3:0] an);

    reg [15:0] stat_bcd;
    reg enable_counter;
    
    wire clk_out;
    wire [11:0] bin_in;
    wire [15:0] bcd_out;
    wire ready;
    
    
    clock_divider uut4(clk, clk_out); // comment out for testbench
//    assign clk_out = clk; // uncomment for testbench, since clock doesn't need to be divided
    counter uut1(.clk(clk_out), .en(enable_counter), .count(bin_in));
    bin2bcd uut2(.clk(clk_out), .bin_in(bin_in), .bcd_out(bcd_out), .ready(ready));
    multisegment_driver uut3(.clk(clk_out), .bcd_in(stat_bcd), .sseg_a_o(an), .sseg_c_o(seg));
    
    always @(posedge clk_out)
       begin
       if(ready) begin
            stat_bcd <= bcd_out;
            enable_counter <= 1'b1;
       end else begin
            stat_bcd <= stat_bcd;
            enable_counter <= 1'b0;
       end end
       
endmodule



