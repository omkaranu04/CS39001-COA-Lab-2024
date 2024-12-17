`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:57:21
// Design Name: 
// Module Name: ALU_Shift_Right_Arithmetic
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


module ALU_Shift_Right_Arithmetic(a, b, out);
    input [7:0] a, b;
    output [7:0] out;

    wire [7:0] sr0, sr1, sr2, sr3, sr4, sr5, sr6;

    wire [7:0] temp_asr;

    or b_more_than_8_or(b_more_than_8, b[7], b[6], b[5], b[4], b[3]);
    
    MUX_2to1 asr_mux0(.in1(a[0]), .in2(a[7]), .sel(b_more_than_8), .out(temp_asr[0]));
    MUX_2to1 asr_mux1(.in1(a[1]), .in2(a[7]), .sel(b_more_than_8), .out(temp_asr[1]));
    MUX_2to1 asr_mux2(.in1(a[2]), .in2(a[7]), .sel(b_more_than_8), .out(temp_asr[2]));
    MUX_2to1 asr_mux3(.in1(a[3]), .in2(a[7]), .sel(b_more_than_8), .out(temp_asr[3]));
    MUX_2to1 asr_mux4(.in1(a[4]), .in2(a[7]), .sel(b_more_than_8), .out(temp_asr[4]));
    MUX_2to1 asr_mux5(.in1(a[5]), .in2(a[7]), .sel(b_more_than_8), .out(temp_asr[5]));
    MUX_2to1 asr_mux6(.in1(a[6]), .in2(a[7]), .sel(b_more_than_8), .out(temp_asr[6]));
    MUX_2to1 asr_mux7(.in1(a[7]), .in2(a[7]), .sel(b_more_than_8), .out(temp_asr[7]));

    assign sr0[0] = temp_asr[0];
    assign sr0[1] = temp_asr[1];
    assign sr0[2] = temp_asr[2];
    assign sr0[3] = temp_asr[3];
    assign sr0[4] = temp_asr[4];
    assign sr0[5] = temp_asr[5];
    assign sr0[6] = temp_asr[6];
    assign sr0[7] = temp_asr[7];

    assign sr1[0] = temp_asr[1];
    assign sr1[1] = temp_asr[2];
    assign sr1[2] = temp_asr[3];
    assign sr1[3] = temp_asr[4];
    assign sr1[4] = temp_asr[5];
    assign sr1[5] = temp_asr[6];
    assign sr1[6] = temp_asr[7];
    assign sr1[7] = temp_asr[7];

    assign sr2[0] = temp_asr[2];
    assign sr2[1] = temp_asr[3];
    assign sr2[2] = temp_asr[4];
    assign sr2[3] = temp_asr[5];
    assign sr2[4] = temp_asr[6];
    assign sr2[5] = temp_asr[7];
    assign sr2[6] = temp_asr[7];
    assign sr2[7] = temp_asr[7];

    assign sr3[0] = temp_asr[3];
    assign sr3[1] = temp_asr[4];
    assign sr3[2] = temp_asr[5];
    assign sr3[3] = temp_asr[6];
    assign sr3[4] = temp_asr[7];
    assign sr3[5] = temp_asr[7];
    assign sr3[6] = temp_asr[7];
    assign sr3[7] = temp_asr[7];

    assign sr4[0] = temp_asr[4];
    assign sr4[1] = temp_asr[5];
    assign sr4[2] = temp_asr[6];
    assign sr4[3] = temp_asr[7];
    assign sr4[4] = temp_asr[7];
    assign sr4[5] = temp_asr[7];
    assign sr4[6] = temp_asr[7];
    assign sr4[7] = temp_asr[7];

    assign sr5[0] = temp_asr[5];
    assign sr5[1] = temp_asr[6];
    assign sr5[2] = temp_asr[7];
    assign sr5[3] = temp_asr[7];
    assign sr5[4] = temp_asr[7];
    assign sr5[5] = temp_asr[7];
    assign sr5[6] = temp_asr[7];
    assign sr5[7] = temp_asr[7];
    
    assign sr6[0] = temp_asr[6];
    assign sr6[1] = temp_asr[7];
    assign sr6[2] = temp_asr[7];
    assign sr6[3] = temp_asr[7];
    assign sr6[4] = temp_asr[7];
    assign sr6[5] = temp_asr[7];
    assign sr6[6] = temp_asr[7];
    assign sr6[7] = temp_asr[7];

    MUX_8to1 z1(.in(sr0), .sel1(b[0]), .sel2(b[1]), .sel3(b[2]), .out(out[0]));
    MUX_8to1 z2(.in(sr1), .sel1(b[0]), .sel2(b[1]), .sel3(b[2]), .out(out[1]));
    MUX_8to1 z3(.in(sr2), .sel1(b[0]), .sel2(b[1]), .sel3(b[2]), .out(out[2]));
    MUX_8to1 z4(.in(sr3), .sel1(b[0]), .sel2(b[1]), .sel3(b[2]), .out(out[3]));
    MUX_8to1 z5(.in(sr4), .sel1(b[0]), .sel2(b[1]), .sel3(b[2]), .out(out[4]));
    MUX_8to1 z6(.in(sr5), .sel1(b[0]), .sel2(b[1]), .sel3(b[2]), .out(out[5]));
    MUX_8to1 z7(.in(sr6), .sel1(b[0]), .sel2(b[1]), .sel3(b[2]), .out(out[6]));

    assign out[7] = a[7];
endmodule
