module control_unit_tb(
    );
    
    reg clk, reset;
    reg [2:0] adr1, adr2;
    
    wire w_rf, DA, SA, SB;
    wire [2:0] adr, st_out, w_ram;
    
    cu uut1( clk, reset,
 adr1, adr2, w_rf, adr, DA,SA,SB,
 st_out,
 w_ram
);
    
    always begin
        #5; clk = ~clk;
    end
    
    initial begin
        clk = 0; reset = 1; adr1 = 0; adr2 = 0;
        #10; reset = 0; adr1 = 3'b100; adr2 = 3'b001;
        #100;
        $finish;
    end
endmodule
