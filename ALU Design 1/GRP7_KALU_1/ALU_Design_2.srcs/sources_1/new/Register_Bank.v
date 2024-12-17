`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2024 11:35:09 PM
// Design Name: 
// Module Name: Register_Bank
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

module RegisterBank (clk, rst, read1, read2, write, read_reg1, read_reg2, read_data1, read_data2, write_data, write_reg);
    input clk, rst;
    input read1, read2, write;
    input [2:0] read_reg1, read_reg2, write_reg;
    input [31:0] write_data;
    output reg [31:0] read_data1;
    output reg [31:0] read_data2;

    reg [31:0] reg_file [7:0];
    
    initial begin
        reg_file[0] = 32'd0;
        reg_file[2] = 32'd4;
        reg_file[3] = 32'd50;
        reg_file[5] = 32'd4;
        $monitor("R0 = %b", reg_file[0]);
        $monitor("R1 = %b", reg_file[1]);
        $monitor("R2 = %b", reg_file[2]);
        $monitor("R3 = %b", reg_file[3]);
        $monitor("R4 = %b", reg_file[4]);
        $monitor("R5 = %b", reg_file[5]);
        $monitor("R6 = %b", reg_file[6]);
        $monitor("R7 = %b", reg_file[7]);
    end

    always @(negedge clk) begin
        if(read1) begin
            read_data1 <= reg_file[read_reg1];

        end
        if(read2) begin
            read_data2 <= reg_file[read_reg2];
        end
    end

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            reg_file[0] = 32'd0;
            reg_file[1] = 32'd1;
            reg_file[2] = 32'd2;
            reg_file[3] = 32'd3;
            reg_file[4] = 32'd4;
            reg_file[5] = 32'd5;
            reg_file[6] = 32'd6;
            reg_file[7] = 32'd7;
        end
        if(write) begin
            reg_file[write_reg] = write_data;
        end
    end
endmodule