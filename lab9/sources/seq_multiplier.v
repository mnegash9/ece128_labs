module seq_multiplier (
    input clk,
    input [3:0] a,
    input [3:0] b,
    output reg [7:0] product);

    // registers for performing operations
    reg [7:0] multiplicand;
    reg [3:0] multiplier;
    reg [7:0] running_sum;
    reg [3:0] count; // count up to 4
    
    // state assignments
    parameter IDLE = 2'b00;
    parameter MULT = 2'b01;
    parameter UPDATE = 2'b10;
    parameter DONE = 2'b11;
    
    reg [1:0] state, next_state;
//    reg done_reg;
    
    always @(posedge clk) begin
        
        state <= next_state;
        case (state)
            IDLE: begin
                running_sum <= 0;
                count <= 0;
                multiplicand <= {4'b0, a};
                multiplier <= b;
            end
            MULT: begin
                if (multiplier[0])
                    running_sum <= running_sum + multiplicand;
            end
            
            UPDATE: begin
                // shift multiplier right
                multiplier <= multiplier >> 1;
                // shift multiplicand left
                multiplicand <= multiplicand << 1;
                // add to counter
                count <= count + 1;
            end
            
            DONE: begin
                product <= running_sum;
            end
            
            default:
                state <= IDLE;
            
        endcase
        
    end
    
    always @(*) begin
        case (state)
            IDLE: next_state = MULT;
            MULT: next_state = UPDATE;
            UPDATE: next_state = (count == 4) ? DONE : MULT;
            DONE: next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end
    
//    assign done = done_reg;
     
endmodule
