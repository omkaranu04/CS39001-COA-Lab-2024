`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.08.2024 15:14:13
// Design Name: 
// Module Name: D_Flip_Flop
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


module DFF(d, rst, q, clk);
    input d, clk, rst;
    output reg q;
    
    always @(posedge clk, posedge rst)
    begin
        if(rst)
            q <= 1'b0;
        else
            q <= d;
    end 
            
endmodule