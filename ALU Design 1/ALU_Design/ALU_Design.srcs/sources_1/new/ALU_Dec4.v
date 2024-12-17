`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:57:21
// Design Name: 
// Module Name: ALU_Dec4
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


module ALU_Dec4(in, out);
    input [7:0] in;
    output [7:0] out;
    
    wire [7:0] a4;
    wire t1, t2;
    
    assign t1 = 1'b0;
    assign a4 = 8'b00000100;
    
    ALU_Subtractor sub4(.a_in(in), .b_in(a4), .cin(t1), .s(out), .c(t2));
endmodule
