`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2024 04:00:54 PM
// Design Name: 
// Module Name: bin2bcd_tb
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


module bin2bcd_tb(
    );
    reg clk;
    reg [11:0] bin_in;
    wire [15:0] bcd_out;
    wire ready;
    
    bin2bcd uut1(clk, bin_in, bcd_out, ready);
    
    always begin
        #5; clk = ~clk;
    end
    
    
    initial begin
        clk = 0; bin_in = 12'b011101100010; // 1890 in binary is 
        #620; // wait  clock cycles
        bin_in = 12'b100100011100; // 2332 in binary
        #620;
        $finish;
    end
    
endmodule
