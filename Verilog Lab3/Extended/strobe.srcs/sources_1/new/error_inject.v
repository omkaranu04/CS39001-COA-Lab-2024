module error_inject(d_error, d_og, pos, clk, strobe);
    output reg [6:0] d_error;
    output reg [6:0] d_og;
    input [1:0] pos; 
    input clk, strobe;
    
    always @(negedge clk) begin
        if (strobe) begin
            // Shift the d_og bits
            d_og[0] <= d_og[1];
            d_og[1] <= d_og[2];
            d_og[2] <= d_og[3];
            d_og[3] <= d_og[4];
            d_og[4] <= d_og[5];
            d_og[5] <= d_og[6];
            d_og[6] <= d_og[0];
        end 
    end

    always @(*) begin
        // Combinational logic for error injection
        d_error[0] = d_og[0];
        d_error[1] = d_og[1];
        d_error[2] = d_og[2] ^ (~pos[1] & ~pos[0]);
        d_error[3] = d_og[3];
        d_error[4] = d_og[4] ^ (~pos[1] & pos[0]);
        d_error[5] = d_og[5] ^ (pos[1] & ~pos[0]);
        d_error[6] = d_og[6] ^ (pos[1] & pos[0]);
    end
endmodule