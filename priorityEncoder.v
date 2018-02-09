module priorityEncoder(
    input enable,
    input wire[15:0] encode_in,
    output reg[3:0] encode_out
);
    always@(enable or encode_in)begin
       encode_out = 0;
        if (enable)begin
            if (encode_in[1] == 1)begin
                encode_out = 1;
            end
            if (encode_in[2] == 1)begin
                encode_out = 1;
            end
            if (encode_in[3] == 1)begin
                encode_out = 1;
            end
            if (encode_in[4] == 1)begin
                encode_out = 1;
            end
            if (encode_in[5] == 1)begin
                encode_out = 1;
            end
            if (encode_in[6] == 1)begin
                encode_out = 1;
            end
            if (encode_in[7] == 1)begin
                encode_out = 1;
            end
            if (encode_in[8] == 1)begin
                encode_out = 1;
            end
            if (encode_in[9] == 1)begin
                encode_out = 1;
            end
            if (encode_in[10] == 1)begin
                encode_out = 1;
            end
            if (encode_in[11] == 1)begin
                encode_out = 1;
            end
            if (encode_in[12] == 1)begin
                encode_out = 1;
            end
            if (encode_in[13] == 1)begin
                encode_out = 1;
            end
            if (encode_in[14] == 1)begin
                encode_out = 1;
            end
            if (encode_in[15] == 1)begin
                encode_out = 1;
            end
        end
    end
endmodule
