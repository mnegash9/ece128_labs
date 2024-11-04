`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2024 01:36:46 PM
// Design Name: 
// Module Name: mealy
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

// mealy machine to get state machine to create 1101
module mealy(input P1,P0,clk,reset,  //P1-to represent 1, P0-to represent 0
        output reg z);
        
    // state encodings
    parameter S0 = 0 , S1 = 1 , S2 = 2 , S3 = 3;
    reg [2:0] PS,NS ;
    
    always@(posedge clk or posedge reset)
    begin
        if(reset)
            PS <= S0;   
        else    
            PS <= NS ;
    end             

    // Next state and output logic
    always@(PS or P1 or P0)
    begin 
        
        z = 0; // default output
        case(PS)
            S0 : begin 
                if (P1)
                    NS <= S1;
                else 
                    NS <= S0;
                end
            S1 : begin 
                if (P1)
                    NS <= S2;
                else 
                    NS <= S1;
                end
            S2 : begin 
                if (P0)
                    NS <= S3;
                else 
                    NS <= S2;
                end 
            S3 : begin 
                if (P1) begin // return to start and set output to 1
                    NS <= S0;
                    z = 1;
                end else 
                    NS <= S3;
                end 
            default: NS <= S0;
        endcase
    end   

endmodule
