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

//connecting to the intro_part, which includes I, A, B module
`define INTRO_ENTER_CPU     3'b000
`define INTRO_ENTER_ALU     3'b001
`define INTRO_ENTER_BENCH   3'b010
`define INTRO_PRINT_INVALID 3'b011

module top(
    input wire CLK ,
    input PS2_CLK,
    input PS2_DATA,
   /* output [6:0]SEG,
    output [7:0]AN,
    output DP,*/
    output  UART_RXD_OUT
    );
    reg CLK50MHZ = 0; 
    reg  caps_lock;
    reg shift;
    wire [31:0]keycode;
    reg [7:0] uartData;
    wire  uartRdy;
    wire  uartTX ;
    wire [7:0] converted;
    reg [7:0] temp = 8'h03;
    reg  uartSend = 1;
    reg  [31:0] strIndex = 4'd0;
    reg [2:0] state = `STRING_INTRO;
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

   // reg clk = 0;
   // initial begin 
   //     clk = 0;
   //     #10 clk = ~clk;
   // end
    PS2Receiver keyboard (
        .clk(CLK50MHZ),
        .kclk(PS2_CLK),
        .kdata(PS2_DATA),
        .keycodeout(keycode[31:0])
    );
    kb_code_ascii_convert key (.kb_code(keycode[7:0]),.caps_lock(caps_lock),.shift(shift),.ascii(converted));
    UART_TX_CTRL tx(.SEND(uartSend),.DATA(uartData),.CLK(CLK),.READY(uartRdy),.UART_TX(uartTX));
	always @(posedge  CLK) begin
	   case(state)
		  `STRING_INTRO: if ( uartRdy == 1) begin
		                      if (strIndex <= 8'd47) begin
		                          uartSend <= 1;
                                  uartData <= foo[strIndex];
			                      strIndex <= strIndex + 1;
		                      end else if (strIndex > 8'd47)begin
			                      uartSend <= 0;
			                      state <= `STRING_NONE;
			                  end
			              end
		`STRING_NONE: if ( uartRdy == 1) begin
		                     uartSend <= 1; 
		                     uartData <= converted; 
			          end else begin
			                 uartSend <= 0;
                             uartData <= 8'h03; 
			               end
		endcase
end
assign UART_RXD_OUT = uartTX;
endmodule
