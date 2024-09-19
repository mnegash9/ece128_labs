

module mux(input [1:0] d0, d1, d2, d3, s, output [1:0] yt);

    wire s0bar, s1bar;
    wire [1:0] W0, W1, W2, W3;
    
    not (s0bar, s[0]);
    not (s1bar, s[1]);
    
    and (W0[0], d0[0], s0bar, s1bar);
    and (W1[0], d1[0], s[0], s1bar);
    and (W2[0], d2[0], s0bar, s[1]);
    and (W3[0], d3[0], s[0], s[1]);  
    and (W0[1], d0[1], s0bar, s1bar);
    and (W1[1], d1[1], s[0], s1bar);
    and (W2[1], d2[1], s0bar, s[1]);
    and (W3[1], d3[1], s[0], s[1]);
    
    or(yt[1], W0[0], W1[0], W2[0], W3[0]);
    or(yt[0], W0[1], W1[1], W2[1], W3[1]);

endmodule