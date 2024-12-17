`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 16:08:24
// Design Name: 
// Module Name: master_tb
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
module master_tb;

	reg [5:0] data_in;

	wire [3:0] d_disp0;
	wire [3:0] d_disp1;
	wire [3:0] d_disp2;
	wire [3:0] d_disp3;

	master uut (
		.data_in(data_in), 
		.d_disp0(d_disp0), 
		.d_disp1(d_disp1), 
		.d_disp2(d_disp2), 
		.d_disp3(d_disp3)
	);

	initial begin
		data_in = 6'b010011;

		#100;
        
	end 
endmodule

