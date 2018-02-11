module lfsrCounter(
    input wire clk,
    input wire rst,
    input wire en,
    output reg [7:0] out
);
    wire feedback;
    assign feedback = !(out[7]^out[3]);

    always @(posedge clk) begin
        if (rst == 1'b1)begin
            out <= 8'b0;
        end
        else if (en == 1'b1) begin
            out <= {out[6],out[5],out[4],out[3],out[2],out[1],out[0],feedback};
        end
    end

endmodule
