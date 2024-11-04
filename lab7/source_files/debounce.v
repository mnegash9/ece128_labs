`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 03:13:48 PM
// Design Name: 
// Module Name: debounce
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


module debounce(input clk, raw, output reg clean);

    reg [2:0] counter;
    wire trigger;
    
    always@(posedge clk) begin
        if (~raw) begin
            counter <= 3'b000;
        end else begin
            counter = counter + 3'b001;
        end
    end
    
    assign trigger = (counter==3'b111);
    
    always @(posedge clk) begin
        
        if (~raw) 
            clean <= 1'b0;
        else if (trigger)
            clean <= 1'b1;
    end
    
endmodule
