`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2022 04:42:30 PM
// Design Name: 
// Module Name: top_module
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


module top_module(
    input wire clk_in,
    input wire PS2KeyboardData,
    input wire PS2KeyboardClk,
    output reg [7:0]seg,
    output reg [3:0]an,
    output reg [7:0]led
    );
    seg_display sd ();
    
    uart_buffer ub();//via top_module, passing uart_buffer value to tx and rx
    uart_tx ut(); //passing output to 
    uart_rx ur(); //  
    
    keyboard_controller kc();//receiving data from keyboard which is 8 bits
    internal_process ip();//conecting main logic part, which is 
endmodule
