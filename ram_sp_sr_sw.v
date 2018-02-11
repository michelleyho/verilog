module ram_sp_sr_rw #(parameter DWIDTH=8,AWIDTH = 8)(
    clk,cs,we,oe,addr,data
);
    parameter DEPTH = 1 << ADDR_WIDTH;
    input wire clk;
    input wire cs;
    input wire we;
    input reg  oe;
    input wire[AWIDTH-1:0] addr;
    inout wire[DWIDTH-1:0] data;

    reg[DWIDTH-1:0] data_out;
    reg[DWIDTH-1:0] mem[0:DEPTH-1]
    
    assign data = (cs && oe && !we) ? data_out : 8'bz;

    //Read operation
    always @ (posedge clk) begin
        if (cs && oe && !we) begin
            data_out <= mem[addr];
            oe <= 1'b1;
        end
        else begin
            oe <= 1'b0;
        end
    end

    //Write operation
    always @ (posedge clk) begin
        if (cs && we) begin
            mem[addr] <= data;
        end 
    end
endmodule
