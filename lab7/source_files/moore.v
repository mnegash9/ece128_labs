`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 03:47:54 PM
// Design Name: 
// Module Name: moore
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

// 1100 using a moore machine
module moore(input P1,P0,clk,reset,  //P1-to represent 1, P0-to represent 0
    output reg z
    );
    
    // state encodings
    parameter S0 = 0 , S1 = 1 , S2 = 2 , S3 = 3, S4 = 4;
    reg [2:0] PS,NS ;
    
    always@(posedge clk or posedge reset)
    begin
        if(reset)
            PS <= S0;   
        else    
            PS <= NS ;
    end             

    // Next state logic
    always@(PS or P1 or P0)
    begin 
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
                if (P0)
                    NS <= S4;
                else 
                    NS <= S3;
                end 
            S4 : NS <= S0;
            default: NS <= S0;
        endcase
    end
    
    // Output Logic
    always @ (PS)
    begin
        case (PS)
            S0 : z = 0 ;
            S1 : z = 0 ;
            S2 : z = 0 ;
            S3 : z = 0 ;
            S4 : z = 1 ;
            default: z = 0;
        endcase
    end       

endmodule
