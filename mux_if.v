module mux_if (
    input wire sel,
    input wire a,
    input wire b,
    output reg out
);
    always @ (sel or a or b)begin
        if (sel == 0)begin
            out = a;
        end
        else begin
            out = b;
        end
    end
endmodule
