`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2024 04:02:51 PM
// Design Name: 
// Module Name: t_flipflop
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


module t_flipflop(input clk, reset, enable, output reg Q
    );
    reg firstrun;
    initial begin
         firstrun = 1'b1;
    end
    always @(posedge clk) begin
        if (reset || firstrun) begin //reset
            Q <= 1'b0;
            firstrun <= 0;
        end else if (enable) begin // toggle
            Q <= ~Q;
        end 
    
    end
endmodule
