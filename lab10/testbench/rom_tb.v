module rom_tb(
);
    reg clk;
    reg [2:0] addr;
    wire [3:0] data_out;
    
    rom uut1(clk, addr, data_out);
    
    always begin 
        #5; clk = ~clk;
    end
    
    initial begin
        #10; clk = 0; addr = 0;
        #10;
        #10; addr = 6; // should be 1001
        #10; addr = 4; // should be 0011
        #10; addr = 2; // should be 1010
        #10;
        $finish;
    end
endmodule