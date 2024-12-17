`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:19:53
// Design Name: 
// Module Name: ALU_AND
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


module ALU_AND #(parameter SIZE = 8)(a, b, out);
    input [SIZE-1:0] a, b;
    output [SIZE-1:0] out;
    
    genvar i;
    generate
        for(i = 0; i < SIZE; i = i + 1) begin
            and alu_and_gate(out[i], a[i], b[i]);
        end
    endgenerate
endmodule