`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2024 10:47:36 PM
// Design Name: 
// Module Name: ControlPath
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


module ControlPath(clk, start, eqZ, ldA, ldB, decB, ldP, clrP, done);
    input clk, start, eqZ;
    output reg ldA, ldB, decB, ldP, clrP, done;
    
    reg [2:0] state, next_state;
    
    always @(posedge clk)
        begin
            state <= next_state;
        end
        
    always @(*) begin
        ldA = 0;
        ldB = 0;
        decB = 0;
        ldP = 0;
        clrP = 0;
        done = 0;

        case(state)
            3'b000: begin
                if(start) next_state = 3'b001;
            end
            3'b001: begin
                next_state = 3'b010;
                ldA = 1;
            end
            3'b010: begin
                next_state = 3'b011;
                ldB = 1;
                clrP = 1;
            end
            3'b011: begin
                if(eqZ ==  1'b1) begin 
                    decB = 0;
                    next_state = 3'b101;
                end
                else begin
                next_state = 3'b011;
                decB = 1;
                ldP = 1;
                end
            end
            3'b100: begin
                done = 1;
                decB = 0;
                next_state = 3'b101;
            end
            3'b101 : begin
            end
            default: begin
                next_state = 3'b000;
            end
        endcase
    end
    
    always @(*) begin
        $display("State : %d, eqZ : %d", state, eqZ);
    end
endmodule
