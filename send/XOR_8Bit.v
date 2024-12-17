`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:24:09
// Design Name: 
// Module Name: XOR_8Bit
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


module XOR_8Bit #(parameter SIZE = 8)(a, b, out);
    input [SIZE-1:0] a, b;
    output [SIZE-1:0] out;
    
    genvar i;
    generate
        for(i = 0; i < SIZE; i = i + 1) begin
            xor xora(out[i], a[i], b[i]);
        end
    endgenerate
endmodule
