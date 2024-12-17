`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2024 03:43:41 PM
// Design Name: 
// Module Name: Master_Interface_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench for Master_Interface module
// 
// Dependencies: Master_Interface.v, ControlPath.v, RegisterBank.v, ALU.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Master_Interface_tb();
    reg clk;
    reg rst;
    reg [2:0] c;

    Master_Interface uut (
        .clk(clk),
        .rst(rst),
        .c(c)
    );

    always begin
        #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        clk = 1;
        rst = 0;
        #2
        c = 3'b000; // R1 = R2 + R3
        #10 c = 3'b001; // R4 = R1 - R5
        #10 c = 3'b010; // R2 = R1 << R2
        #10 c = 3'b011; // R7 = R1 >> R2
        #10 c = 3'b100; // R6 = R1 * R2
        #10 c = 3'b101; // R1 = R1 AND R2
        #10 c = 3'b110; // R3 = R2
        #10 c = 3'b111; // R6 = 0
        
        // Finish simulation
        #10 $finish;
    end
endmodule
