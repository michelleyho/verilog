module tff_asyn_reset(
    input wire clk,
    input wire data,
    input wire rst,
    outpu reg q
);
    always @ (posedge clk or negedge rst) begin
       if (rst == 1'b1)begin
            q <= 1'b0;
       end
       else if (data)begin
            q <= ~q;
       end 
    end
endmodule
