`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/25/2024 05:00:00 PM
// Design Name: 
// Module Name: tb_half_adder_behav
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench for half_adder_behav module
// 
// Dependencies: half_adder_behav.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_half_adder_behav;

    // Inputs
    reg a;
    reg b;

    // Outputs
    wire s;
    wire c;

    // Instantiate the Unit Under Test (UUT)
    half_adder_behav uut (
        .a(a), 
        .b(b), 
        .s(s), 
        .c(c)
    );

    initial begin
        a = 1; 
        b = 0;
        
        #100;
    end
endmodule
