`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2024 03:43:41 PM
// Design Name: 
// Module Name: Master_Interface
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


module Master_Interface(clk, rst, c);
    input clk, rst;
    input [2:0] c;

    wire [2:0] read_reg1, read_reg2, write_reg;
    wire [3:0] opcode;
    wire read1, read2, write;
    wire [31:0] write_data, read_data1, read_data2;
    
    always @ (posedge clk) begin
        $display("op1 = %b, op2 = %b, Write = %b, Opcode = %b", read_data1, read_data2, write_data, opcode);
    end
    
    RegisterBank RegisterBank_inst(clk, rst, read1, read2, write, read_reg1, read_reg2, read_data1, read_data2, write_data, write_reg);
    ControlPath ControlPath_inst(clk, rst, c, read1, read2, write, read_reg1, read_reg2, write_reg, opcode);
    ALU #(32) ALU_inst(read_data1, read_data2, opcode, write_data);

endmodule
