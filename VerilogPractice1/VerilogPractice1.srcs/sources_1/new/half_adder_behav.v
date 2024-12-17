`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/25/2024 04:42:58 PM
// Design Name: 
// Module Name: half_adder_behav
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


module half_adder_behav(a, b, s, c);
    input a, b;
    output s, c;
    assign s = a ^ b;
    assign c = a & b;
endmodule
