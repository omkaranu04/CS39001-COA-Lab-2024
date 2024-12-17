`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 14:24:48
// Design Name: 
// Module Name: error_inject
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


module error_inject(d_orig, flip_bit, d_error);
    input wire [6:0] d_orig;
    input wire [6:0] flip_bit;
    output reg [6:0] d_error;
    
    always @(*) begin
        d_error = d_orig ^ flip_bit; 
    end
endmodule
