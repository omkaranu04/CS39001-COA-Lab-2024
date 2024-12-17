`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2024 11:12:10 PM
// Design Name: 
// Module Name: master_test
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

module master_test();
    reg clk, start;
    reg [15:0] data_in1, data_in2;   // Corrected to 16-bit
    
    wire done;
    
    Master uut(clk, start, data_in1, data_in2, done);
    
     initial begin
        clk = 1'b0;
        start = 1'b0;
        
        data_in1 = 16'b0000000000000101;  // Set data_in to 5
        data_in2 = 16'b0000000000000111;    // Set data_in to 3
        #5 start = 1'b1;                    // Start signal high to initiate
        #5 start = 1'b0;                   // Lower start signal after initiating
        if(done) $finish;                      // End simulation after a delay
    end
         
    initial begin
        $monitor($time, " data_in1 : %d, data_in2 : %d", data_in1, data_in2);
    end
    
    
    always #5 clk = ~clk;
    
endmodule