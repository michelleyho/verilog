module mux_case(
    input wire sel,
    input wire a,
    input wire b,
    output reg out
);
    always @ (sel or a or b)begin
        case (sel):
            1'b0: out = a;
            1'b1: out = b;
        endcase
    end
endmodule
