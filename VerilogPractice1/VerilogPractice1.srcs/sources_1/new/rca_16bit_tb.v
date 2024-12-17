`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/25/2024 06:47:10 PM
// Design Name: 
// Module Name: rca_16bit_tb
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

module rca_16bit_tb();
    reg [15:0] a;
    reg [15:0] b;
    reg cin;
    
    wire [15:0] s;
    wire cout;
    
    rca_16bit uut (
        .a(a),
        .b(b),
        .cin(cin),
        .s(s),
        .cout(cout)
    );
    
    initial begin
        a = 16'b1111111111111111;  
        b = 16'b0000000000000001; 
        cin = 0;
        
        #100;
    end
endmodule
