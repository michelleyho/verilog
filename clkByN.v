module clkByN #(parameter N = 6, WIDTH = 3)(
    input wire clk,
    input wire rst,
    output reg[WIDTH-1:0] outClk 
);
    reg[WIDTH-1:0] rclk;
    wire [WIDTH-1:0] wClkTrack;
    
    assign wClkTrack = rClk + 1;

    always @ (posedge clk) begin
        if (rst == 1'b1) begin
            outClk <= 1'b0;
        end
        else if (rClk == N/2)begin
            rClk <= 0;
            outClk <= ~outClk;
        end
        else begin
            rClk <= wClkTrack;
        end
    end
endmodule
