`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/25/2024 06:41:46 PM
// Design Name: 
// Module Name: rca_16bit
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


module rca_16bit(a, b, cin, s, cout);
    input [15:0] a, b;
    input cin;
    output [15:0] s;
    output cout;
    
    wire carry_in;
    
    rca_8bit i1(.a(a[7:0]), .b(b[7:0]), .cin(cin), .s(s[7:0]), .cout(carry_in));
    rca_8bit i2(.a(a[15:8]), .b(b[15:8]), .cin(carry_in), .s(s[15:8]), .cout(cout));
    
endmodule
