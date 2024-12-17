`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/25/2024 04:51:49 PM
// Design Name: 
// Module Name: full_adder
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


module full_adder(a, b, cin, s, cout);
    input a, b, cin;
    output s, cout;
    wire t1, t2, t3;
    xor x1(t1, a, b);
    xor x2(s, t1, cin);
    and a1(t2, a, b);
    and a2(t3, t1, cin);
    or r1(cout, t2, t3);
endmodule
