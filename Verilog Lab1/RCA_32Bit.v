`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:48:43 08/14/2024 
// Design Name: 
// Module Name:    RCA_32Bit 
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
module RCA_32Bit(a, b, cin, s, c);
	input [31:0] a;
	input [31:0] b;
	input cin;
	output [31:0] s;
	output c;
	
	wire carry;
	
	RCA_16Bit lower_bits(
		.a(a[15:0]),
		.b(b[15:0]),
		.cin(cin),
		.s(s[15:0]),
		.c(carry)
	);	
	
	RCA_16Bit upper_bits(
		.a(a[31:16]),
		.b(b[31:16]),
		.cin(carry),
		.s(s[31:16]),
		.c(c)
	);	

endmodule