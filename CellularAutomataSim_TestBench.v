`timescale 1ns/1ns
`include "CellularAutomataSim.v"

module CellularAutomataSim_TestBench();

    reg [7 : 0] RULE;
    reg [7 : 0] INPUT;
    reg RST;
    reg CLK;
    wire [7 : 0] OUTPUT;

    CellularAutomataSim s(RULE, INPUT, RST, CLK, OUTPUT);

    initial begin
        $dumpfile("./Waveforms/CellularAutomataSim_TestBench.vcd");
        $dumpvars(0,  CellularAutomataSim_TestBench);
        INPUT <= 8'b00010000; RULE <= 8'b01101110; CLK <= 0; RST <= 1; #5;
        CLK <= ~CLK; #5;
        CLK <= ~CLK; #5;
        RST <= 0; CLK <= ~CLK; #5;
        CLK <= ~CLK; #5;
        CLK <= ~CLK; #5;
        CLK <= ~CLK; #5;
        CLK <= ~CLK; #5;
        CLK <= ~CLK; #5;
        CLK <= ~CLK; #5;
    end
endmodule