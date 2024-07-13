`timescale 1ns/1ns
`include "TwoToOneMux.v"

module TwoToOneMux_TestBench();
    reg A;
    reg B;
    reg S;
    wire cout;
    TwoToOneMux f(A, B, S, cout);

    initial begin
        $dumpfile("./Waveforms/TwoToOneMux_TestBench.vcd");
        $dumpvars(0,  TwoToOneMux_TestBench);
        A <= 1'b0; B <= 1'b0; S <= 1'b0; #5;
        A <= 1'b0; B <= 1'b0; S <= 1'b1; #5;
        A <= 1'b0; B <= 1'b1; S <= 1'b0; #5;
        A <= 1'b0; B <= 1'b1; S <= 1'b1; #5;
        A <= 1'b1; B <= 1'b0; S <= 1'b0; #5;
        A <= 1'b1; B <= 1'b0; S <= 1'b1; #5;
        A <= 1'b1; B <= 1'b1; S <= 1'b0; #5;
        A <= 1'b1; B <= 1'b1; S <= 1'b1; #5;
    end

endmodule