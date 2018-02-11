module eightBitCounter(
    input wire clk,
    input wire en, 
    input wire rst,
    output reg[7:0] out
);

    always @(posedge clk)begin
        if (rst == 1'b1)begin
            out <= 8'b0;
        end
        else if (en) begin
            out <= out + 1;
        end
    end
endmodule
