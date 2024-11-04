`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 02:57:18 PM
// Design Name: 
// Module Name: debouncer_tb
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


module debouncer_tb(
    );
    reg clk, raw;
    wire clean;
    debounce uut1(clk, raw, clean);
    
    always begin
        #5 clk = ~clk;
    end
    
    initial begin 
        clk = 0; raw = 0;
        #20; raw =1;
        #20; raw =0;
        #20; raw =1;
        #100; // wait for 15 clock cycles
        #10; $finish;
    end
endmodule
