module my_xor(input clk, input [3:0] a, b, output [7:0] product);
    
    // XOR as a bitwise operation
    assign product = {a[3] ^ b[3], a[2] ^ b[2], a[1] ^ b[1], a[0] ^ b[0]};
    

endmodule