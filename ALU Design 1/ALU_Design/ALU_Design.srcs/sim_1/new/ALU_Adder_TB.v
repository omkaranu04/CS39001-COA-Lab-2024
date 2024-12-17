`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2024 06:32:16 PM
// Design Name: 
// Module Name: ALU_Adder_TB
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

module ALU_Adder_TB;
    reg [7:0] a, b;
    reg cin;
    wire [7:0] s;
    wire c;

    ALU_Adder #(8) uut(.a(a), .b(b), .cin(cin), .s(s), .c(c));

    initial begin
        a = 8'b00000001;
        b = 8'b00000001;
        cin = 1'b1;
        #10;
        $finish;
    end
endmodule
