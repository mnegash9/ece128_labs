module d_flipflop_async(input clk, D, reset, output reg Q
    );
    
    always @(posedge clk or reset) begin
        if (reset) begin
            Q <= 1'b0;
        end else begin
            Q <= D;
        end
    end
endmodule
