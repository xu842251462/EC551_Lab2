`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2022 10:55:17 PM
// Design Name: 
// Module Name: memory
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


module memory(
    input  wire [11:0] r_addr,
	output reg  [15:0] r_data,

	input  wire [11:0] w_addr,
	input  wire [15:0] w_data,
	input  wire        w_en,

	input  wire [11:0] pc,
	output reg  [15:0] inst,

    input  wire [11:0] w_addr_b,
	input  wire [15:0] w_data_b,
	input  wire        w_en_b,

	input  wire        clk, 
	input  wire        rst
    );
    reg [15:0] memory[4095:0];
	
	wire [11:0] write_address;
	wire [15:0] write_data;
	wire write_en;
	
	
endmodule
