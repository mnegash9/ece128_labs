`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 01:35:12 AM
// Design Name: 
// Module Name: rom
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


module rom(input clk, input [2:0] addr, output reg [3:0] data_out);

    // ROM array declaration (constant values)
    reg [3:0] data [0:7];  // 8 locations of 4-bit width
    
    // Initialize ROM contents
    initial begin
        data[0] = 4'h0;  // 0000
        data[1] = 4'h5;  // 0101
        data[2] = 4'hA;  // 1010
        data[3] = 4'hF;  // 1111
        data[4] = 4'h3;  // 0011
        data[5] = 4'h6;  // 0110
        data[6] = 4'h9;  // 1001
        data[7] = 4'hC;  // 1100
    end
    
    // Read operation
    always @(posedge clk) begin
        
        data_out <= data[addr];  // Read operation
        
    end
endmodule
