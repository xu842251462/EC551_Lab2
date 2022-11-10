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
    input wire CLK ,
   // input PS2_CLK,
   // input PS2_DATA,
   /* output [6:0]SEG,
    output [7:0]AN,
    output DP,*/
    output  UART_RXD_OUT
    );
    reg CLK50MHZ = 0;    
   // wire [31:0]keycode;
    reg [7:0] uartData;
    wire  uartRdy;
    wire  uartTX ;
    reg  uartSend = 1;
    reg  [31:0] strIndex = 4'd0;
    wire [7:0] foo [0:47];
    assign foo[0]  = "H";
    assign foo[1]  = "e";
    assign foo[2]  = "l";
    assign foo[3]  = "l";
    assign foo[4]  = "o";
    assign foo[5]  = " ";
    assign foo[6]  = "E";
    assign foo[7]  = "C";
    assign foo[8]  = "5";
    assign foo[9]  = "5";
    assign foo[10] = "1";
    assign foo[11] = ".";
    assign foo[12]  = " ";
    assign foo[13] = "M";
    assign foo[14] = "Y";
    assign foo[15] = " ";
    assign foo[16] = "n";
    assign foo[17] = "a";
    assign foo[18] = "m";
    assign foo[19] = "e";
    assign foo[20] = " ";
    assign foo[21] = "i";
    assign foo[22] = "s";
    assign foo[23] = " ";
    assign foo[24] = "X";
    assign foo[25] = "u";
    assign foo[26] = "\n";
    assign foo[27] = "\r";
    assign foo[28] = "P";
    assign foo[29] = "l";
    assign foo[30] = "e";
    assign foo[31] = "a";
    assign foo[32] = "s";
    assign foo[33] = "e";
    assign foo[34] = " ";
    assign foo[35] = "e";
    assign foo[36] = "n";
    assign foo[37] = "t";
    assign foo[38] = "e";
    assign foo[39] = "r";
    assign foo[40] = " ";
    assign foo[41] = "a";
    assign foo[42] = " ";
    assign foo[43] = "m";
    assign foo[44] = "o";
    assign foo[45] = "d";
    assign foo[46] = "e";
    assign foo[47] = ":";
    always @(posedge(CLK ))begin
        CLK50MHZ<=~CLK50MHZ;
    end
    //parameter [91:0] WELCOME_STR = "Hello EC551. My name is Test.\nPlease enter a mode:"; 
    /*always @(posedge(CLK100MHZ))begin
        CLK50MHZ<=~CLK50MHZ;
    end*/
   // reg clk = 0;
   // initial begin 
   //     clk = 0;
   //     #10 clk = ~clk;
   // end
 /*   PS2Receiver keyboard (
        .clk(CLK),
        .kclk(PS2_CLK),
        .kdata(PS2_DATA),
        .keycodeout(keycode[31:0])
    );*/
    
    UART_TX_CTRL tx(.SEND(uartSend),.DATA(uartData),.CLK(CLK),.READY(uartRdy),.UART_TX(uartTX));
	always @(posedge  CLK) begin
		if ( uartRdy == 1) begin
		   if (strIndex <= 8'd47) begin
		      uartSend <= 1;
			  uartData <= foo[strIndex];
			  strIndex <= strIndex + 1;
		   end else if (strIndex > 8'd47)begin
			  uartSend <= 0;
		end
	end
end
assign UART_RXD_OUT = uartTX;
endmodule
