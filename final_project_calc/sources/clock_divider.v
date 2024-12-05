module clock_divider(clk_in,clk_out);

    input wire clk_in;   // Input clock signal
    output reg clk_out=1'b0;  // Output clock signal (divided)
    
    
    parameter DIVISOR = 4096;  // Adjust this based on your desired clock frequency
    reg [12:0] counter = 12'd0;     // 32-bit counter

    always @(posedge clk_in) begin
        if (counter == (DIVISOR - 1)) begin
            counter <= 12'd0;      // Reset the counter
            clk_out <= ~clk_out;   // Toggle the output clock
        end
        else begin
            counter <= counter + 1;  // Increment the counter
        end
    end
endmodule
