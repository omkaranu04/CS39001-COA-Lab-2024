`timescale 1ns / 1ps

module tb_Master_Interface;

    // Parameters
    reg clk;
    reg rst;
    wire [15:0] reg2;
    reg [4:0] which_mem;
    
    // Instantiate the Unit Under Test (UUT)
    Master_Interface uut (
        .clk_in(clk),
        .rst(rst),
        .reg2(reg2),
        .which_mem(which_mem)
    );

    // Clock Generation
    initial begin
        forever #1 clk = ~clk; // 100MHz clock
    end

    initial begin
        $monitor("disp: %b", reg2);
    end
    // Stimulus
    initial begin
        // Release reset
        clk = 0;        
        rst = 1;
        #2
        rst =  0;
        which_mem  = 5'b00001;
        #100000;
        // Finish simulation
        $finish;
    end


endmodule