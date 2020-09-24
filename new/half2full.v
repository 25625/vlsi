`timescale 1ns / 1ns
module half2full(s,cout,a,b,cin);
input a,b,cin;
output s,cout;
wire [3:1]w;
hag h1(w[1],w[2],a,b);
hag h2(s,w[3],w[1],cin);
or carry(cout,w[2],w[3]);
endmodule
