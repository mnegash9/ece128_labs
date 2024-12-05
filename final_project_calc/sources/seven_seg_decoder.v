`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 02:14:11 AM
// Design Name: 
// Module Name: seven_seg_decoder
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


module seven_seg_decoder(clk, bcd, seg);
    
    input clk; 
    input [3:0] bcd; 
    output reg[6:0] seg; 
    
    always @(posedge clk) begin        
        case (bcd) //case statement                   
         0: seg = 7'b1000000; //0
         1: seg = 7'b1111001; //1
         2: seg = 7'b0100100; //2
         3: seg = 7'b0110000; //3
         4: seg = 7'b0011001; // 4
         5: seg = 7'b0010010; // 5
         6: seg = 7'b0000010; // 6
         7: seg = 7'b1111000; // 7
         8: seg = 7'b0000000; // 8
         9: seg = 7'b0010000; // 9
         14: seg = 7'b0111111;
         default: seg = 7'b1111111; // All segments off           
    endcase               
    end                
endmodule
