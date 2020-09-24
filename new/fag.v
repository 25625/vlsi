`resetall
`timescale 1ns/1ns
module fag(a,b,cin,s,cout);
input a,b,cin;
output cout,s;
wire w[1:3];
xor xorgate1(w[1],a,b);
and andgate1(w[2],a,b);
xor xorgate2(s,w[1],cin);
and andgate2(w[3],w[1],cin);
or orgate1(cout,w[3],w[2]);
endmodule