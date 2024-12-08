`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 12:58:57 AM
// Design Name: 
// Module Name: ram
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


module ram(input clk, input rst, input [2:0] addr, input [7:0] data_in,
    input wr_en, output reg [7:0] data_out);
    
    // Memory array declaration
    reg [7:0] mem [0:7];  // 8 locations of 8-bit width
    integer i;
    
    // Reset and write operation
    always @(posedge clk) begin
        if (rst) begin
            // Initialize all memory locations to 0
            for (i = 0; i < 8; i = i + 1) begin
                mem[i] <= 8'b0;
            end
            data_out <= 8'b0;
        end
        else begin
            if (wr_en) begin
                mem[addr] <= data_in;  // Write operation
            end
            data_out <= mem[addr]; // Read operation
            
        end
    end
    
endmodule
