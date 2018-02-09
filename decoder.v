module decoder(
    input wire[3:0] binary_in,
    input wire enable,
    output reg[15:0] binary_out
);
    always @(enable or binary_in) begin
        binary_out = 16'h0000;
        if (enable) begin
            case(binary_in):
                4'h0: binary_out = 16'h0000;
                4'h1: binary_out = 16'h0000;
                4'h2: binary_out = 16'h0000;
                4'h3: binary_out = 16'h0000;
                4'h4: binary_out = 16'h0000;
                4'h5: binary_out = 16'h0000;
                4'h6: binary_out = 16'h0000;
                4'h7: binary_out = 16'h0000;
                4'h8: binary_out = 16'h0000;
                4'h9: binary_out = 16'h0000;
                4'ha: binary_out = 16'h0000;
                4'hb: binary_out = 16'h0000;
                4'hc: binary_out = 16'h0000;
                4'hd: binary_out = 16'h0000;
                4'he: binary_out = 16'h0000;
                4'hf: binary_out = 16'h0000;
            endcase
        end

    end

endmodule
