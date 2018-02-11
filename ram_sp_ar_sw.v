module ram_sp_ar_sw #(parameter DWIDTH = 8, AWIDTH = 8)(
    clk,address,data,cs,oe,we
);
    parameter RAM_DEPTH = 1<< AWIDTH;
    input wire clk;
    input wire cs;
    input wire oe;
    input wire we;
    inout wire[DWIDTH-1:0] data;
    input wire[AWIDTH-1:0] address;
  
    reg[DWIDTH-1:0] data_out;
    reg[DWIDTH-1:0] mem[0:RAM_DEPTH-1];

    assign data = (cs && oe && !we) ? data : DWIDTH'bz;
    //Read block
    always @ (cs or oe or we or address)begin
       if (cs && oe && !we) begin
            data_out <= mem[address];
       end 
    end
    
    //Write block 
    always @ (posedge clk) begin
        if (cs && we) begin
            mem[address] <= data;
        end
    end
endmodule
