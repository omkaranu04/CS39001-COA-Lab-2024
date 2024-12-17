`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:21:50 08/14/2024
// Design Name:   RCA_8Bit
// Module Name:   D:/COA_LAB/Group7/RCA/RCA8_TB.v
// Project Name:  RCA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RCA_8Bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RCA8_TB;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg cin;

	// Outputs
	wire [7:0] s;
	wire c;

	// Instantiate the Unit Under Test (UUT)
	RCA_8Bit uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.s(s), 
		.c(c)
	);

	initial begin
		// Initialize Inputs
		a = 4;
		b = 6;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

