module secure_router_tb;
    reg [5:0] d_in;
    reg clk;

    wire [15:0] d_out;
    wire [6:0] d_error, d_og, hamm1;
    wire [3:0] d_corr;

    // Instantiate the UUT (Unit Under Test)
    secure_router uut (
        .d_out(d_out), 
        .d_in(d_in), 
        .clk(clk),
        .d_og(d_og),
        .hamm1(hamm1),
        .d_corr(d_corr),
        .d_error(d_error)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk;  // Generate clock with 20 ns period
    end

    // Test stimulus
    initial begin
        d_in = 6'b101110;  // Test input
        #100; // Wait 100 ns for global reset to finish
    end
endmodule