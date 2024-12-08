module top_module_tb(
    );
    reg clk, reset;
    reg [2:0] adr1_r, adr2_r, adr_ram;
    wire [7:0] result;
    wire [2:0] st_out;
    top_module uut1( clk, reset, adr1_r, adr2_r, adr_ram, result, st_out);
    
    always begin
        #5; clk = ~clk;
    end
    
    initial begin
        clk = 0; reset = 0'b1; 
        #10; reset = 0'b0; adr1_r = 3'b011; adr2_r = 3'b001; adr_ram = 3'b001; 
        #100; reset = 0'b1; // expect result of 15 * 5 = 75 
        #10; reset = 0'b0; adr1_r = 3'b111; adr2_r = 3'b110; adr_ram = 3'b010; 
        #100; reset = 0'b1; // expect result of 12 * 9 = 108
        $finish; 
    
    end
endmodule
