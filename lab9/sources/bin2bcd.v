`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2024 12:56:16 PM
// Design Name: 
// Module Name: bin2bcd
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


module bin2bcd(input clk, input [11:0] bin_in, 
    output [15:0] bcd_out, output ready);
    
    reg [27:0] binary_shift;    // Register to hold shifted binary input (28 bits) 12 + 16
    reg [4:0] shift_count;      // 5-bit counter to track shifts
    reg [1:0] add_counter = 0;
    reg [2:0] state = 0;
    reg result_ready;
    
    //State variables
    parameter IDLE      = 3'b000;
    parameter SETUP     = 3'b001;
    parameter ADD       = 3'b010;
    parameter SHIFT     = 3'b011;
    parameter DONE      = 3'b100;
    
    initial begin
        state <= 0;
    end
        
    always @(posedge clk) begin
    
        case (state)            
            
            IDLE: begin
                result_ready <= 0;
                binary_shift <= {16'b0, bin_in};
                shift_count <= 11;
                state <= ADD;
            end
            
            ADD:
            begin
                case(add_counter)
                0: begin
                    if(binary_shift[15:12] > 4) 
                        binary_shift[15:12] <= binary_shift[15:12] + 3;
                    add_counter <= add_counter + 1;
                    end
                1:  begin
                    if(binary_shift[19:16] > 4) 
                        binary_shift[19:16] <= binary_shift[19:16] + 3;
                    add_counter <= add_counter + 1;
                    end
                2: begin
                    if((binary_shift[23:20] > 4)) 
                        binary_shift[23:20] <= binary_shift[23:20] + 3;
                    add_counter <= add_counter + 1;
                    end
                3:  begin
                    if((binary_shift[27:24] > 4)) 
                        binary_shift[27:24] <= binary_shift[27:24] + 3;
                    add_counter <= 0;
                    state   <= SHIFT;
                    end
                endcase
            end
            SHIFT:
                begin
                shift_count <= shift_count - 1;
                binary_shift <= binary_shift << 1;
                
                if (shift_count == 0) 
                    state <= DONE;
                else 
                    state <= ADD;
       
                end
                
            DONE: begin 
                result_ready <= 1;
                state <= IDLE;
            end                
        endcase

            
    end 
    assign bcd_out = binary_shift[27:12];
    assign ready = result_ready;
    
endmodule