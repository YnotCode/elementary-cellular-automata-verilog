//2-1 mux that takes selects a when s = 1 and b when s = 0
module TwoToOneMux(a, b, s, out);
    input a;
    input b;
    input s;
    output out;
    assign out = (a & s) | (b & ~s);
endmodule