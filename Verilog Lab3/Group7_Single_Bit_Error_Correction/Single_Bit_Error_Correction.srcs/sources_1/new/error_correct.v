`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 14:25:14
// Design Name: 
// Module Name: error_correct
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


module error_correct(d_hamm, d_disp);
    input wire [6:0] d_hamm;
    output reg [3:0] d_disp;
    
    reg [2:0] check_bits;
    reg [6:0] d_temp;
    
    always @(*) begin
        check_bits[0] <= d_hamm[0]^d_hamm[2]^d_hamm[4]^d_hamm[6];
        check_bits[1] <= d_hamm[1]^d_hamm[2]^d_hamm[5]^d_hamm[6];
        check_bits[2] <= d_hamm[3]^d_hamm[4]^d_hamm[5]^d_hamm[6];
        
        d_temp = d_hamm;
        
        case (check_bits)
            3'd1: d_temp[0] = ~d_temp[0];
            3'd2: d_temp[1] = ~d_temp[1];
            3'd3: d_temp[2] = ~d_temp[2];
            3'd4: d_temp[3] = ~d_temp[3];
            3'd5: d_temp[4] = ~d_temp[4];
            3'd6: d_temp[5] = ~d_temp[5];
            3'd7: d_temp[6] = ~d_temp[6];
            default: d_temp = d_hamm;
        endcase
        
    
        d_disp[0] <= d_temp[2];
        d_disp[1] <= d_temp[4];
        d_disp[2] <= d_temp[5];
        d_disp[3] <= d_temp[6];
        
    end
    
endmodule
