`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2024 11:39:08 PM
// Design Name: 
// Module Name: ControlPath
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
`timescale 1ns / 1ps

module ControlPath (clk, rst, c, read1, read2, write, read_reg1, read_reg2, write_reg, opcode);
    input clk, rst;
    input [2:0] c;
    output reg read1, read2, write;
    output reg [2:0] read_reg1, read_reg2, write_reg;
    output reg [3:0] opcode;    

    always @(*) begin
        read1 = 1'b1;
        read2 = 1'b1;
        write = 1'b1;
        case(c) 
            3'b000: begin
                opcode = 4'b0000;
                read_reg1 = 3'b010;
                read_reg2 = 3'b011;
                write_reg = 3'b001;
            end
            3'b001: begin
                opcode = 4'b0001;
                read_reg1 = 3'b001;
                read_reg2 = 3'b101;
                write_reg = 3'b100;
            end
            3'b010: begin
                opcode = 4'b1010;
                read_reg1 = 3'b001;
                read_reg2 = 3'b010;
                write_reg = 3'b010;
            end
            3'b011: begin
                opcode = 4'b1011;
                read_reg1 = 3'b001;
                read_reg2 = 3'b010;
                write_reg = 3'b111;
            end
            3'b100: begin
                opcode = 4'b0010;
                read_reg1 = 3'b001;
                read_reg2 = 3'b010;
                write_reg = 3'b110;
            end
            3'b101: begin
                opcode = 4'b0100;
                read_reg1 = 3'b001;
                read_reg2 = 3'b010;
                write_reg = 3'b001;
            end
            3'b110: begin
                opcode = 4'b0000;
                read_reg1 = 3'b010;
                read_reg2 = 3'b000;
                write_reg = 3'b011;
            end
            3'b111: begin
                opcode = 4'b0000;
                read_reg1 = 3'b000;
                read_reg2 = 3'b000;
                write_reg = 3'b110;
            end
        endcase
    end
endmodule
