module syncFifo #(parameter DWIDTH=8,AWIDTH=8)(
    clk,rst,wr_cs,rd_cs,wr_en,rd_en,data_in,data_out,empty,full
);
    parameter RAM_DEPTH = 1 << AWIDTH;
    input wire clk;
    input wire rst;
    input wire wr_cs;
    input wire rd_cs;
    input wire wr_en;
    input wire rd_en;
    input wire[DWIDTH-1:0] data_in;
    output wire[DWIDTH-1:0] data_out;
    output wire empty;
    output wire full;

    reg[AWDITH-1:0] rdPtr;
    reg[AWIDTH-1:0] wrPtr;
    reg[DWIDTH-1:0] data_out;
    reg[AWIDTH-1:0] entriesCount;

    assign full = (entriesCount == RAM_DEPTH-1);
    assign empty = entriesCount == 0;

    always @(posedge clk)begin
        if (rst)begin
            wrPtr <= 0;
        end 
        else if (wr_cs && wr_en)begin
            wrPtr <= wrPtr + 1;
        end
    end

    always @ (posedge clk) begin
        if (rst) begin
            rdPtr <= 0;
        end
        else if (rd_cs && rd_en)begin
            rdPtr <= rdPtr + 1;
        end
    end

    always @ (posedge clk or negedge rst)begin
        if (rst) begin
            entriesCount <= 0;
        end
        else if ((wr_cs && wr_en) && !(rd_cs && rd_en) && entriesCount != RAM_DEPTH)begin
            entriesCount <= entriesCount + 1; 
        end
        else if((rd_cs && rd_en) && !(wr_cs && wr_en) && (entriesCount != 0))begin
            entriesCount <= entriesCount - 1;
        end
    end

    
