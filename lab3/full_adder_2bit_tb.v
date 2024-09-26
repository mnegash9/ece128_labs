`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2024 03:15:04 PM
// Design Name: 
// Module Name: full_adder_2bit_tb
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


module full_adder_2bit_tb();
    wire c_out, s;
    reg [1:0] a, b;
    reg c_in;
    
    full_adder_2bit uut1(a, b, c_in, c_out, s);
    
    integer i, j, k;
    initial
    begin
        for(i = 0; i < 4; i = i + 1)
        begin
            a = i;
            #10;
            for (j = 0; j < 4; j = j+1) begin
                b = j;
                #10;
                for (k = 0; k < 4; k = k+1) begin
                    c_in = k;
                    #10;
                end
            end
            
        end
        $stop;
    end
    

endmodule
