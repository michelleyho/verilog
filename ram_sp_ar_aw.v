moduel ram_sp_ar_aw #(parameter DWIDTH = 8,AWIDTH=8)(
    cs,we,oe,data,address
);
    parameter RAM_DEPTH = 1 << AWIDTH;
    input wire cs;
    input wire we;
    input wire oe;
    inout wire[DWIDTH-1:0] data;
    input wire[AWIDTH-1:0] address;

    reg[DWIDTH-1:0] data_out;
    reg[DWIDTH-1:0] mem[0:RAM_DEPTH-1];

    assign data = (cs && oe && !we) ? data_out : DWIDTH'bz;

    //Read block
    always @ (cs or we or oe or address)begin
        if (cs && !we && oe)begin
            data_out <= mem[address];
        end
    end
    //Write block
    always @(cs or we or oe or address)begin
        if (cs && we)begin
            mem[address] <= data;
        end
    end

endmodule
