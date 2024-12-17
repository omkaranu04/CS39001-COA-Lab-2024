`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2024 05:49:53 PM
// Design Name: 
// Module Name: Data_Memory
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

module Data_Memory #(parameter BRAM_ADDR_WIDTH = 10, BRAM_DATA_WIDTH = 32) (clk, rst, addr, wr_n, rd_n, bram_data_in, bram_data_out, display_src, to_display);
    input clk, wr_n, rd_n, rst;
    input [BRAM_ADDR_WIDTH-1:0] addr;
    input [BRAM_DATA_WIDTH-1:0] bram_data_in;
    output reg [BRAM_DATA_WIDTH-1:0] bram_data_out;
    output [31:0] to_display;
    input [4:0] display_src;

    reg [BRAM_DATA_WIDTH-1:0] mem [(1<<BRAM_ADDR_WIDTH)-1:0];
    integer i;
    
//    initial begin
////        $monitor($time, " addr: %b, bram_data_in = %b", addr, bram_data_in);
//        $readmemb("Data_Memory.mem", mem);
//    end
//        initial begin
//            $monitor($time, " mem[0] : %b, mem[1] : %b, mem[2] : %b", mem[0], mem[1], mem[2]);
//        end

//    initial begin
//        $monitor($time, "mem[0]: %b", mem[0]);
//        $monitor($time, "mem[1]: %b", mem[1]);
//        $monitor($time, "mem[2]: %b", mem[2]);
//        $monitor($time, "mem[3]: %b", mem[3]);
//        $monitor($time, "mem[4]: %b", mem[4]);
//        $monitor($time, "mem[5]: %b", mem[5]);
//        $monitor($time, "mem[6]: %b", mem[6]);
//        $monitor($time, "mem[7]: %b", mem[7]);
//        $monitor($time, "mem[8]: %b", mem[8]);
//        $monitor($time, "mem[9]: %b", mem[9]);
//    end

    always @(negedge clk) begin
        if(rst) begin
            mem[0]=32'b00000000000000000000000011001000;
            mem[1]=32'b00000000000000000000000001100101;
            mem[2]=32'b11111111111111111111111111110100;
            mem[3]=32'b11111111111111111111111111110010;
            mem[4]=32'b11111111111111111111111111110100;
            mem[5]=32'b00000000000000000000000000000000;
            mem[6]=32'b00000000000000000000001101010111;
            mem[7]=32'b00000000000000000000101011111000;
            mem[8]=32'b00000000000000000000000001100101;
            mem[9]=32'b00000000000000000000000000000001;
        end
        else begin
            if (wr_n == 1'b1) mem[addr] <= bram_data_in;
            if (rd_n == 1'b1) bram_data_out <= mem[addr];
        end
    end
    
    assign to_display = mem[display_src];

endmodule