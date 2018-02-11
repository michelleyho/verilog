module eightBitUpDownCounter(
    input wire clk,
    input wire up_down,
    input wire rst,
    output reg[7:0] out
);

    always @(posedge clk) begin
        if (rst == 1'b1) begin
            out <= 8'b0;
        end
        else if (up_down) begin
            out <= out + 1'b1;
        end
        else begin
            out <= out - 1'b1;
        end
    end
endmodule
