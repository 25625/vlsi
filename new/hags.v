`timescale 1ns / 1ns
module hags(s,c,a,b);
input a,b;
output s,c;
xor sum(s,a,b);
and carry(c,a,b);
endmodule
