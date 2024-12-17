`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/25/2024 06:39:53 PM
// Design Name: 
// Module Name: rca_8bit_tb
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


`timescale 1ns / 1ps

module rca_8bit_tb();
    reg [7:0] a;
    reg [7:0] b;
    reg cin;
    
    wire [7:0] s;
    wire cout;
    
    rca_8bit uut (
        .a(a),
        .b(b),
        .cin(cin),
        .s(s),
        .cout(cout)
    );
    
    initial begin
        a = 8'b11111111;  
        b = 8'b00000001; 
        cin = 0;
        
        #100;
    end
endmodule
