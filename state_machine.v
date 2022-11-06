`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2022 10:10:16 PM
// Design Name: 
// Module Name: state_machine
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
`include "introduction_command.v"
`define INPUT_STATE_BLOCKED 1'b0
`define INPUT_STATE_ALLOWED 1'b1

`define EXEC_STATE_INTRO 2'b00
`define EXEC_STATE_BENCH 2'b01
`define EXEC_STATE_CPU   2'b10
`define EXEC_STATE_ALU   2'b11

//connecting the string input to printer
`define STRING_NONE    3'b000
`define STRING_INTRO   3'b001
`define STRING_BENCH   3'b010
`define STRING_ALU     3'b011
`define STRING_CPU     3'b100
`define STRING_INVALID 3'b101
`define STRING_REPORT  3'b110

//there are three states: output state, input state, execution state
//state: cpu state, bench state, alu state 
module state_machine(
    input wire rst,
    input wire clk,
    input wire [2:0]intro_command,
    input wire printer_done,
    //valid controls that current state is not execuated sychonronized
    input wire intro_command_valid,
    input wire alu_valid, 
    input wire cpu_valid,
    input wire bench_valid,
    
    output reg state_input,
    output reg [2:0]state_string,
    output reg [1:0]state_execution
    );
    always@(posedge clk)begin
        if (rst) begin
            state_execution <= 2'b00;
            state_string <= `EXEC_STATE_INTRO;
            state_input <= `INPUT_STATE_BLOCKED;
        end else if (printer_done) begin //from printer output, when the signal comes, we can enter next input 
            state_input <= `INPUT_STATE_ALLOWED;
            state_string <= `STRING_NONE;
        end else if (state_execution == `EXEC_STATE_INTRO && intro_command_valid) begin //intro state
            state_input <= `INPUT_STATE_BLOCKED;
            state_string <= `STRING_NONE;
            
        end else if (state_execution == `EXEC_STATE_ALU && alu_output_valid) begin //

            state_string <= `STRING_REPORT;
            
        end else if (state_execution == `EXEC_STATE_CPU && alu_output_valid) begin

            state_string <= `STRING_REPORT;
        end else if (state_execution == `EXEC_STATE_BENCH && alu_output_valid) begin

            state_string <= `STRING_REPORT;
        end
    
    
    
    
    
    end
endmodule
