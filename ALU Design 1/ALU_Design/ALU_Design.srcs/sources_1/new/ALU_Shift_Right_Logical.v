`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:57:21
// Design Name: 
// Module Name: ALU_Shift_Right_Logical
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


module ALU_Shift_Right_Logical(a, b, out);
    input [7:0] a, b;
    output [7:0] out;

    wire [7:0] sr0, sr1, sr2, sr3, sr4, sr5, sr6, sr7;

    wire b_more_than_8, b_more_than_8_neg;
    wire [7:0] temp_sr;

    or b_more_than_8_or(b_more_than_8, b[7], b[6], b[5], b[4], b[3]);
    not b_more_than_8_not(b_more_than_8_neg, b_more_than_8);

    and excess_shift_and0(temp_sr[0], b_more_than_8_neg, a[0]);
    and excess_shift_and1(temp_sr[1], b_more_than_8_neg, a[1]);
    and excess_shift_and2(temp_sr[2], b_more_than_8_neg, a[2]);
    and excess_shift_and3(temp_sr[3], b_more_than_8_neg, a[3]);
    and excess_shift_and4(temp_sr[4], b_more_than_8_neg, a[4]);
    and excess_shift_and5(temp_sr[5], b_more_than_8_neg, a[5]);
    and excess_shift_and6(temp_sr[6], b_more_than_8_neg, a[6]);
    and excess_shift_and7(temp_sr[7], b_more_than_8_neg, a[7]);

    assign sr0[0] = temp_sr[0];
    assign sr0[1] = temp_sr[1];
    assign sr0[2] = temp_sr[2];
    assign sr0[3] = temp_sr[3];
    assign sr0[4] = temp_sr[4];
    assign sr0[5] = temp_sr[5];
    assign sr0[6] = temp_sr[6];
    assign sr0[7] = temp_sr[7];

    assign sr1[0] = temp_sr[1];
    assign sr1[1] = temp_sr[2];
    assign sr1[2] = temp_sr[3];
    assign sr1[3] = temp_sr[4];
    assign sr1[4] = temp_sr[5];
    assign sr1[5] = temp_sr[6];
    assign sr1[6] = temp_sr[7];
    assign sr1[7] = 0;

    assign sr2[0] = temp_sr[2];
    assign sr2[1] = temp_sr[3];
    assign sr2[2] = temp_sr[4];
    assign sr2[3] = temp_sr[5];
    assign sr2[4] = temp_sr[6];
    assign sr2[5] = temp_sr[7];
    assign sr2[6] = 0;
    assign sr2[7] = 0;

    assign sr3[0] = temp_sr[3];
    assign sr3[1] = temp_sr[4];
    assign sr3[2] = temp_sr[5];
    assign sr3[3] = temp_sr[6];
    assign sr3[4] = temp_sr[7];
    assign sr3[5] = 0;
    assign sr3[6] = 0;
    assign sr3[7] = 0;

    assign sr4[0] = temp_sr[4];
    assign sr4[1] = temp_sr[5];
    assign sr4[2] = temp_sr[6];
    assign sr4[3] = temp_sr[7];
    assign sr4[4] = 0;
    assign sr4[5] = 0;
    assign sr4[6] = 0;
    assign sr4[7] = 0;

    assign sr5[0] = temp_sr[5];
    assign sr5[1] = temp_sr[6];
    assign sr5[2] = temp_sr[7];
    assign sr5[3] = 0;
    assign sr5[4] = 0;
    assign sr5[5] = 0;
    assign sr5[6] = 0;
    assign sr5[7] = 0;
    
    assign sr6[0] = temp_sr[6];
    assign sr6[1] = temp_sr[7];
    assign sr6[2] = 0;
    assign sr6[3] = 0;
    assign sr6[4] = 0;
    assign sr6[5] = 0;
    assign sr6[6] = 0;
    assign sr6[7] = 0;

    assign sr7[0] = temp_sr[7];
    assign sr7[1] = 0;
    assign sr7[2] = 0;
    assign sr7[3] = 0;
    assign sr7[4] = 0;
    assign sr7[5] = 0;
    assign sr7[6] = 0;
    assign sr7[7] = 0;

    MUX_8to1 z1(.in(sr0), .sel1(b[0]), .sel2(b[1]), .sel3(b[2]), .out(out[0]));
    MUX_8to1 z2(.in(sr1), .sel1(b[0]), .sel2(b[1]), .sel3(b[2]), .out(out[1]));
    MUX_8to1 z3(.in(sr2), .sel1(b[0]), .sel2(b[1]), .sel3(b[2]), .out(out[2]));
    MUX_8to1 z4(.in(sr3), .sel1(b[0]), .sel2(b[1]), .sel3(b[2]), .out(out[3]));
    MUX_8to1 z5(.in(sr4), .sel1(b[0]), .sel2(b[1]), .sel3(b[2]), .out(out[4]));
    MUX_8to1 z6(.in(sr5), .sel1(b[0]), .sel2(b[1]), .sel3(b[2]), .out(out[5]));
    MUX_8to1 z7(.in(sr6), .sel1(b[0]), .sel2(b[1]), .sel3(b[2]), .out(out[6]));
    MUX_8to1 z8(.in(sr7), .sel1(b[0]), .sel2(b[1]), .sel3(b[2]), .out(out[7]));

endmodule
