`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:55:03
// Design Name: 
// Module Name: ALU_Shift_Left
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


module ALU_Shift_Left(a, b, out);
    input [7:0] a, b;
    output [7:0] out;
    
    wire [7:0] sl0, sl1, sl2, sl3, sl4, sl5, sl6, sl7;

    wire b_more_than_8, b_more_than_8_neg;
    wire [7:0] temp_sl;

    or b_more_than_8_or(b_more_than_8, b[7], b[6], b[5], b[4], b[3]);
    not b_more_than_8_not(b_more_than_8_neg, b_more_than_8);

    and excess_shift_and0(temp_sl[0], b_more_than_8_neg, a[0]);
    and excess_shift_and1(temp_sl[1], b_more_than_8_neg, a[1]);
    and excess_shift_and2(temp_sl[2], b_more_than_8_neg, a[2]);
    and excess_shift_and3(temp_sl[3], b_more_than_8_neg, a[3]);
    and excess_shift_and4(temp_sl[4], b_more_than_8_neg, a[4]);
    and excess_shift_and5(temp_sl[5], b_more_than_8_neg, a[5]);
    and excess_shift_and6(temp_sl[6], b_more_than_8_neg, a[6]);
    and excess_shift_and7(temp_sl[7], b_more_than_8_neg, a[7]);

    assign sl0[0] = temp_sl[0];
    assign sl0[1] = 0;
    assign sl0[2] = 0;
    assign sl0[3] = 0;
    assign sl0[4] = 0;
    assign sl0[5] = 0;
    assign sl0[6] = 0;
    assign sl0[7] = 0;

    assign sl1[0] = temp_sl[1];
    assign sl1[1] = temp_sl[0];
    assign sl1[2] = 0;
    assign sl1[3] = 0;
    assign sl1[4] = 0;
    assign sl1[5] = 0;
    assign sl1[6] = 0;
    assign sl1[7] = 0;

    assign sl2[0] = temp_sl[2];
    assign sl2[1] = temp_sl[1];
    assign sl2[2] = temp_sl[0];
    assign sl2[3] = 0;
    assign sl2[4] = 0;
    assign sl2[5] = 0;
    assign sl2[6] = 0;
    assign sl2[7] = 0;

    assign sl3[0] = temp_sl[3];
    assign sl3[1] = temp_sl[2];
    assign sl3[2] = temp_sl[1];
    assign sl3[3] = temp_sl[0];
    assign sl3[4] = 0;
    assign sl3[5] = 0;
    assign sl3[6] = 0;
    assign sl3[7] = 0;

    assign sl4[0] = temp_sl[4];
    assign sl4[1] = temp_sl[3];
    assign sl4[2] = temp_sl[2];
    assign sl4[3] = temp_sl[1];
    assign sl4[4] = temp_sl[0];
    assign sl4[5] = 0;
    assign sl4[6] = 0;
    assign sl4[7] = 0;

    assign sl5[0] = temp_sl[5];
    assign sl5[1] = temp_sl[4];
    assign sl5[2] = temp_sl[3];
    assign sl5[3] = temp_sl[2];
    assign sl5[4] = temp_sl[1];
    assign sl5[5] = temp_sl[0];
    assign sl5[6] = 0;
    assign sl5[7] = 0;

    assign sl6[0] = temp_sl[6];
    assign sl6[1] = temp_sl[5];
    assign sl6[2] = temp_sl[4];
    assign sl6[3] = temp_sl[3];
    assign sl6[4] = temp_sl[2];
    assign sl6[5] = temp_sl[1];
    assign sl6[6] = temp_sl[0];
    assign sl6[7] = 0;

    assign sl7[0] = temp_sl[7];
    assign sl7[1] = temp_sl[6];
    assign sl7[2] = temp_sl[5];
    assign sl7[3] = temp_sl[4];
    assign sl7[4] = temp_sl[3];
    assign sl7[5] = temp_sl[2];
    assign sl7[6] = temp_sl[1];
    assign sl7[7] = temp_sl[0];
    
    MUX_8to1 y1(.in(sl0), .sel1(b[0]), .sel2(b[1]), .sel3(b[2]), .out(out[0]));
    MUX_8to1 y2(.in(sl1), .sel1(b[0]), .sel2(b[1]), .sel3(b[2]), .out(out[1]));
    MUX_8to1 y3(.in(sl2), .sel1(b[0]), .sel2(b[1]), .sel3(b[2]), .out(out[2]));
    MUX_8to1 y4(.in(sl3), .sel1(b[0]), .sel2(b[1]), .sel3(b[2]), .out(out[3]));
    MUX_8to1 y5(.in(sl4), .sel1(b[0]), .sel2(b[1]), .sel3(b[2]), .out(out[4]));
    MUX_8to1 y6(.in(sl5), .sel1(b[0]), .sel2(b[1]), .sel3(b[2]), .out(out[5]));
    MUX_8to1 y7(.in(sl6), .sel1(b[0]), .sel2(b[1]), .sel3(b[2]), .out(out[6]));
    MUX_8to1 y8(.in(sl7), .sel1(b[0]), .sel2(b[1]), .sel3(b[2]), .out(out[7]));

endmodule
