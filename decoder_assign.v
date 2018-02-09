module decoder_assign(
    input wire[3:0] binaryIn,
    input wire enable,
    output wire[15:0] binaryOut
);
    assign binaryOut = enable ? (1<<binaryIn) : 0;

endmodule

    
