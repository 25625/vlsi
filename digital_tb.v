`timescale 1s / 0.1s
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2019 12:16:48 PM
// Design Name: 
// Module Name: counter_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module digital_tb();
reg clk,res;
wire [5:0]sec;
wire [5:0]min;
wire [4:0]hr;
wire [4:0]dd;
wire [3:0]mm;
wire [11:0]yy;
wire [1:3]ww;
reg sc,mn,hrs,dt,mon,yr;
digital c(.clk(clk),.res(res),.sec(sec),.min(min),.hr(hr),.dd(dd),.mm(mm),.yy(yy),.sc(sc),.mn(mn),.hrs(hrs),.dt(dt),.mon(mon),.yr(yr),.ww(ww));
always #0.5 clk=~clk;
initial
begin
clk <= 1;
    res <= 1;
    sc=0;
    mn=0;hrs=0;dt=0;
    mon=0;
    yr=0;
    #10   res <= 0;
    #100 res<=1;
    #10  res<=0;
end
endmodule
