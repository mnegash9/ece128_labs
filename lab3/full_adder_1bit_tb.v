module full_adder_1bit_tb();
    
    wire c_out, s;
    reg a, b, c_in;
    
    full_adder_1bit uut2(a, b, c_in, c_out, s);
    
    integer i, j, k;
    initial
    begin
        for(i = 0; i < 2; i = i + 1)
        begin
            a = i;
            #10;
            for (j = 0; j < 2; j = j+1) begin
                b = j;
                #10;
                for (k = 0; k < 2; k = k+1) begin
                    c_in = k;
                    #10;
                end
            end
            
        end
    end


endmodule