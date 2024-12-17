`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:15:28 08/14/2024 
// Design Name: 
// Module Name:    RCA_16Bit 
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
module RCA_16Bit(a, b, cin, s, c);
	input [15:0] a;
	input [15:0] b;
	input cin;
	output [15:0] s;
	output c;
	
	wire carry;
	
	RCA_8Bit lower_bits(
		.a(a[7:0]),
		.b(b[7:0]),
		.cin(cin),
		.s(s[7:0]),
		.c(carry)
	);	
	
	RCA_8Bit upper_bits(
		.a(a[15:8]),
		.b(b[15:8]),
		.cin(carry),
		.s(s[15:8]),
		.c(c)
	);	

endmodule
