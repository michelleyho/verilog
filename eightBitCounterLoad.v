module eightBitCounterLoad(
    input wire clk,
    input wire en,
    input wire rst,
    input wire load,
    input wire [7:0] data,
    output reg [7:0] out
);
   
    always @ (posedge clk) begin
        if (rst == 1'b1)begin
            out <= 8'b0;
        end
        else if (load == 1'b1) begin
            out <= data;
        end
        else if (en == 1'b1) begin
            out <= out + 1'b1;
        end
    end 
endmodule
