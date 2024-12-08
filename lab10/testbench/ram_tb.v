module ram_tb(
    );
    
    reg clk, wr_en, rst;
    reg [2:0] addr;
    reg [7:0] data_in;
    wire [7:0] data_out;
    
    ram uut1(clk, rst, addr, data_in, wr_en, data_out);
    
    always begin 
        #5; clk = ~clk;
    end
    
    initial begin
        #10; clk = 0; rst = 0; wr_en = 0;  // initialize to 0
        #10; addr = 6; data_in = 8'hA9; wr_en = 1;  // set value to 8'hA9 at addr 6
        #10; wr_en = 0; // expect data_out value here to be 8'hA9
        #10; rst = 1; // check that it resets
        #10; rst = 0; addr = 4; data_in = 8'hF3; wr_en = 1;  // set value to 8'hF3 at addr 4
        #10; wr_en = 0; // expect data_out value here to be 8'hF3
        #10;
        #10; addr = 2; data_in = 8'hCA; wr_en = 1;  // set value to 8'hCA at addr 4
        #10; wr_en = 0; // expect data_out value here to be 8'hCA
        #10;
        $finish;
    end
    
endmodule
