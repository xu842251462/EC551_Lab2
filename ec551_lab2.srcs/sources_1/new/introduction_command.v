`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2022 09:34:55 PM
// Design Name: 
// Module Name: introduction_command
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

`define INTRO_ENTER_CPU     3'b000
`define INTRO_ENTER_ALU     3'b001
`define INTRO_ENTER_BENCH   3'b010
`define INTRO_PRINT_INVALID 3'b011

module introduction_part(
        input wire  [127:0] synchronous_in,
        input wire          synchronous_valid,
        input wire clk,
        input wire rst,
        output reg [2:0]command,
        output reg command_validation
    );
     always @(posedge clk) begin
        // character connect to keyboard conveter
        case(synchronous_in[127:120])
            "I": command <= `INTRO_ENTER_CPU;
            "A": command <= `INTRO_ENTER_ALU;
            "B": command <= `INTRO_ENTER_BENCH;
            default: command <= `INTRO_PRINT_INVALID;
        endcase
    
        command_validation <= synchronous_valid;
     end
endmodule

       
