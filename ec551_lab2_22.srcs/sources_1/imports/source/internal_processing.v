`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2022 09:09:13 PM
// Design Name: 
// Module Name: internal_processing
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

module internal_processing(
        input wire [7:0] key_in,
        input wire key_valid,

        output wire [7:0] print_char,
        output wire print_valid,

        input wire clk,
        input wire rst
    );

    wire [127:0] buffer;
    wire buffer_valid;
    
    KbBuffer ks (
        .key(key_in),
        .key_valid(key_valid),

        .buffer_out(buffer),
        .buffer_valid(buffer_valid),
        
        .clk(clk),
        .rst(rst)
    );

    CpuCommand ccommand (
        .buffer(buffer),
        .buffer_valid(buffer_valid),

        .print_data(print_char),
        .print_valid(print_valid),
        
        .clk(clk),
        .rst(rst)
    );

    
    
endmodule
