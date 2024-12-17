`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2024 10:30:55 PM
// Design Name: 
// Module Name: DataPath
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


module DataPath(clk, data_in1, data_in2, ldA, ldB, decB, ldP, clrP, eqZ);
    input [15:0] data_in1, data_in2;
    input clk, ldA, ldB, ldP, decB, clrP;
    output eqZ;
    
    wire [15:0] X, Y, Z, B_out;
    
    RegA rega(clk, ldA, data_in1, X);
    RegB regb(clk, ldB, decB, data_in2 - 1, B_out);
    RegP regp(clk, ldP, clrP, Z, Y);
    Adder adder(clk, X, Y, Z);
    Comp comp(B_out, eqZ);
    
    initial
        begin
            $monitor($time, " X : %d, Y : %d, Z : %d", X, Y, Z);
        end
    
endmodule
