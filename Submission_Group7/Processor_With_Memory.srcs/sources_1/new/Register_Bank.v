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

module RegisterBank (clk, rst, reg_read, reg_write, read_reg1, read_reg2, read_data1, read_data2, write_data, write_reg, display_src, to_display);
    input clk, rst;
    input reg_read, reg_write;
    input [4:0] read_reg1, read_reg2, write_reg, display_src;
    input [31:0] write_data;
    output reg [31:0] read_data1;
    output reg [31:0] read_data2;
    output reg [31:0] to_display;

    reg [31:0] reg_file [31:0];

    always @(negedge clk or posedge rst) begin
        if(rst) begin
            read_data1 <= 32'b0;
            read_data2 <= 32'b0;
        end
        else if(reg_read) begin
            read_data1 <= reg_file[read_reg1];
            read_data2 <= reg_file[read_reg2];
        end
        else begin
            read_data1 <= read_data1;
            read_data2 <= read_data2;
        end
    end

    initial begin
        $monitor($time, "reg[1]: %b", reg_file[1]);
        $monitor($time, "reg[2]: %b", reg_file[2]);
        $monitor($time, "reg[3]: %b", reg_file[3]);
        $monitor($time, "reg[4]: %b", reg_file[4]);
        $monitor($time, "reg[5]: %b", reg_file[5]);
        $monitor($time, "reg[6]: %b", reg_file[6]);
        $monitor($time, "reg[7]: %b", reg_file[7]);
        $monitor($time, "reg[8]: %b", reg_file[8]);
        $monitor($time, "reg[9]: %b", reg_file[9]);
        $monitor($time, "reg[10]: %b", reg_file[10]);
        $monitor($time, "reg[11]: %b", reg_file[11]);
        $monitor($time, "reg[12]: %b", reg_file[12]);
        $monitor($time, "reg[13]: %b", reg_file[13]);
        $monitor($time, "reg[14]: %b", reg_file[14]);
        $monitor($time, "reg[15]: %b", reg_file[15]);
        
////        $monitor($time, "write_data: %b, write_reg: %b", write_data, write_reg);
////        $monitor($time, " M : %b, A : %b, Q : %b, Q-1 : %d", reg_file[1], reg_file[3], reg_file[2], reg_file[4]);
////        $monitor($time, " R6 : %b, R7 : %b, R15 : %b", reg_file[6], reg_file[7], reg_file[15]);
    end

    integer i, j;
    always @(posedge clk) begin
        if(rst) begin
            reg_file[0] = 0;
            reg_file[1] = 0;
            reg_file[2] = 0;
            reg_file[3] = 0;
            reg_file[4] = 0;
            reg_file[5] = 0;
            reg_file[6] = 0;
            reg_file[7] = 0;
            reg_file[8] = 0;
            reg_file[9] = 0;
            reg_file[10] = 0;
            reg_file[11] = 0;
            reg_file[12] = 0;
            reg_file[13] = 0;
            reg_file[14] = 0;
            reg_file[15] = 0;
            reg_file[16] = 0;
            reg_file[17] = 0;
            reg_file[18] = 0;
            reg_file[19] = 0;
            reg_file[20] = 0; 
        end
        else if(reg_write & (write_reg != 0)) begin
            reg_file[write_reg] = write_data;
        end
        else begin
            reg_file[0] = 0;
            reg_file[1] = reg_file[1];
            reg_file[2] = reg_file[2];
            reg_file[3] = reg_file[3];
            reg_file[4] = reg_file[4];
            reg_file[5] = reg_file[5];
            reg_file[6] = reg_file[6];
            reg_file[7] = reg_file[7];
            reg_file[8] = reg_file[8];
            reg_file[9] = reg_file[9];
            reg_file[10] = reg_file[10];
            reg_file[11] = reg_file[11];
            reg_file[12] = reg_file[12];
            reg_file[13] = reg_file[13];
            reg_file[14] = reg_file[14];
            reg_file[15] = reg_file[15];
            reg_file[16] = reg_file[16];
            reg_file[17] = reg_file[17];
            reg_file[18] = reg_file[18];
            reg_file[19] = reg_file[19];
            reg_file[20] = reg_file[20];                        
        end
    end
        
    initial begin
        $monitor($time, "display_src: %b, to_display: %b", display_src, to_display);
    end    
    
    always @(*) begin
        to_display = reg_file[display_src];
    end
endmodule