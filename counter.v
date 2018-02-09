module counter(
    clock,reset,enable,out
);

input wire clock;
input wire reset;
input wire enable;
output reg[3:0] out;

always @ (posedge clock) begin:
    if (reset == 1'b1)begin
        out <= 4'b000;
    end
    else if (enable == 1'b1)begin
        out <= out + 1'b1;
    end
end
endmodule

