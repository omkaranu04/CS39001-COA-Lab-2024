`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:29:56 08/14/2024 
// Design Name: 
// Module Name:    RCA 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module fulladder(a, b, c0, s, c);
	input a, b, c0;
   output s, c;
   wire t1, t2, t3;
   xor (t1, a, b);
   xor (s, c0, t1);
   and (t2, a, b);
   and (t3, t1, c0);
   or (c, t2, t3);
endmodule

module RCA_8Bit(a, b, cin, s, c);
   input [7:0] a;
   input [7:0] b;
	input cin;
   output [7:0] s;
   output c;
   wire [7:0] carry;

   // Instantiate the full-adder
	fulladder fa0(.a(a[0]), .b(b[0]), .c0(cin), .s(s[0]), .c(carry[0]));
	fulladder fa1(.a(a[1]), .b(b[1]), .c0(carry[0]), .s(s[1]), .c(carry[1]));
	fulladder fa2(.a(a[2]), .b(b[2]), .c0(carry[1]), .s(s[2]), .c(carry[2]));
	fulladder fa3(.a(a[3]), .b(b[3]), .c0(carry[2]), .s(s[3]), .c(carry[3]));
	fulladder fa4(.a(a[4]), .b(b[4]), .c0(carry[3]), .s(s[4]), .c(carry[4]));
	fulladder fa5(.a(a[5]), .b(b[5]), .c0(carry[4]), .s(s[5]), .c(carry[5]));
	fulladder fa6(.a(a[6]), .b(b[6]), .c0(carry[5]), .s(s[6]), .c(carry[6]));
	fulladder fa7(.a(a[7]), .b(b[7]), .c0(carry[6]), .s(s[7]), .c(carry[7]));
    
   // The final carry-out is the carry of the last full-adder
   assign c = carry[7];
endmodule
