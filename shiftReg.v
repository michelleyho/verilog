//https://www.nandland.com/verilog/examples/example-shift-operator-verilog.html
module shiftRegister(
    clock,inVal,outVal
);

reg [3:0] Input_Delay;
  
always @(posedge clock)
  begin
    // Create a delayed version of signal Input
    Input_Delay    <= Input_Delay << 1;
    Input_Delay[0] <= Input;
 
    // FYI: Same Code not using Shift Operator:
    Input_Delay[1] <= Input_Delay[0];
    Input_Delay[2] <= Input_Delay[1];
    Input_Delay[3] <= Input_Delay[2];
    Input_Delay[0] <= Input;
  
    if (Input_Delay[3] == 1'b1)
      // Do Stuff
  end
