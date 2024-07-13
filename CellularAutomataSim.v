`include "CalcNextCellState.v"

/*
Simulates elementary cellular automata with 8 cells.
rule : the number of the rule 
input_state : the starting state of the 8 cells
clk : the clock
result : output for the state of the cells 
*/
module CellularAutomataSim (rule, input_state, rst, clk, result);
    input [7 : 0] rule;
    input [7 : 0] input_state;
    input rst;
    input clk;
    output reg [7 : 0] result;
    wire [7 : 0] next_state;
    wire [2 : 0] left_edge;
    wire [2 : 0] right_edge;

    //wrap around to get the neighbors of the edge cells
    assign left_edge = {result[0], result[7], result[6]};
    assign right_edge = {result[1], result[0], result[7]};

    //instantiate 8 calculations of the next state of the cells
    CalcNextCellState c0(rule, left_edge, next_state[7]);
    CalcNextCellState c1(rule, result[7 : 5], next_state[6]);
    CalcNextCellState c2(rule, result[6 : 4], next_state[5]);
    CalcNextCellState c3(rule, result[5 : 3], next_state[4]);
    CalcNextCellState c4(rule, result[4 : 2], next_state[3]);
    CalcNextCellState c5(rule, result[3 : 1], next_state[2]);
    CalcNextCellState c6(rule, result[2 : 0], next_state[1]);
    CalcNextCellState c7(rule, right_edge, next_state[0]);
    
    //each clock cycle update the state of the cells
    always @(posedge clk) begin
        if (rst) begin
            result <= input_state;
        end
        else begin
            result <= next_state;
        end
    end

endmodule