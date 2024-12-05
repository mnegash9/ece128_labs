module bin2bcd(input clk, input [11:0] bin_in, 
    output reg [15:0] bcd_out, output reg ready);
    
    reg [27:0] binary_shift;    // Register to hold shifted binary input (28 bits) 12 + 16
    reg [4:0] shift_count;      // 5-bit counter to track shifts
    reg [1:0] add_counter = 0;
    reg [2:0] state = 0;
    reg negative = 0;  // To store the sign bit
    
    //State variables
    parameter IDLE      = 3'b000;
    parameter SETUP     = 3'b001;
    parameter ADD       = 3'b010;
    parameter SHIFT     = 3'b011;
    parameter DONE      = 3'b100;
    
    initial begin
        state <= 0;
    end
        
    always @(posedge clk) begin
    
        case (state)            
            
            IDLE: begin
                ready <= 0;
                shift_count <= 11;
                
                // support for negative numbers
                if (bin_in[11:8] == 4'b1110) begin
                    negative <= 1;  // Set negative flag if MSB is 1
                    binary_shift <= {20'b0, bin_in[7:0]};  // Smaller number
                end else begin
                    negative <= 0; // Set negative flag off
                    binary_shift <= {16'b0, bin_in};
                end
                state <= ADD;
            end
            
            ADD:
            begin
                case(add_counter)
                0: begin
                    if(binary_shift[15:12] > 4) 
                        binary_shift[15:12] <= binary_shift[15:12] + 3;
                    add_counter <= add_counter + 1;
                    end
                1:  begin
                    if(binary_shift[19:16] > 4) 
                        binary_shift[19:16] <= binary_shift[19:16] + 3;
                    add_counter <= add_counter + 1;
                    end
                2: begin
                    if((binary_shift[23:20] > 4)) 
                        binary_shift[23:20] <= binary_shift[23:20] + 3;
                    add_counter <= add_counter + 1;
                    end
                3:  begin
                    if((binary_shift[27:24] > 4)) 
                        binary_shift[27:24] <= binary_shift[27:24] + 3;
                    add_counter <= 0;
                    state   <= SHIFT;
                    end
                endcase
            end
            SHIFT:
                begin
                shift_count <= shift_count - 1;
                binary_shift <= binary_shift << 1;
                
                if (shift_count == 0) 
                    state <= DONE;
                else 
                    state <= ADD;
       
                end
                
            DONE: begin 
                if (negative) begin
                    bcd_out <= {4'b1110, binary_shift[23:12]}; // Add a sign symbol for negative numbers
                end else begin
                    bcd_out <= binary_shift[27:12]; // Normal BCD output
                end
                ready <= 1;
                state <= IDLE;
            end                
        endcase

            
    end 
    
endmodule