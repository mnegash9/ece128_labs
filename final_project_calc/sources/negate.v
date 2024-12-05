module negate(input clk, input [3:0] a, b, output [7:0] negation);
    
    assign negation = {~a[3], ~a[2], ~a[1], ~a[0]};
    

endmodule