`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2024 11:07:36 PM
// Design Name: 
// Module Name: Master
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


module Master(clk, start, data_in1, data_in2, done);
    input [15:0] data_in1, data_in2;
    input start, clk;
  
    output done;
    
    wire ldA, ldB, clrP, ldP, eqZ, decB;
    
    DataPath dp(clk, data_in1, data_in2, ldA, ldB, decB, ldP, clrP, eqZ);
    ControlPath cp(clk, start, eqZ, ldA, ldB, decB, ldP, clrP, done);
    
endmodule
