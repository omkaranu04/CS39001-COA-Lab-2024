`timescale 1ns / 1ps

module half_adder_tb();
    // Inputs
    reg a, b;
    
    // Outputs
    wire s, cout;
    
    // Instantiate the Unit Under Test (UUT)
    half_adder uut (
        .a(a),
        .b(b),
        .s(s),
        .cout(cout)
    );
    
    initial begin
        // Initialize inputs
        a = 1;
        b = 1;
        #100;
    end
endmodule