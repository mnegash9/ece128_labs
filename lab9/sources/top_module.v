module top_module( input clk, input [3:0] a, b, output [3:0] sseg_a_o, output [6:0] sseg_c_o);

    reg [11:0] binary_input;
    wire bcd_done;
    wire [7:0] result;
    wire [15:0] bcd_output;
    
    reg [15:0] stat_bcd;
    
    wire clk_out;
//    clock_divider uut4(clk, clk_out); // use for production, comment out for testbench
    assign clk_out = clk; // uncomment for testbench, since clock doesn't need to be divided
    
    
    
//    seq_multiplier u1(.clk(clk_out), .a(a), .b(b), .product(result));
    comb_multiplier u2(.clk(clk_out), .a(a), .b(b), .product(result));
    
    bin2bcd u3(.clk(clk_out), .bin_in({4'b0, result}), .bcd_out(bcd_output), .ready(bcd_done));
    
    multisegment_driver u4(.clk(clk_out), .bcd_in(stat_bcd), .sseg_a_o(sseg_a_o), .sseg_c_o(sseg_c_o));
    
    
    always@(posedge clk_out) begin
       
        if(bcd_done) 
            stat_bcd <= bcd_output;
        else 
            stat_bcd <= stat_bcd;
        
    end
    
endmodule