`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:48:55 08/14/2024 
// Design Name: 
// Module Name:    RCA_64Bit 
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
module RCA_64Bit(a, b, cin, s, c);
	input [63:0] a;
	input [63:0] b;
	input cin;
	output [63:0] s;
	output c;
	
	wire carry;
	
	RCA_32Bit lower_bits(
		.a(a[31:0]),
		.b(b[31:0]),
		.cin(cin),
		.s(s[31:0]),
		.c(carry)
	);	
	
	RCA_32Bit upper_bits(
		.a(a[63:32]),
		.b(b[63:32]),
		.cin(carry),
		.s(s[63:32]),
		.c(c)
	);	

endmodule