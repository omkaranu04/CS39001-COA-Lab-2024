module error_correct(d_disp, hamm, y, clk, strobe);
    input y, clk, strobe;
    output reg [3:0] d_disp;  // `reg` because d_disp is assigned in the always block
    output reg [6:0] hamm;
    
    reg [2:0] curr;  // `reg` type since curr will be assigned inside always block
    
    always @(negedge clk) begin
        if (strobe) begin
            hamm[0] <= y;
            hamm[1] <= hamm[0];
            hamm[2] <= hamm[1];
            hamm[3] <= hamm[2];
            hamm[4] <= hamm[3];
            hamm[5] <= hamm[4];
            hamm[6] <= hamm[5];
            
            // Calculate curr values based on the updated hamm values
            curr[0] <= hamm[0] ^ hamm[2] ^ hamm[4] ^ hamm[6];
            curr[1] <= hamm[1] ^ hamm[2] ^ hamm[5] ^ hamm[6];
            curr[2] <= hamm[3] ^ hamm[4] ^ hamm[5] ^ hamm[6];
        end
    end
    
    // Error correction logic based on curr
    always @(*) begin
        d_disp[0] = hamm[2] ^ (~curr[2] & curr[1] & curr[0]);
        d_disp[1] = hamm[4] ^ (curr[2] & ~curr[1] & curr[0]);
        d_disp[2] = hamm[5] ^ (curr[2] & curr[1] & ~curr[0]);
        d_disp[3] = hamm[6] ^ (curr[2] & curr[1] & curr[0]);
    end
endmodule