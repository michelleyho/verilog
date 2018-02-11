module fibonacci(
    input wire clk,
    input wire rst,
    output wire[31:0] out 
);
    wire [31:0] prev = 0;
    wire [31:0] curr = 1;

    always @ (posedge clk) begin
        if (rst == 1'b1)begin
             prev <= 0;
             curr <= 1;
        end
        else begin
            prev <= curr;
            curr <= curr + prev;
        end
    end
    
    assign out = curr;
    

endmodule
