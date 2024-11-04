`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2024 01:37:12 PM
// Design Name: 
// Module Name: mealy_tb
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


module mealy_tb(
    );
    
    reg P1, P0, clk, reset;
    wire z;
    
    mealy uut1(P1,P0, clk, reset,  //P1-to represent 1, P0-to represent 0
        z);
    
    // set the clock
    always begin
        #5 clk = ~clk;
    end
    
    // assigning states
    initial begin
        clk = 0; reset = 0; 
            #10; P0 = 1; P1 = 0; // expect S0
            #10; P0 = 0; P1 = 1; //expect S1
            #10; P0 = 0; P1 = 1; // expect S2
            #10; P0 = 1; P1 = 0; // expect S3
            #10; P0 = 0; P1 = 1; // expect S0 z = 1
            #10; P0 = 0; P1 = 1; // expect S0
            #10; reset = 1;     // expect S0
            #10; reset = 0; P0 = 1; P1 = 0; // expect S0
            #10; P0 = 0; P1 = 1; // expect S1
            #10; P0 = 1; P1 = 0; // expect S1
            #10; P0 = 1; P1 = 0; // expect S1
            #10; P0 = 0; P1 = 1; // expect S2
            #10; $finish;
    end
endmodule
