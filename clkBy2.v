module clkBy2(
    input wire clk,
    input wire rst,
    output reg outClk
);
    always @ (posedge clk)begin
        if (rst == 1'b1) begin
            outClk <= 1'b0;
        end
            outClk <= ~outClk;
    end
endmodule
