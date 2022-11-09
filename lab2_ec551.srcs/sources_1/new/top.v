`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2022 09:27:58 PM
// Design Name: 
// Module Name: top
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


module top(
    input CLK100MHZ,
    input PS2_CLK,
    input PS2_DATA,
    output [6:0]SEG,
    output [7:0]AN,
    output DP,
    output UART_TXD
    );
    reg CLK50MHZ=0;    
    wire [31:0]keycode;
    
    always @(posedge(CLK100MHZ))begin
        CLK50MHZ<=~CLK50MHZ;
    end
    
    PS2Receiver keyboard (
        .clk(CLK50MHZ),
        .kclk(PS2_CLK),
        .kdata(PS2_DATA),
        .keycodeout(keycode[31:0])
    );
    
    UART_TX_CTRL utx(
         .SEND(), 
         .DATA(PS2_DATA), 
         .CLK(CLK50MHZ), 
         .READY(), 
         .UART_TX() 
    );
endmodule
