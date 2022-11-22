`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2022 12:05:36 AM
// Design Name: 
// Module Name: t_alu
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

`define OP_NOP   4'b0000
`define OP_ADD   4'b0001
`define OP_SUB   4'b0010
`define OP_INC   4'b0011
`define OP_XOR   4'b0100
`define OP_CMP   4'b0101
`define OP_SADD  4'b0110
`define OP_SSUB  4'b0111
`define OP_SMULT 4'b1000
`define OP_SDIV  4'b1001
`define OP_A     4'b1010
`define OP_B     4'b1011

module t_alu(

    );
    reg [15:0] a;
	reg [15:0] b;
	reg [3:0] op;

	wire [15:0] out;

	reg clk;
	reg rst;
	
	Alu uut(
		.a_data(a),
		.b_data(b),
		.alu_op(op),
		.out(out),
		.clk(clk),
		.rst(rst)
	);

	initial begin
		clk = 1;
		forever #5 clk = ~clk;
	end

	initial begin
		rst = 1;
		#10 rst = 0;
	end

	initial begin
		a <= 0;
		b <= 0;
		op <= 0;
	end

	initial begin
		
		#10;
		a <= 7; b <= 5; op <= `OP_NOP;
		#10; op <= `OP_ADD;
		#10; op <= `OP_SUB;
		#10; op <= `OP_INC;
		#10; op <= `OP_XOR;
		#10; op <= `OP_CMP;
		#10; a <= 5; b <= 7;
		#10; op <= `OP_SADD;
		#10; op <= `OP_SSUB; a <= 7; b <= 5;
		#10; op <= `OP_SMULT;
		#10; op <= `OP_SDIV; a <= -75;
		#30; $finish;
	end
endmodule
