`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2022 10:42:57 PM
// Design Name: 
// Module Name: alu_part
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

`define ALU_CMD_XOR 3'b000
`define ALU_CMD_ADD 3'b001
`define ALU_CMD_SUB 3'b010
`define ALU_CMD_MUL 3'b011
`define ALU_CMD_dft 3'b100

module alu_part(
    input wire  [127:0] synchronous_in,
    input wire          synchronous_valid,
    input wire clk,
    input wire rst,
    output reg [15:0]out,
    output reg out_valid
    );
    reg [2:0] A, B;
    reg [2:0] cmd;
    reg [5:0] result;
    
     always @(*) begin
        case (synchronous_in[127:120])
            "0": A = 3'd0;
            "1": A = 3'd1;
            "2": A = 3'd2;
            "3": A = 3'd3;
            "4": A = 3'd4;
            "5": A = 3'd5;
            "6": A = 3'd6;
            "7": A = 3'd7;
            default: A = 3'd0;
        endcase
     end
     
     always @(*) begin
        case (synchronous_in[95:88])
            "0": B = 3'd0;
            "1": B = 3'd1;
            "2": B = 3'd2;
            "3": B = 3'd3;
            "4": B = 3'd4;
            "5": B = 3'd5;
            "6": B = 3'd6;
            "7": B = 3'd7;
            default: B = 3'd0;
        endcase
    end
    
    always @(*) begin
        case (synchronous_in[111:104])
            "^": cmd = `ALU_CMD_XOR;
            "+": cmd = `ALU_CMD_ADD;
            "-": cmd = `ALU_CMD_SUB;
            "#": cmd = `ALU_CMD_MUL;
            default: cmd = `ALU_CMD_dft;
        endcase
    end
    
    always @(*) begin
        case (cmd)
            `ALU_CMD_XOR: result = {3'b0, A ^ B};
            `ALU_CMD_ADD: result = A + B;
            `ALU_CMD_SUB: result = A - B;
            `ALU_CMD_MUL: result = A * B;
			`ALU_CMD_dft: result = 0;
			default: result = 0;
        endcase
    end
    
    always @(posedge clk) begin
        if (rst) begin
            out <= {2{8'b00100000}}; 
            out_valid <= 0;
        end else if (synchronous_valid) begin
            out[15:8] <= (result / 10) + "0";
            out[7:0] <= (result % 10) + "0";
            out_valid <= 1;
        end else begin
            out_valid <= 0; 
        end
        
    end
endmodule
