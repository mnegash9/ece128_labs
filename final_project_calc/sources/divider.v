module divider(input clk, input [3:0] a, b, output [7:0] quotient);

    // The quotient and remainder
    reg [7:0] q;        // Quotient register

    always @(*) begin
        if (b != 0) begin
            q = a / b;     
        end else begin
            q = 8'b00000000;  // Default values when divisor is 0 (avoid division by 0)
        end
    end
    
    assign quotient = q;


endmodule