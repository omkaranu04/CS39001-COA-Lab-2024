`timescale 1ns / 1ps

module full_adder_tb();
    // Inputs
    reg a, b, cin;
    
    // Outputs
    wire s, cout;
    
    // Instantiate the Unit Under Test (UUT)
    full_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .s(s),
        .cout(cout)
    );
    
    initial begin
        // Initialize inputs
        a = 1;
        b = 1;
        cin = 1;
        #100;
    end
endmodule