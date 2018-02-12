module ram_dp_sr_sw #(parameter DWIDTH = 8, AWIDTH=8)(
    cs0,oe0,we0,cs1,oe1,we1,data0,data1,address0,address1,clk
);
    parameter RAM_DEPTH = 1 << AWIDTH;
    input wire clk;
    input wire cs0;
    input wire oe0;
    input wire we0;
    input wire[AWIDTH-1:0] address0;
    inout wire[DWIDTH-1:0] data0;
    input wire cs1;
    input wire oe1;
    input wire we1;
    input wire[AWIDTH-1:0] address1;
    inout wire[DWIDTH-1:0] data1;
    
    reg[DWIDTH-1:0] data_out0;
    reg[DWIDTH-1:0] data_out1;
    reg[DWIDTH-1:0] mem[0:RAM_DEPTH-1];
    
    assign data0 = (cs0 && oe0 && !we0) ? data_out0 : DWIDTH'bz;
    assign data1 = (cs1 && oe1 && !we1) ? data_out1 : DWIDTH'bz;


    //Read block addr0
    always @(posedge clk)begin
        if (cs0 && oe0 && !we0)begin
            data_out0 <= mem[address0];
        end
    end

    //Read block addr1
    always @(posedge clk)begin
        if (cs1 && oe1 && !we1)begin
            data1 <= mem[address1];
        end
    end
    //Write Block addr0
    always @ (posedge clk)begin
        if (cs0 && we0)begin
            mem[address0] <= data0;
        end
    end
    //Write Block addr1
    always @ (posedge clk)begin
        if (cs1 && we1)begin
            mem[address1] <= data1;
        end

    end
endmodule
