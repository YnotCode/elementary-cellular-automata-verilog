`include "TwoToOneMux.v"

//calculates the next state for a cell given the elementary rule and the current state 
//current state is the value of the cell and its 2 neighbors
module CalcNextCellState(rule, current_state, next_state);
    input [7 : 0] rule;
    input [2 : 0] current_state;
    output next_state;

    wire m1_out;
    TwoToOneMux m1(rule[7], rule[6], current_state[0], m1_out);

    wire m2_out;
    TwoToOneMux m2(rule[5], rule[4], current_state[0], m2_out);

    wire m3_out;
    TwoToOneMux m3(rule[3], rule[2], current_state[0], m3_out);

    wire m4_out;
    TwoToOneMux m4(rule[1], rule[0], current_state[0], m4_out);

    wire m5_out;
    TwoToOneMux m5(m1_out, m2_out, current_state[1], m5_out);

    wire m6_out;
    TwoToOneMux m6(m3_out, m4_out, current_state[1], m6_out);

    TwoToOneMux m7(m5_out, m6_out, current_state[2], next_state);
endmodule