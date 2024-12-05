module top_module_tb(
    );
    
    reg clk;
    reg [2:0] operation;
    reg [3:0] a, b;
    wire [3:0] sseg_a_o;
    wire [6:0] sseg_c_o;
    
    top_module uut1(clk, operation, a, b, sseg_a_o, sseg_c_o);
    
    always begin
        #5; clk = ~clk;
    end
    
    initial begin
        clk = 0; operation = 3'b000; a = 4'b0000; b = 4'b0000;
        #10; operation = 3'b000; a = 4'b0001; b = 4'b0011; // Multiplication: 3 * 1
        #1000; operation = 3'b001; a = 4'b0001; b = 4'b0011; // Addition: 3 * 1
        #1000; operation = 3'b010; a = 4'b0001; b = 4'b0011; // Division: 3 / 1
        #1000; operation = 3'b011; a = 4'b0011; b = 4'b0001; // Subtraction: 3 - 1
        #500; operation = 3'b100; a = 4'b0001; b = 4'b0011; // Negation: ~(3) (should be 0)
        #500; operation = 3'b101; a = 4'b0001; b = 4'b0011; // AND: 3 & 1 (should be 1)
        #500; operation = 3'b110; a = 4'b0001; b = 4'b0011; // OR: 3 | 1 (should be 3)
        #500; operation = 3'b000; a = 4'b0001; b = 4'b0011; // XOR: 3 ^ 1 (should be 2)
        #500;
        $finish;
    end

endmodule
