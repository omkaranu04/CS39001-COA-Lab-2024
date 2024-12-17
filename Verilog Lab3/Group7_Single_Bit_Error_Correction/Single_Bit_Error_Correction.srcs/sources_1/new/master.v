`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 15:45:38
// Design Name: 
// Module Name: master
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


module master(data_in, d_disp0, d_disp1, d_disp2, d_disp3);
    input wire[5:0] data_in;
    output wire [3:0] d_disp0, d_disp1, d_disp2, d_disp3;
    
    wire [6:0] flip_bit0 = 7'b0010000;
    wire [6:0] flip_bit1 = 7'b0000100;
    wire [6:0] flip_bit2 = 7'b0000010;
    wire [6:0] flip_bit3 = 7'b0000001;
    
    wire [6:0] d_error0;
    wire [6:0] d_error1;
    wire [6:0] d_error2;
    wire [6:0] d_error3;
    
    wire [6:0] out0, out1, out2, out3;
    
    secure_router sr(.d_in(data_in), .d_out0(out0), .d_out1(out1), .d_out2(out2), .d_out3(out3));
    
    error_inject e0(.d_orig(out0), .flip_bit(flip_bit0), .d_error(d_error0));
    error_inject e1(.d_orig(out1), .flip_bit(flip_bit1), .d_error(d_error1));
    error_inject e2(.d_orig(out2), .flip_bit(flip_bit2), .d_error(d_error2));
    error_inject e3(.d_orig(out3), .flip_bit(flip_bit3), .d_error(d_error3)); 
    
    error_correct c0(.d_hamm(d_error0), .d_disp(d_disp0));
    error_correct c1(.d_hamm(d_error1), .d_disp(d_disp1));
    error_correct c2(.d_hamm(d_error2), .d_disp(d_disp2));
    error_correct c3(.d_hamm(d_error3), .d_disp(d_disp3));
    
endmodule
