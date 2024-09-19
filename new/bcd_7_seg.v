module bcd_7_seg(ytt, seg);
    
    input [3:0] ytt;
    output reg [6:0] seg;
    always@(*)
    begin
        case(ytt)
            0: seg = 7'b1000000;
            1: seg = 7'b1111001;
            2: seg = 7'b0100100;
            3: seg = 7'b0110000;
            4: seg = 7'b1000000;
            5: seg = 7'b1111001;
            6: seg = 7'b0100100;
            7: seg = 7'b0110001;
        endcase
    end

endmodule