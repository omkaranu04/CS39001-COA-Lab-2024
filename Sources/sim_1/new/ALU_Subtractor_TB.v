`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 15:53:04
// Design Name: 
// Module Name: ALU_Subtractor_TB
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


module ALU_Subtractor_TB();
    reg [31:0] a_in, b_in;
    reg cin;
    
    wire [31:0] s;
    wire c;
    
    ALU_Subtractor #(32) uut(
        .a_in(a_in),
        .b_in(b_in),
        .cin(cin),
        .diff(s),
        .c(c)
    );
    
    initial begin
        $monitor("a = %b, b = %b, cin = %b, diff = %b, cout = %b", a_in, b_in, cin, s, c);
    
        a_in = 32'd2;
        b_in = 32'd4;
        cin = 1'b0;
        
        #100 $finish;
        
     end
    
endmodule
