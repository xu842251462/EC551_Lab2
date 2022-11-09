`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2022 04:52:28 PM
// Design Name: 
// Module Name: internal_process
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
`define EXEC_STATE_INTRO 2'b00
`define EXEC_STATE_BENCH 2'b01
`define EXEC_STATE_CPU   2'b10
`define EXEC_STATE_ALU   2'b11


module internal_process(
        input wire [7:0] key_in,
        input wire key_valid,

        output wire [7:0] print_char,
        output wire print_valid,

        input wire clk,
        input wire rst
    );
    wire [127:0] buffer;
    wire buffer_valid;

    wire print_done;

    wire [2:0] intro_command;
    wire intro_command_valid;

    wire [15:0] alu_print;
    wire alu_print_valid;

    wire [31:0] cpu_print;
    wire cpu_print_valid;

    wire [7:0] bench_print;
    wire bench_valid;

    printer pt(
        .print_en(print_valid),
        .print_char(print_char),
        .print_done(print_done),

        .key_input(key_in),
        .key_valid(key_valid),

        .alu_input(alu_print),
        .alu_valid(alu_print_valid),

        .cpu_input(cpu_print),
        .cpu_valid(cpu_print_valid),

        .bench_input(bench_print),
        .bench_valid(bench_print_valid),

        .print_cmd(state_print),

        .clk(clk),
        .rst(rst)
        ); //connecting to printer which is printing something on terminal
    
    wire [2:0] state_print;
    wire [1:0] state_exec;
    wire state_input;
        
    state_machine sm(
        .state_input(state_input),
        .state_string(state_print),
        .state_execution(state_exec),

        .printer_done(print_done),

        .command(intro_command),
        .command_valid(intro_command_valid),

        .alu_valid(alu_print_valid),
        .cpu_valid(cpu_print_valid),
        .bench_valid(bench_print_valid),

        .clk(clk),
        .rst(rst)
    );
    
    Keyboard_synchronous ks(
        .key(key_in),
        .key_valid(key_valid),

        .synchronous_out(buffer),
        .synchronous_valid(buffer_valid),
        
        .clk(clk),
        .rst(rst)); // connecting the keyword input from the top_module
        
    introduction_part ip(
        .synchronous_in(buffer),
        .synchronous_valid(buffer_valid),

        .command(intro_command),
        .command_validation(intro_command_valid),

        .clk(clk),
        .rst(rst));//connecting the beginning screen showing the 'EC551'
    
    alu_part ap(
        .synchronous_in(buffer),
        .synchronous_valid(buffer_valid),

        .out(alu_print),
        .out_valid(alu_print_valid),

        .clk(clk),
        .rst(rst || (state_exec != `EXEC_STATE_ALU))); //connecting the alu 
    
    cpu_part cp(
        .synchronous_in(buffer),
        .synchronous_valid(buffer_valid),

        .out(cpu_print),
        .out_valid(cpu_print_valid),
        
        .clk(clk),
        .rst(rst || (state_exec != `EXEC_STATE_CPU))
    ); //connecting the CPU from lab1
    
    bench_part bp(
        .synchronous_in(buffer),
        .synchronous_valid(buffer_valid),

        .print_data(bench_print),
        .print_valid(bench_print_valid),

        .clk(clk),
        .rst(rst || (state_exec != `EXEC_STATE_BENCH))); // for connecting martix mutiplication
    
endmodule
