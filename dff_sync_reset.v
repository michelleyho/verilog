module dff_sync_reset(
    input wire clk,
    input wire data,
    input wire rst,
    output reg q
);
    always @ (posedge clk) begin
        if (rst == 1)begin
            q <= 1'b0;
        end
        else begin
            q <= data;
        end
    end
endmodule
