`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/25/2024 06:33:04 PM
// Design Name: 
// Module Name: rca_8bit
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


module rca_8bit(a, b, cin, s, cout);
    input [7:0] a;
    input [7:0] b;
    input cin;
    output [7:0] s;
    output cout;
    
    wire [7:0] carry;
    
    full_adder fa1(.a(a[0]), .b(b[0]), .cin(cin), .s(s[0]), .cout(carry[0]));
    full_adder fa2(.a(a[1]), .b(b[1]), .cin(carry[0]), .s(s[1]), .cout(carry[1]));
    full_adder fa3(.a(a[2]), .b(b[2]), .cin(carry[1]), .s(s[2]), .cout(carry[2]));
    full_adder fa4(.a(a[3]), .b(b[3]), .cin(carry[2]), .s(s[3]), .cout(carry[3]));
    full_adder fa5(.a(a[4]), .b(b[4]), .cin(carry[3]), .s(s[4]), .cout(carry[4]));
    full_adder fa6(.a(a[5]), .b(b[5]), .cin(carry[4]), .s(s[5]), .cout(carry[5]));
    full_adder fa7(.a(a[6]), .b(b[6]), .cin(carry[5]), .s(s[6]), .cout(carry[6]));
    full_adder fa8(.a(a[7]), .b(b[7]), .cin(carry[6]), .s(s[7]), .cout(carry[7]));
    
    assign cout = carry[7];
endmodule
