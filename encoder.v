module encoder(
    input [15:0] encode_in, 
    input enable,
    output [3:0] encode_out
);
    reg [3:0] encode_out;

    always @(enable or encode_in)begin
        encode_out = 0;
        if (enable) begin
            if (encode_in == 16'h0002)begin
                encode_out = 1;
            end
            if (encode_in == 16'h0004)begin
                encode_out = 2;
            end
            if (encode_in == 16'h0008)begin
                encode_out = 3;
            end
            if (encode_in == 16'h0010)begin
                encode_out = 4;
            end
            if (encode_in == 16'h0020)begin
                encode_out = 5;
            end
            if (encode_in == 16'h0040)begin
                encode_out = 6;
            end
            if (encode_in == 16'h0080)begin
                encode_out = 7;
            end
            if (encode_in == 16'h0100)begin
                encode_out = 8;
            end
            if (encode_in == 16'h0200)begin
                encode_out = 9;
            end
            if (encode_in == 16'h0400)begin
                encode_out = 10;
            end
            if (encode_in == 16'h0800)begin
                encode_out = 11;
            end
            if (encode_in == 16'h1000)begin
                encode_out = 12;
            end
            if (encode_in == 16'h2000)begin
                encode_out = 13;
            end
            if (encode_in == 16'h4000)begin
                encode_out = 14;
            end
            if (encode_in == 16'h8000)begin
                encode_out = 15;
            end
        end
    end
endmodule
