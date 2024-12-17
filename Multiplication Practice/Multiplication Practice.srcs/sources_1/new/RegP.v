`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2024 10:13:15 PM
// Design Name: 
// Module Name: RegP
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


module RegP(clk, ldP, clrP, data_in, data_out);
    input clk, ldP, clrP;
    input [15:0] data_in;
    
    output reg [15:0] data_out;
    
    always @(posedge clk)
        if(ldP) data_out <= data_in;
        else if(clrP) data_out <= 16'b0000000000000000;
endmodule