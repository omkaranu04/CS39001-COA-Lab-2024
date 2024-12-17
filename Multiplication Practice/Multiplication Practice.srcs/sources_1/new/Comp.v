`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2024 10:27:40 PM
// Design Name: 
// Module Name: Comp
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


module Comp(data_in, eqZ);
    input [15:0] data_in;
    output eqZ;
    
    assign eqZ = (data_in == 0);
endmodule
