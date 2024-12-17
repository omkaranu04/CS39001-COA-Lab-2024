`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.08.2024 16:09:12
// Design Name: 
// Module Name: lfsr_tb
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
module lfsr_tb;

	// Inputs
	reg [3:0] seed;
	reg sel;
	reg rst;
	reg clk;

	// Outputs
	wire [3:0] out;
	wire xor_deb;

	// Instantiate the Unit Under Test (UUT)
	lfsr uut (
		.seed(seed), 
		.sel(sel), 
		.rst(rst), 
		.clk(clk), 
		.out(out),
		.xor_deb(xor_deb)
	);

	initial begin
		// Initialize Inputs
		$monitor("output = %b%b%b%b %b \n", out[3], out[2], out[1], out[0], xor_deb);		
		seed = 4'b1111;
		sel = 0;
		rst = 0;
		clk = 0;
		#4 sel = 1;
		
	end
	
	always begin
		#2 clk = ~clk;
	end
      
endmodule