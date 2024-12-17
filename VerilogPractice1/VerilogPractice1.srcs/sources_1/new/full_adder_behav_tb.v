`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/25/2024 06:30:20 PM
// Design Name: 
// Module Name: full_adder_behav_tb
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
module full_adder_behav_tb();
    reg a, b, cin;
    
    wire s, cout;
    
    full_adder_behav uut (
        .a(a),
        .b(b),
        .cin(cin),
        .s(s),
        .cout(cout)
    );
    
    initial begin
        a = 1;
        b = 1;
        cin = 0;
        #100;
    end
endmodule
