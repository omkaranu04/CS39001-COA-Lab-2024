`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:25:04
// Design Name: 
// Module Name: NEG_8Bit
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


module NEG_8Bit#(parameter SIZE = 8)(in, out);
    input [SIZE-1:0] in;
    output [SIZE-1:0] out;
    
    genvar i;
    generate
        for(i = 0; i < SIZE; i = i + 1) begin
            not nota(out[i], in[i]);
        end
    endgenerate
    
endmodule
