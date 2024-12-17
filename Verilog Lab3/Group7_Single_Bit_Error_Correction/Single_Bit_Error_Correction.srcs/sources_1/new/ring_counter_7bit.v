`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 15:04:54
// Design Name: 
// Module Name: ring_counter_7bit
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


module ring_counter_7bit(clk, rst, out);
    input clk, rst;
    output reg [6:0] out;
    
    integer i;
    
    always @(posedge clk) begin
        if(!rst)
            out <= 1;
        else begin
            out[6] <= out[0];
            for(i=0; i<6; i=i+1) begin
                out[i] <= out[i+1];
            end
        end
    end
            
endmodule
