module counter_tb();
    reg clock,reset,enable;
    wire out;

    initial begin
        $display("time clk reset enable")
        $monitor("%d\t %b %b %b",$time,clock,reset,enable)
    end

counter counter(
    .clock(clock),
    .reset(reset),
    .enable(enable)
    .out(out)
)
