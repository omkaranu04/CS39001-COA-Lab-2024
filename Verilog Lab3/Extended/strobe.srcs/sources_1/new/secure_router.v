module secure_router(d_out, d_error, d_og, hamm1, d_corr, d_in, clk);
    input [5:0] d_in;
    input clk;
    output [15:0] d_out;
    output [6:0] d_error, d_og;
    output [6:0] hamm1;  // Renamed from hamm to hamm1 for clarity
    output [3:0] d_corr;

    wire [6:0] hamm;  // Internal wire for the Hamming code logic

    // Generate the Hamming code bits
    assign hamm[2] = d_in[0];
    assign hamm[4] = d_in[1];
    assign hamm[5] = d_in[2];
    assign hamm[6] = d_in[3];
    assign hamm[0] = hamm[2] ^ hamm[4] ^ hamm[6];
    assign hamm[1] = hamm[2] ^ hamm[5] ^ hamm[6];
    assign hamm[3] = hamm[4] ^ hamm[5] ^ hamm[6];  

    // Declare reg types for signals modified in always blocks
    reg x, y;
    reg strobe_in, strobe_corr;
    reg [4:0] count;  // Extend the counter width to avoid overflow

    // Initialize the signals
    initial begin
        count = 0;
        strobe_in = 1;
        strobe_corr = 0;
    end
        
    // Instantiate the error inject and correct modules
    error_inject ei(d_error, d_og, d_in[5:4], clk, strobe_in);
    error_correct ec(d_corr, hamm1, y, clk, strobe_corr);
    
    // Sequential logic block
    always @(negedge clk) begin
        if (count == 8) begin
            strobe_in <= 0;
            strobe_corr <= 1;
        end
        else if (count == 16) begin
            strobe_corr <= 0;
        end
        
        if (count < 8) 
            x <= hamm[7 - count];
        else if (count < 16) 
            y <= d_error[15 - count];
        
        count <= count + 1;
        if (count >= 20) 
            count <= 0;
    end
    
    // Output assignments
    assign d_out[15:12] = d_corr & {4{(d_in[5] & d_in[4])}};
    assign d_out[11:8]  = d_corr & {4{(d_in[5] & ~d_in[4])}};
    assign d_out[7:4]   = d_corr & {4{(~d_in[5] & d_in[4])}};
    assign d_out[3:0]   = d_corr & {4{(~d_in[5] & ~d_in[4])}};
endmodule