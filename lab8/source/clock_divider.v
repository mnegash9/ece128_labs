`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2024 11:12:38 AM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(clk_in,clk_out);

input wire clk_in;   // Input clock signal
output reg clk_out=1'b0;  // Output clock signal (divided)
    
    
    parameter DIVISOR = 8192;  // Adjust this based on your desired clock frequency
    reg [13:0] counter = 13'd0;     // 32-bit counter

    always @(posedge clk_in) begin
        if (counter == (DIVISOR - 1)) begin
            counter <= 13'd0;      // Reset the counter
            clk_out <= ~clk_out;   // Toggle the output clock
        end
        else begin
            counter <= counter + 1;  // Increment the counter
        end
    end
endmodule
