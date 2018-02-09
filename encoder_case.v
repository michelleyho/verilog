module encoder_case(
    input wire [15:0] encode_in,
    input enable,
    output reg [3:0] encode_out 
);
    always @ (encode_in,enable)begin
        encode_out = 0;
        if (enable)begin
            case(encode_in):
                16'0002: encode_out = 1;
                16'0004: encode_out = 2;
                16'0008: encode_out = 3;
                16'0010: encode_out = 4;
                16'0020: encode_out = 5;
                16'0040: encode_out = 6;
                16'0080: encode_out = 7;
                16'0100: encode_out = 8;
                16'0200: encode_out = 9;
                16'0400: encode_out = 10;
                16'0800: encode_out = 11;
                16'1000: encode_out = 12;
                16'2000: encode_out = 13;
                16'4000: encode_out = 14;
                16'8000: encode_out = 15;
            endcase
        end
    end
endmodule
