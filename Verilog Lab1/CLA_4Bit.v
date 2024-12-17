`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:29:56 08/14/2024 
// Design Name: 
// Module Name:    CLA_4Bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:    4-bit Carry Look-Ahead Adder (CLA)
// 
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module CLA_4Bit (a, b, cin, s, cout);
	input [3:0] a;      
	input [3:0] b;
	input cin;
	output [3:0] s;
	output cout;    
	
   
   wire [3:0] p;   
   wire [3:0] g;   
   wire [4:0] c; 

	assign g = a & b;
   assign p = a ^ b;
  
   assign c[0] = cin;
   assign c[1] = g[0] | (p[0] & cin);
   assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
   assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
   assign c[4] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & cin);

   assign s = p ^ c;
   assign cout = c[4];
endmodule
