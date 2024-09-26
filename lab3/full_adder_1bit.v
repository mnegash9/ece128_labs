module full_adder_1bit(input a, b, c_in, output c_out, s);

    assign s = a^b^c_in;
    assign c_out = b & c_in | a & c_in | a & b;


endmodule