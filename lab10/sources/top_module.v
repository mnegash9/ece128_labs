`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2024 12:16:11 PM
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


module top_module( input clk, reset, input [2:0] adr1_r, adr2_r, adr_ram, output [7:0] result, output [2:0] st_out);
    
    wire [2:0] rom_adr, st_out;
    wire w_rf, w_ram, DA, SA, SB;
    wire [3:0] A,B, rom_out;
    
    wire [7:0] product;
    
    cu u1( .clk(clk), .reset(reset), .adr1(adr1_r), .adr2(adr2_r), .w_rf(w_rf), .adr(rom_adr), .DA(DA) ,.SA(SA), .SB(SB), .st_out(st_out), .w_ram(w_ram));

    RF u2(.A(A), .B(B), .SA(SA), .SB(SB), .D_rom(rom_out), .DA(DA), .W(w_rf), .rst(reset), .clk(clk));
    
    multiplier u3(.a(A), .b(B), .product(product));
    
    rom u4(.clk(clk), .addr(rom_adr), .data_out(rom_out));
    
    ram u5(.clk(clk), .rst(reset), .addr(adr_ram), .data_in(product), .wr_en(w_ram), .data_out(result));
    
    
	

endmodule

