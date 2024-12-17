`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2020 08:33:35
// Design Name: 
// Module Name: simul
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


module simul;
parameter WIDTH=32;
wire done;
wire[WIDTH-1:0] out;
reg[WIDTH-1:0] in1,in2;
reg clk,reset;
gcd #(.WIDTH(WIDTH)) g1(in1,in2,clk,reset,out,done);
initial 
begin
clk<=1'b0;
reset<=1'b1;
end
initial
begin
in1<=32'd2440;
in2<=32'd1660;
#30 reset<=1'b0;
end
always
#10 clk=~clk;
endmodule
