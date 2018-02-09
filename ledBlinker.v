module ledBlinker(
    clock,switch1,switch2,enable,ledOut
);

input wire clock;
input wire switch1;
input wire switch2;
input wire enable;
output wire ledOut;

//25000/freq * 0.5 duty cycle
parameter 100Hz_CONST = 125;
parameter 50Hz_CONST = 250;
parameter 10Hz_CONST = 1250;
parameter 1Hz_cCONST = 12500;

//actual counters
reg [31:0] counter100;
reg [31:0] counter50;
reg [31:0] counter10;
reg [31:0] counter1;

reg toggle100;
reg toggle50;
reg toggle10;
reg toggle1;

reg led_select;

//Counter update:

always @ (posedge clock)begin
    begin
        if (counter100 == 100Hz_CONST-1)begin
            toggle100 <= !toggle100;
            counter100 <= 1'b0;
        end
        else begin
            counter100 <= counter100 + 1'b1;
        end
    end
    
    begin
        if (counter50 == 50Hz_CONST-1)begin
            toggle50 <= !toggle50;
            counter50 <= 1'b0;
        end
        else begin
            counter50 <= counter50 + 1'b1;
        end
    end

    begin
        if (counter10 == 10Hz_CONST-1)begin
            toggle10 <= !toggle10;
            counter10 <= 1'b0;
        end
        else begin
            counter10 <= counter10 + 1'b1;
        end
    end

    begin
        if (counter1 == 1Hz_CONST-1)begin
            toggle1 <= !toggle1;
            counter1 <= 1'b0;
        end
        else begin
            counter1 <= counter1 + 1'b1;
        end
    end
end

always @ (posedge clock)begin
    case ({switch1,switch2})begin
        2'b00: ledSelect <= toggle100;
        2'b01: ledSelect <= toggle50;
        2'b10: ledSelect <= toggle10;
        2'b11: ledSelect <= toggle1;
    end
end

assign ledOut = ledSelect & enable;

end
