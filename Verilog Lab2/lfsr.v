`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.08.2024 15:06:26
// Design Name: 
// Module Name: lfsr
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
module lfsr(seed, sel, rst, clk, out);
    input clk, sel, rst;
    input [3:0] seed;
    output wire [3:0] out;
    
    wire clk_req;
    
    CLKDiv clock_div(.clk_in(clk), .clk_out(clk_req));
    
    wire [3:0] mux_out;
    wire xor_out;
    
    MUX m3(.in0(seed[3]), .in1(xor_out), .sel(sel), .out(mux_out[3]));
    MUX m2(.in0(seed[2]), .in1(out[3]), .sel(sel), .out(mux_out[2]));
    MUX m1(.in0(seed[1]), .in1(out[2]), .sel(sel), .out(mux_out[1]));
    MUX m0(.in0(seed[0]), .in1(out[1]), .sel(sel), .out(mux_out[0]));
    
    DFF MSB(.d(mux_out[3]), .rst(rst), .clk(clk_req), .q(out[3]));
    DFF Bit3(.d(mux_out[2]), .rst(rst), .clk(clk_req), .q(out[2]));
    DFF Bit2(.d(mux_out[1]), .rst(rst), .clk(clk_req), .q(out[1]));
    DFF LSB(.d(mux_out[0]), .rst(rst), .clk(clk_req), .q(out[0]));
    
    xor first_two_bits (xor_out, out[0], out[1]);
endmodule
