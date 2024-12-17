`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2024 10:13:15 PM
// Design Name: 
// Module Name: RegA
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


module RegA(clk, ldA, data_in, data_out);
    input clk, ldA;
    input [15:0] data_in;
    
    output reg [15:0] data_out;
    
    always @(posedge clk)
        if(ldA) data_out <= data_in;
    
    initial begin
        $monitor("in A : %d", data_in);
    end

endmodule
