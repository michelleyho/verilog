module tff_sync_reset(
    input wire clk,
    input wire data,
    input wire reset,
    output wire q
);
    always @ (posedge clk)begin
        if (reset == 1'b1)begin
            q <= 1'b0;
        end
        else if (data)begin
            q <= ~q;
        end
    end
endmodule
