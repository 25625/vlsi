`timescale 1ns / 1ps
module mux21(y,i,s);
input [1:0]i;
input s;
output y;
wire [3:1]w;
not (w[1],s);
and (w[2],i[0],w[1]);
and (w[3],i[1],s);
or (y,w[2],w[3]);
endmodule
