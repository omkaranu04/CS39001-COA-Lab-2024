`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 03:25:49 PM
// Design Name: 
// Module Name: ALU
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

module ALU #(parameter SIZE = 8) (a, b, opcode, out);   
    
    input [SIZE-1:0] a, b;
    input [3:0] opcode;
    output [SIZE-1:0] out;

    /*
    0000: A+B
    0001: A-B
    0010: A*B
    0011: A/B
    0100: A AND B
    0101: A OR B
    0110: A XOR B
    0111: A BAR
    1000: A
    1001: B
    1010: A<<B
    1011: A>>B (logical)
    1100: A>>B (arithmetic)
    1101: A+4
    1110: A-4
    1111: HAM(A)
    */

    wire [SIZE-1:0] sum, diff, prod, quot, rem_hi, andAB, orAB, xorAB, complementA, a_shift_left_b, a_shift_right_b, a_shift_right_arith_b, a_plus_4, a_minus_4, ham;
    wire cout_add, cout_sub, cout_add4, cout_sub4;

    ALU_Adder                           #(.SIZE(SIZE)) adder(.a(a), .b(b), .cin(1'b0), .s(sum), .c(cout_add));
    ALU_Subtractor                      #(.SIZE(SIZE)) subtractor(.a_in(a), .b_in(b), .cin(1'b0), .diff(diff), .c(cout_sub));
    ALU_Multiply                        #(.SIZE(SIZE)) multiplier(.a(a), .b(b), .p(prod));
    ALU_Divide                          #(.SIZE(SIZE)) divider(.a(a), .b(b), .q(quot));
    ALU_AND                             #(.SIZE(SIZE)) alu_and(.a(a), .b(b), .out(andAB));
    ALU_OR                              #(.SIZE(SIZE)) alu_or(.a(a), .b(b), .out(orAB));
    ALU_XOR                             #(.SIZE(SIZE)) alu_xor(.a(a), .b(b), .out(xorAB));
    ALU_NEGATION                        #(.SIZE(SIZE)) alu_not(.in(a), .out(complementA));
    ALU_Barrel_Left                     #(.N(SIZE)) alu_shift_left(.A(a), .B(b), .Y(a_shift_left_b));
    ALU_Barrel_Right                    #(.N(SIZE)) alu_shift_right(.A(a), .B(b), .Y(a_shift_right_b));
    ALU_Barrel_Arithmetic_Right         #(.N(SIZE)) alu_shift_right_arith(.A(a), .B(b), .Y(a_shift_right_arith_b));
    ALU_Adder                           #(.SIZE(SIZE)) adder_plus_4(.a(a), .b({{(SIZE-3){1'b0}}, 3'b100}), .cin(1'b0), .s(a_plus_4), .c(cout_add4));
    ALU_Subtractor                      #(.SIZE(SIZE)) subtractor_minus_4(.a_in(a), .b_in({{(SIZE-3){1'b0}}, 3'b100}), .cin(1'b0), .diff(a_minus_4), .c(cout_sub4));
    ALU_Ham                             alu_ham(.a(a), .count(ham));
    
//    wire [15:0] alu_bit0, alu_bit1, alu_bit2, alu_bit3, alu_bit4, alu_bit5, alu_bit6, alu_bit7;
    wire [15:0] alu_bit [SIZE-1:0];
    
//    initial begin
//        $monitor("ALU BIT: %b : ", alu_bit[0]);
//    end
    
    genvar i, j, k;
    generate
            for(j=0; j<SIZE; j=j+1) begin
                assign alu_bit[j][0] = sum[j];
                assign alu_bit[j][1] = diff[j];
                assign alu_bit[j][2] = prod[j];
                assign alu_bit[j][3] = quot[j];
                assign alu_bit[j][4] = andAB[j];
                assign alu_bit[j][5] = orAB[j];
                assign alu_bit[j][6] = xorAB[j];
                assign alu_bit[j][7] = complementA[j];
                assign alu_bit[j][8] = a[j];
                assign alu_bit[j][9] = b[j];
                assign alu_bit[j][10] = a_shift_left_b[j];
                assign alu_bit[j][11] = a_shift_right_b[j];
                assign alu_bit[j][12] = a_shift_right_arith_b[j];
                assign alu_bit[j][13] = a_plus_4[j];
                assign alu_bit[j][14] = a_minus_4[j];
                assign alu_bit[j][15] = ham[j];
            end     
     
        for(k=0; k<SIZE; k=k+1)begin
            MUX_16to1 alu_first_bit(.in(alu_bit[k]), .sel1(opcode[0]), .sel2(opcode[1]), .sel3(opcode[2]), .sel4(opcode[3]), .out(out[k]));
        end
    endgenerate
    
//    assign alu_bit0[0] = sum[0];
//    assign alu_bit1[0] = sum[1];
//    assign alu_bit2[0] = sum[2];
//    assign alu_bit3[0] = sum[3];
//    assign alu_bit4[0] = sum[4];
//    assign alu_bit5[0] = sum[5];
//    assign alu_bit6[0] = sum[6];
//    assign alu_bit7[0] = sum[7];

//    assign alu_bit0[1] = diff[0];
//    assign alu_bit1[1] = diff[1];
//    assign alu_bit2[1] = diff[2];
//    assign alu_bit3[1] = diff[3];
//    assign alu_bit4[1] = diff[4];
//    assign alu_bit5[1] = diff[5];
//    assign alu_bit6[1] = diff[6];
//    assign alu_bit7[1] = diff[7];

//    assign alu_bit0[2] = prod[0];
//    assign alu_bit1[2] = prod[1];
//    assign alu_bit2[2] = prod[2];
//    assign alu_bit3[2] = prod[3];
//    assign alu_bit4[2] = prod[4];
//    assign alu_bit5[2] = prod[5];
//    assign alu_bit6[2] = prod[6];
//    assign alu_bit7[2] = prod[7];

//    assign alu_bit0[3] = quot[0];
//    assign alu_bit1[3] = quot[1];
//    assign alu_bit2[3] = quot[2];
//    assign alu_bit3[3] = quot[3];
//    assign alu_bit4[3] = quot[4];
//    assign alu_bit5[3] = quot[5];
//    assign alu_bit6[3] = quot[6];
//    assign alu_bit7[3] = quot[7];

//    assign alu_bit0[4] = andAB[0];
//    assign alu_bit1[4] = andAB[1];
//    assign alu_bit2[4] = andAB[2];
//    assign alu_bit3[4] = andAB[3];
//    assign alu_bit4[4] = andAB[4];
//    assign alu_bit5[4] = andAB[5];
//    assign alu_bit6[4] = andAB[6];
//    assign alu_bit7[4] = andAB[7];

//    assign alu_bit0[5] = orAB[0];
//    assign alu_bit1[5] = orAB[1];
//    assign alu_bit2[5] = orAB[2];
//    assign alu_bit3[5] = orAB[3];
//    assign alu_bit4[5] = orAB[4];
//    assign alu_bit5[5] = orAB[5];
//    assign alu_bit6[5] = orAB[6];
//    assign alu_bit7[5] = orAB[7];

//    assign alu_bit0[6] = xorAB[0];
//    assign alu_bit1[6] = xorAB[1];
//    assign alu_bit2[6] = xorAB[2];
//    assign alu_bit3[6] = xorAB[3];
//    assign alu_bit4[6] = xorAB[4];
//    assign alu_bit5[6] = xorAB[5];
//    assign alu_bit6[6] = xorAB[6];
//    assign alu_bit7[6] = xorAB[7];

//    assign alu_bit0[7] = complementA[0];
//    assign alu_bit1[7] = complementA[1];
//    assign alu_bit2[7] = complementA[2];
//    assign alu_bit3[7] = complementA[3];
//    assign alu_bit4[7] = complementA[4];
//    assign alu_bit5[7] = complementA[5];
//    assign alu_bit6[7] = complementA[6];
//    assign alu_bit7[7] = complementA[7];

//    assign alu_bit0[8] = a[0];
//    assign alu_bit1[8] = a[1];
//    assign alu_bit2[8] = a[2];
//    assign alu_bit3[8] = a[3];
//    assign alu_bit4[8] = a[4];
//    assign alu_bit5[8] = a[5];
//    assign alu_bit6[8] = a[6];
//    assign alu_bit7[8] = a[7];

//    assign alu_bit0[9] = b[0];
//    assign alu_bit1[9] = b[1];
//    assign alu_bit2[9] = b[2];
//    assign alu_bit3[9] = b[3];
//    assign alu_bit4[9] = b[4];
//    assign alu_bit5[9] = b[5];
//    assign alu_bit6[9] = b[6];
//    assign alu_bit7[9] = b[7];

//    assign alu_bit0[10] = a_shift_left_b[0];
//    assign alu_bit1[10] = a_shift_left_b[1];
//    assign alu_bit2[10] = a_shift_left_b[2];
//    assign alu_bit3[10] = a_shift_left_b[3];
//    assign alu_bit4[10] = a_shift_left_b[4];
//    assign alu_bit5[10] = a_shift_left_b[5];
//    assign alu_bit6[10] = a_shift_left_b[6];
//    assign alu_bit7[10] = a_shift_left_b[7];

//    assign alu_bit0[11] = a_shift_right_b[0];
//    assign alu_bit1[11] = a_shift_right_b[1];
//    assign alu_bit2[11] = a_shift_right_b[2];
//    assign alu_bit3[11] = a_shift_right_b[3];
//    assign alu_bit4[11] = a_shift_right_b[4];
//    assign alu_bit5[11] = a_shift_right_b[5];
//    assign alu_bit6[11] = a_shift_right_b[6];
//    assign alu_bit7[11] = a_shift_right_b[7];

//    assign alu_bit0[12] = a_shift_right_arith_b[0];
//    assign alu_bit1[12] = a_shift_right_arith_b[1];
//    assign alu_bit2[12] = a_shift_right_arith_b[2];
//    assign alu_bit3[12] = a_shift_right_arith_b[3];
//    assign alu_bit4[12] = a_shift_right_arith_b[4];
//    assign alu_bit5[12] = a_shift_right_arith_b[5];
//    assign alu_bit6[12] = a_shift_right_arith_b[6];
//    assign alu_bit7[12] = a_shift_right_arith_b[7];

//    assign alu_bit0[13] = a_plus_4[0];
//    assign alu_bit1[13] = a_plus_4[1];
//    assign alu_bit2[13] = a_plus_4[2];
//    assign alu_bit3[13] = a_plus_4[3];
//    assign alu_bit4[13] = a_plus_4[4];
//    assign alu_bit5[13] = a_plus_4[5];
//    assign alu_bit6[13] = a_plus_4[6];
//    assign alu_bit7[13] = a_plus_4[7];

//    assign alu_bit0[14] = a_minus_4[0];
//    assign alu_bit1[14] = a_minus_4[1];
//    assign alu_bit2[14] = a_minus_4[2];
//    assign alu_bit3[14] = a_minus_4[3];
//    assign alu_bit4[14] = a_minus_4[4];
//    assign alu_bit5[14] = a_minus_4[5];
//    assign alu_bit6[14] = a_minus_4[6];
//    assign alu_bit7[14] = a_minus_4[7];

//    assign alu_bit0[15] = ham[0];
//    assign alu_bit1[15] = ham[1];
//    assign alu_bit2[15] = ham[2];
//    assign alu_bit3[15] = ham[3];
//    assign alu_bit4[15] = ham[4];
//    assign alu_bit5[15] = ham[5];
//    assign alu_bit6[15] = ham[6];
//    assign alu_bit7[15] = ham[7];

//    MUX_16to1 alu_first_bit(.in(alu_bit0), .sel1(opcode[0]), .sel2(opcode[1]), .sel3(opcode[2]), .sel4(opcode[3]), .out(out[0]));
//    MUX_16to1 alu_second_bit(.in(alu_bit1), .sel1(opcode[0]), .sel2(opcode[1]), .sel3(opcode[2]), .sel4(opcode[3]), .out(out[1]));
//    MUX_16to1 alu_third_bit(.in(alu_bit2), .sel1(opcode[0]), .sel2(opcode[1]), .sel3(opcode[2]), .sel4(opcode[3]), .out(out[2]));
//    MUX_16to1 alu_fourth_bit(.in(alu_bit3), .sel1(opcode[0]), .sel2(opcode[1]), .sel3(opcode[2]), .sel4(opcode[3]), .out(out[3]));
//    MUX_16to1 alu_fifth_bit(.in(alu_bit4), .sel1(opcode[0]), .sel2(opcode[1]), .sel3(opcode[2]), .sel4(opcode[3]), .out(out[4]));
//    MUX_16to1 alu_sixth_bit(.in(alu_bit5), .sel1(opcode[0]), .sel2(opcode[1]), .sel3(opcode[2]), .sel4(opcode[3]), .out(out[5]));
//    MUX_16to1 alu_seventh_bit(.in(alu_bit6), .sel1(opcode[0]), .sel2(opcode[1]), .sel3(opcode[2]), .sel4(opcode[3]), .out(out[6]));
//    MUX_16to1 alu_eighth_bit(.in(alu_bit7), .sel1(opcode[0]), .sel2(opcode[1]), .sel3(opcode[2]), .sel4(opcode[3]), .out(out[7]));

endmodule
