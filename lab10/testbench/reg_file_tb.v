module reg_file_tb(
    );
    
    
    reg rst, clk, W, DA, SA, SB;
    reg [3:0] D_rom;
    
    wire [3:0] A, B;
    
    RF uut1(A, B, SA, SB, D_rom, DA, W, rst, clk);
    
    always begin
        #5; clk = ~clk;
    end
    
    initial begin
        clk = 0; W = 0; rst = 1'b1; DA = 0; SA = 0; SB = 1; D_rom = 4'b0000;
        // write 1101 to reg B
        #10; rst = 0; DA = 1; W = 1'b1; D_rom = 4'b1101;
        // write 1001 to reg A
        #10; rst = 0; DA = 0; W = 1'b1; D_rom = 4'b1001;
        
        // read register A
         #10; W = 0; DA = 0;  // A register should be 1001
         
        #10; W = 0; DA = 0; // B register should be 1101 
       
       // write to reg A
        #10; rst = 0; DA = 0; W = 1'b1; D_rom = 4'b0011;
        // write to reg B
        #10; rst = 0; DA = 1; W = 1'b1; D_rom = 4'b0101;
        
        // read register A
         #10; W = 0; DA = 0;  // A register should be 0011
         // read register B
        #10; W = 0; DA = 0; // B register should be 0101
       
       
        #10; $finish;
    end
endmodule
