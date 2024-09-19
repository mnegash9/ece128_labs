`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2024 04:11:36 PM
// Design Name: 
// Module Name: top_module_tb
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


module top_module_tb();
    wire [6:0] seg;
    reg [1:0] d0,d1,d2,d3, s;
    top_module uut2(d0, d1, d2, d3, s, seg);
    integer i,j;
    initial begin      
        #10 d0= 2'b00; d1= 2'b00;d2= 2'b00; d3= 2'b00; s = 2'b00;
        for (i = 0; i < 4; i= i + 1) begin
            d0 = i;
            #10;
            for(j = 0; j < 4; j = j + 1)begin
                s = j;
                #10;
            end      
        end
        d0= 2'b00; d1= 2'b00;d2= 2'b00; d3= 2'b00; s = 2'b00;
        for (i = 0; i < 4; i= i + 1) begin
            d1 = i;
            #10;
            for(j = 0; j < 4; j = j + 1)begin
                s = j;
                #10;
            end      
        end
        d0= 2'b00; d1= 2'b00;d2= 2'b00; d3= 2'b00; s = 2'b00;
        for (i = 0; i < 4; i= i + 1) begin
            d2 = i;
            #10;
            for(j = 0; j < 4; j = j + 1)begin
                s = j;
                #10;
            end      
        end
        d0= 2'b00; d1= 2'b00;d2= 2'b00; d3= 2'b00; s = 2'b00;
        for (i = 0; i < 4; i= i + 1) begin
            d3 = i;
            #10;
            for(j = 0; j < 4; j = j + 1)begin
                s = j;
                #10;
            end      
        end
        $stop;
    end 
endmodule
