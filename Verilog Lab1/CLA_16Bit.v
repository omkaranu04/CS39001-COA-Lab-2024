`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:20:38 08/14/2024 
// Design Name: 
// Module Name:    CLA_16Bit 
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
module CLA_4Bit_Aug (a, b, cin, s, po, go);
    input [3:0] a;      
    input [3:0] b;
    input cin;
    output [3:0] s;
    output po, go;     


    wire [3:0] p;   
    wire [3:0] g;   
    wire [4:0] c; 

    assign g = a & b;
    assign p = a ^ b;

    assign po = &p;
    assign go = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);

    assign c[0] = cin;
    assign c[1] = g[0] | (p[0] & cin);
    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
    assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
    assign c[4] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & cin);

    assign s = p ^ c;
endmodule


module CLA1_16Bit(a, b, cin, s, cout);
    input [15:0] a, b;
    input cin;
    output [15:0] s;
    output cout;

    wire po1, go1, po2, go2, po3, go3, po4, go4;
    wire c_cla1;
    wire c_cla2;
    wire c_cla3;
    wire c_cla4;

    CLA_4Bit_Aug c1(.a(a[3:0]), .b(b[3:0]), .cin(cin), .s(s[3:0]), .po(po1), .go(go1));
    assign c_cla1 = go1 | (po1 & cin);

    CLA_4Bit_Aug c2(.a(a[7:4]), .b(b[7:4]), .cin(c_cla1), .s(s[7:4]), .po(po2), .go(go2));
    assign c_cla2 = go2 | (po2 & go1) | (po2 & po1 & cin);

    CLA_4Bit_Aug c3(.a(a[11:8]), .b(b[11:8]), .cin(c_cla2), .s(s[11:8]), .po(po3), .go(go3));
    assign c_cla3 = go3 | (po3 & go2) | (po3 & po2 & go1) | (po3 & po2 & po1 & cin);

    CLA_4Bit_Aug c4(.a(a[15:12]), .b(b[15:12]), .cin(c_cla3), .s(s[15:12]), .po(po4), .go(go4));
    assign c_cla4 = go4 | (po4 & go3) | (po4 & po3 & go2) | (po4 & po3 & po2 & go1) | (po4 & po3 & po2 & po1 & cin);

    assign cout = c_cla4;

endmodule
