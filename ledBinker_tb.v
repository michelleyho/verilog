`include ledBlinker.v

module ledBlinker_tb();

    reg clk = 1'b0;
    reg in1 = 1'b0;
    reg in2 = 1'b0;
    reg en = 1'b0;
    wire ledOut;

    always #20 clk = !clk;

    intial begin
        #10 en = 1'b1;
        #20 

    end

    ledBlinker led(
        .clock(clk),
        .switch1(in1),
        .switch2(in2),
        .enable(en),
        .ledOut(ledOut) 
    );
