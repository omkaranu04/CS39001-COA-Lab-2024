`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 14:24:20
// Design Name: 
// Module Name: secure_router
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


module secure_router(d_in, d_out0, d_out1, d_out2, d_out3);
    input wire [5:0] d_in;
    output reg [6:0] d_out0, d_out1, d_out2, d_out3;
    
    wire [1:0] port_sel = d_in[5:4];
    wire [3:0] data = d_in[3:0];
    
    reg [6:0] hamming_code;
    
    always  @(*) begin
        hamming_code[0] <= data[0]^data[1]^data[3];
        hamming_code[1] <= data[0]^data[2]^data[3];
        hamming_code[3] <= data[1]^data[2]^data[3];
        hamming_code[2] <= data[0];
        hamming_code[4] <= data[1];
        hamming_code[5] <= data[2];
        hamming_code[6] <= data[3];
    end
    
    always @(*) begin
        d_out0 = 7'b0;
        d_out1 = 7'b0;
        d_out2 = 7'b0;
        d_out3 = 7'b0;
        
        case (port_sel)
            2'b00: d_out0 = hamming_code;
            2'b01: d_out1 = hamming_code;
            2'b10: d_out2 = hamming_code;
            2'b11: d_out3 = hamming_code;
        endcase
    end
    
endmodule
