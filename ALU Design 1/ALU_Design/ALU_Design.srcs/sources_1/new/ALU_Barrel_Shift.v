`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2024 08:26:32 PM
// Design Name: 
// Module Name: ALU_Barrel_Shift
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


module ALU_Barrel_Shift #(parameter N = 8) (A, B, left_right, arith, Y);
    input [N-1:0] A;      
    input [N-1:0] B; 
    input left_right;     
    input arith;        
    output [N-1:0] Y;
    
    wire [$clog2(N)-1:0] shift = B[$clog2(N)-1:0];
    wire [N-1:0] shift_1; 
    supply0 zero_supply;

    wire [N-1:$clog2(N)] excess_shift;

    initial begin
        $monitor("A=%b, B=%b, left_right=%b, arith=%b, Y=%b, zero_supply=%b, excess=%b", A, B, left_right, arith, Y, zero_supply, excess_shift);
    end

    or excess_shift_check(excess_shift[$clog2(N)], B[$clog2(N)], zero_supply);

    genvar k;
    generate
        for (k = $clog2(N)+1; k < N; k = k + 1) begin
            or excess_shift_check(excess_shift[k], B[k], excess_shift[k-1]);
        end
    endgenerate

    wire [N-1:0] layer_int[$clog2(N) + 1:0];
    assign layer_int[0] = A;

    genvar i, j;
    generate
        for(j = 1; j <= N; j = j*2) begin: layer
            for (i = 0; i < N; i = i + 1) begin : shift1
                wire left_shift_result = (i >= j) ? layer_int[$clog2(j)][i-j] : 1'b0;
                wire right_shift_result = (i < N-j) ? layer_int[$clog2(j)][i+j] : (arith ? layer_int[$clog2(j)][N-1] : 1'b0);

                MUX_2to1 shift_mux(right_shift_result, left_shift_result, left_right, shift_1[i]);

                MUX_2to1 change_value(layer_int[$clog2(j)][i], shift_1[i], shift[$clog2(j) - 1], layer_int[$clog2(j)+1][i]);
            end
        end
    endgenerate

    genvar l;
    generate
        for (l = 0; l < N; l = l + 1) begin : final_output
            MUX_2to1 check_excess (layer_int[$clog2(N) + 1][l], zero_supply, excess_shift[N-1], Y[l]);
        end
    endgenerate
               
endmodule
