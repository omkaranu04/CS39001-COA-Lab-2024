`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2024 10:13:15 PM
// Design Name: 
// Module Name: RegB
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


module RegB(clk, ldB, decB, data_in, data_out);
    input ldB, decB, clk;
    input [15:0] data_in;
    
    output reg [15:0] data_out;
    
    always @(posedge clk)
        if(ldB) data_out <= data_in;
        else if(decB) data_out <= data_out - 1;
    
    always @(*)
        begin
            $display("in B : %d", data_out);
        end
        
endmodule
