`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2022 05:02:42 PM
// Design Name: 
// Module Name: printer
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

//internal_process pass value to printer to show the corresponding content on terminal.
//printer target state
`define REPORT_NONE  3'b000
`define REPORT_ALU   3'b001
`define REPORT_CPU   3'b010
`define REPORT_BENCH 3'b011
//printer cmd
`define STRING_NONE    3'b000
`define STRING_INTRO   3'b001
`define STRING_BENCH   3'b010
`define STRING_ALU     3'b011
`define STRING_CPU     3'b100
`define STRING_INVALID 3'b101
`define STRING_REPORT  3'b110
module printer(
    output reg print_en,
    output reg [7:0]print_char,
    output reg print_done,
    input wire [7:0]key_input,
    input wire key_valid,
    input wire [15:0]alu_input,
    input wire alu_valid,
    input wire [31:0]cpu_input,
    input wire cpu_valid,
    input wire [7:0]bench_input,
    input wire bench_valid,
    input wire [2:0]print_cmd, //
    input wire clk,
    input wire rst
    );
    reg [5:0]printerCounter;
    reg [2:0]printerTarget;
    
    //loop for choosing which signal will be print out on terminal
    always@(posedge clk)begin
        if (rst)
            printerTarget <= `REPORT_NONE;
        else if (alu_valid)
            printerTarget <= `REPORT_ALU;
        else if (cpu_valid)
            printerTarget <= `REPORT_CPU;
        else if (bench_valid)
            printerTarget <= `REPORT_BENCH;
    end
    
    always@(posedge clk)begin
        if (rst) begin
            printerCounter <= 6'b0;
            printerTarget <= `REPORT_NONE;
            print_char <= 8'b0;
            print_done <= 0;
        end else if (print_cmd == `STRING_NONE) begin
        
        
        
        
        
        end else if (print_cmd == `STRING_INTRO) begin
            
        
        
        
        end
            
    
    
    
    
    
    
    end
    
endmodule
