`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 02:01:54 AM
// Design Name: 
// Module Name: top_module
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


module top_module( input clk, input [2:0] operation, input [3:0] a, b, output [3:0] sseg_a_o, output [6:0] sseg_c_o);
  
    wire bcd_done;
    wire [15:0] bcd_output;
    reg [15:0] stat_bcd;
    
    wire clk_out;
//    clock_divider uut4(clk, clk_out); // use for production, comment out for testbench
    assign clk_out = clk; // uncomment for testbench, since clock doesn't need to be divided
    
    parameter [2:0] MULTIPLY = 3'b000;
    parameter [2:0] ADD = 3'b001;
    parameter [2:0] DIVIDE = 3'b010;
    parameter [2:0] SUBTRACT = 3'b011;
    parameter [2:0] NEGATE = 3'b100;
    parameter [2:0] AND = 3'b101;
    parameter [2:0] OR = 3'b110;
    parameter [2:0] XOR = 3'b111;
    
    reg [11:0] result;
    wire [7:0] mult_result;
    wire [7:0] add_result;
    wire [7:0] div_result;
    wire [7:0] sub_result;
    wire [7:0] neg_result;
    wire [7:0] and_result;
    wire [7:0] or_result;
    wire [7:0] xor_result;
    
    // Arithmetic Operations
    multiplier u1(.clk(clk_out), .a(a), .b(b), .product(mult_result));
    adder u5(.clk(clk_out), .a(a), .b(b), .product(add_result));
    divider u6(.clk(clk_out), .a(a), .b(b), .quotient(div_result));
    subtracter u7(.clk(clk_out), .a(a), .b(b), .difference(sub_result));
    
    // Logical Operations
    negate u8(.clk(clk_out), .a(a), .b(b), .negation(neg_result));
    my_and u9(.clk(clk_out), .a(a), .b(b), .product(and_result));
    my_or u10(.clk(clk_out), .a(a), .b(b), .product(or_result));
    my_xor u11(.clk(clk_out), .a(a), .b(b), .product(xor_result));
    
    // Display Drivers
    bin2bcd u3(.clk(clk_out), .bin_in(result), .bcd_out(bcd_output), .ready(bcd_done));
    multisegment_driver u4(.clk(clk_out), .bcd_in(stat_bcd), .sseg_a_o(sseg_a_o), .sseg_c_o(sseg_c_o));
    
    always@(posedge clk_out) begin
        
        // Assign result depending on operation
        case (operation)
            MULTIPLY: result <= {4'b0000, mult_result};
            ADD: result <= {4'b0000, add_result};
            DIVIDE: result <= {4'b0000, div_result};
            SUBTRACT: result <= {4'b0000, sub_result};
            NEGATE: result <= {4'b1110, neg_result};
            AND: result <= {4'b0000, and_result};
            OR: result <= {4'b0000, or_result};
            XOR: result <= {4'b0000, xor_result};
        endcase
       
       // Display output to stat_bcd when the bcd module is ready
        if(bcd_done) 
            stat_bcd <= bcd_output;
        else 
            stat_bcd <= stat_bcd;
        
    end
    
endmodule