`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:30:07 08/20/2024 
// Design Name: 
// Module Name:    RCA_4Bit 
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
module halfadder(a, b, s, c);
	input a, b;
	output s, c;
	xor (s, a, b);
	and (c, a, b);
endmodule

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

module RCA_4Bit(a, b, cin, s, c);
   input [3:0] a;
   input [3:0] b;
	input cin;
   output [3:0] s;
   output c;
   wire [3:0] carry;
	
	// assign carry = 0;
    
   // Instantiate the first half-adder
   halfadder ha0(
		.a(a[0]),
      .b(b[0]),
      .s(s[0]),
      .c(carry[0])
   );

   // Instantiate the full-adder
	fulladder fa1(.a(a[1]), .b(b[1]), .c0(carry[0]), .s(s[1]), .c(carry[1]));
	fulladder fa2(.a(a[2]), .b(b[2]), .c0(carry[1]), .s(s[2]), .c(carry[2]));
	fulladder fa3(.a(a[3]), .b(b[3]), .c0(carry[2]), .s(s[3]), .c(carry[3]));
	
   // The final carry-out is the carry of the last full-adder
   assign c = carry[3];
endmodule
