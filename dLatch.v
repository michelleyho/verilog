module dLatch(
    input wire data,
    input wire rst,
    input wire en,
    output reg  q
);

    always @(en or rst or data)begin
        if (rst == 1'b1)begin
            q = 1'b0;
        end
        else if (en == 1'b1) begin
            q = data;
        end
    end
endmodule
