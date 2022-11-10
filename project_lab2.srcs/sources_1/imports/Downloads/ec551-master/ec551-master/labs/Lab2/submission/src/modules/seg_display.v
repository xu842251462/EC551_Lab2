`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: BU
// Engineer: Josh Wildey
// 
// Create Date:    17:06:56 02/25/2018
// Module Name:    seg_display 
// Project Name: Lab 1 - ALU and Microprocessor Design and implementation
// Target Devices: Nexys3 Spartan 6
// Revision 0.01 - File Created
// Description: 
//
// This file updates the 7 segment display on the Nexys3
//
//////////////////////////////////////////////////////////////////////////////////
module seg_display(
//   input  wire        clk,   // Should be 100 MHz (10 ns)
//   input  wire [15:0] value, // 16 bit value to be displayed
//   output reg  [7:0]  seg,
//   output reg  [3:0]  an
//   );

//	// Clock Variables
//	reg [13:0] counter;
//	reg clk_seg;
	
//	// Digit to update
//	reg [1:0] digit;
	 
	
//	// Divide the clock to 10kHz
//	// After experimentation, this rate made the 7 Segment LEDs look best
//	always @ (posedge clk) begin
//		if (counter == 10000) begin
//			counter <= 0;
//			clk_seg <= !clk_seg;
//		end else begin
//			counter <= counter + 1'b1;
//		end
//	end

//	always @ (posedge clk_seg) begin
//		digit = digit + 1'b1;
//		if (digit == 0) begin
//			an = 4'b0111;
//			display_digit(value[15:12]);
//		end else if (digit == 1) begin
//			an = 4'b1011;
//			display_digit(value[11:8]);
//		end else if (digit == 2) begin
//			an = 4'b1101;
//			display_digit(value[7:4]);
//		end else begin
//			an = 4'b1110;	
//			display_digit(value[3:0]);
//		end
//	end
	
//	task display_digit;
//		input [3:0] d;
//		begin
//			case (d)
//				0:  seg <= 8'b11000000;
//                1:  seg <= 8'b11111001;
//                2:  seg <= 8'b10100100;
//                3:  seg <= 8'b10110000;
//                4:  seg <= 8'b10011001;
//                5:  seg <= 8'b10010010;
//                6:  seg <= 8'b10000010;
//                7:  seg <= 8'b11111000;
//                8:  seg <= 8'b10000000;
//				9:  seg <= 8'b10010000;
//				10: seg <= 8'b10001000;  // A
//				11: seg <= 8'b00000000;  // B
//				12: seg <= 8'b11000110;  // C
//				13: seg <= 8'b01000000;  // D
//				14: seg <= 8'b10000110;  // E
//				15: seg <= 8'b10001110;  // F
//			endcase
//		end
//	endtask
 input [31:0] x,
    input clk,
    output reg [6:0] seg,
    output reg [7:0] an,
    output wire dp 
	 );
	 
	 
wire [2:0] s;	 
reg [3:0] digit;
wire [7:0] aen;
reg [19:0] clkdiv;

assign dp = 1;
assign s = clkdiv[19:17];
assign aen = 8'b11111111; // all turned off initially

// quad 4to1 MUX.


always @(posedge clk)// or posedge clr)
	
	case(s)
	0:digit = x[3:0]; // s is 00 -->0 ;  digit gets assigned 4 bit value assigned to x[3:0]
	1:digit = x[7:4]; // s is 01 -->1 ;  digit gets assigned 4 bit value assigned to x[7:4]
	2:digit = x[11:8]; // s is 10 -->2 ;  digit gets assigned 4 bit value assigned to x[11:8
	3:digit = x[15:12]; // s is 11 -->3 ;  digit gets assigned 4 bit value assigned to x[15:12]
	4:digit = x[19:16]; // s is 00 -->0 ;  digit gets assigned 4 bit value assigned to x[3:0]
    5:digit = x[23:20]; // s is 01 -->1 ;  digit gets assigned 4 bit value assigned to x[7:4]
    6:digit = x[27:24]; // s is 10 -->2 ;  digit gets assigned 4 bit value assigned to x[11:8
    7:digit = x[31:28]; // s is 11 -->3 ;  digit gets assigned 4 bit value assigned to x[15:12]

	default:digit = x[3:0];
	
	endcase
	
	//decoder or truth-table for 7seg display values
	always @(*)

case(digit)


//////////<---MSB-LSB<---
//////////////gfedcba////////////////////////////////////////////           a
0:seg = 7'b1000000;////0000												   __					
1:seg = 7'b1111001;////0001												f/	  /b
2:seg = 7'b0100100;////0010												  g
//                                                                       __	
3:seg = 7'b0110000;////0011										 	 e /   /c
4:seg = 7'b0011001;////0100										       __
5:seg = 7'b0010010;////0101                                            d  
6:seg = 7'b0000010;////0110
7:seg = 7'b1111000;////0111
8:seg = 7'b0000000;////1000
9:seg = 7'b0010000;////1001
'hA:seg = 7'b0001000; 
'hB:seg = 7'b0000011; 
'hC:seg = 7'b1000110;
'hD:seg = 7'b0100001;
'hE:seg = 7'b0000110;
'hF:seg = 7'b0001110;

default: seg = 7'b0000000; // U

endcase


always @(*)begin
an=8'b11111111;
if(aen[s] == 1)
an[s] = 0;
end


//clkdiv

always @(posedge clk) begin
clkdiv <= clkdiv+1;
end

endmodule
