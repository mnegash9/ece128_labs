module adder(input clk, input [3:0] a, b, output [7:0] product);

    wire c_mid;              
    wire [1:0] sum_low;      // Sum from first 2-bit adder
    wire [1:0] sum_high;     // Sum from second 2-bit adder
    wire c_out;              // Final carry out
    
    // Split the 4-bit addition into two 2-bit additions
    full_adder_2bit lower_bits(.a(a[1:0]), .b(b[1:0]), .c_in(1'b0), .c_out(c_mid), .s(sum_low));
    
    full_adder_2bit upper_bits(.a(a[3:2]), .b(b[3:2]), .c_in(c_mid),.c_out(c_out), .s(sum_high));
    
    // Combine results into final 8-bit output
    assign product = {3'b0, c_out, sum_high, sum_low};
endmodule

module full_adder_2bit(input [1:0] a, b, input c_in, output c_out, output [1:0] s);
    
    wire c; 
    full_adder_1bit a0(a[0], b[0], c_in, c, s[0]);
    full_adder_1bit a1(a[1], b[1], c, c_out, s[1]);

endmodule

module full_adder_1bit(input a, b, c_in, output c_out, s);
    
    assign s = a^b^c_in;
    assign c_out = b & c_in | a & c_in | a & b;

endmodule