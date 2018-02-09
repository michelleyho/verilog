module mux_assign(
    input wire sel,
    input wire a,
    input wire b,
    output wire out
);

    assign out = sel ? a : b;

endmodule
    
