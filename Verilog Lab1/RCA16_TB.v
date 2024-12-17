`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:32:42 08/20/2024
// Design Name:   RCA_16Bit
// Module Name:   D:/COA_LAB/Group7/RCA/RCA16_TB.v
// Project Name:  RCA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RCA_16Bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RCA16_TB;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;
	reg cin;

	// Outputs
	wire [15:0] s;
	wire c;

	// Instantiate the Unit Under Test (UUT)
	RCA_16Bit uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.s(s), 
		.c(c)
	);

	initial begin
		// Initialize Inputs
		a = 65535;
		b = 1;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

