`timescale 1ns/1ns
`include "CalcNextCellState.v"

module CalcNextCellState_TestBench();
    reg [7 : 0] RULE;
    reg [2 : 0] STATE;
    wire NEXT_STATE;
    CalcNextCellState c(RULE, STATE, NEXT_STATE);

    initial begin
        $dumpfile("./Waveforms/CalcNextCellState_TestBench.vcd");
        $dumpvars(0,  CalcNextCellState_TestBench);
        RULE <= 8'b01101110; STATE <= 3'b111; #5;
        RULE <= 8'b01101110; STATE <= 3'b110; #5;
        RULE <= 8'b01101110; STATE <= 3'b101; #5;
        RULE <= 8'b01101110; STATE <= 3'b100; #5;
        RULE <= 8'b01101110; STATE <= 3'b011; #5;
        RULE <= 8'b01101110; STATE <= 3'b010; #5;
        RULE <= 8'b01101110; STATE <= 3'b001; #5;
        RULE <= 8'b01101110; STATE <= 3'b000; #5;

        RULE <= 8'b01011010; STATE <= 3'b111; #5;
        RULE <= 8'b01011010; STATE <= 3'b110; #5;
        RULE <= 8'b01011010; STATE <= 3'b101; #5;
        RULE <= 8'b01011010; STATE <= 3'b100; #5;
        RULE <= 8'b01011010; STATE <= 3'b011; #5;
        RULE <= 8'b01011010; STATE <= 3'b010; #5;
        RULE <= 8'b01011010; STATE <= 3'b001; #5;
        RULE <= 8'b01011010; STATE <= 3'b000; #5;
    end
endmodule
