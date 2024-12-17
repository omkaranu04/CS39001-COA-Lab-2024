`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2024 10:22:03 PM
// Design Name: 
// Module Name: ALU_SRA_TB
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


module ALU_SRA_TB;
    
    parameter N = 32;
    reg [N-1:0] A, B;
    wire [N-1:0] Y;

    // Instantiate the ALU_Barrel_Arithmetic_Right module
    ALU_Barrel_Right #(N) uut (
        .A(A),
        .B(B),
        .Y(Y)
    );

    initial begin
        // Initialize inputs
        A = 5;      // Input value in 2's complement form (-30 is 8'b11100010)
        B = 1;        // Shift right by 1

        // Display results
        #10;  // Wait for 10 ns for the output to stabilize
        $display("A = %b (%0d), B = %b (%0d), Y = %b (%0d)", A, $signed(A), B, B, Y, $signed(Y));
    end
endmodule
