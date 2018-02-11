module clkBy4(
    input wire clk,
    input wire rst,
    output reg outClk
);
    reg[1:0] rClk = 2'b00;
    wire[1:0] wClkTrack;

    assign wClkTrack = rClk + 1;

    always @ (posedge clk) begin
        if (rst == 1'b1) begin
            outClk <= 1'b0;
        end
        else if (rClk == 2'b10)begin
                rClk <= 2'b00;
                outClk <= ~outClk;
        end
        else begin
            rClk <= wClkTrack;
        end
    end
endmodule
