`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2022 12:11:01 AM
// Design Name: 
// Module Name: t_decoder
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


module t_decoder(

    );
    reg [15:0] instruction;
    reg clk;
    reg rst;
	
	wire [15:0] imm_a;
	wire [ 2:0] reg_a;
	wire [ 1:0] a_sel;
    
	wire [15:0] imm_b;
	wire [ 2:0] reg_b;
	wire [ 1:0] b_sel;
   
	wire [ 3:0] alu_op;
  
	wire [ 2:0] reg_w;
	wire        reg_w_en;
	wire        mem_w_en;
	wire        cmp_write;
	
	wire [ 2:0] pc_sel;
	wire [15:0] jump_target;
    
    
    Idecode uut(
	   .instruction(instruction),
	   .imm_a(imm_a),
	   .reg_a(reg_a),
	   .a_sel(a_sel),
	   .imm_b(imm_b),
	   .reg_b(reg_b),
	   .b_sel(b_sel),
	   .alu_op(alu_op),
	   .reg_w(reg_w),
	   .reg_w_en(reg_w_en),
	   .mem_w_en(mem_w_en),
	   .cmp_write(cmp_write),
	   .pc_sel(pc_sel),
	   .jump_target(jump_target),
	   .clk(clk),
	   .rst(rst)
    );
    
    initial begin
		clk = 1;
		forever #5 clk = ~clk;
	end
	
	always@(instruction, clk)
	   begin
	       #10 instruction = 16'b1001000000000000;
	       #10 instruction = 16'b1001000001000001;
	       #10 instruction = 16'b1010000010000001;
	       #10 instruction = 16'b0000000000000000;
	       #10 
	       #10 instruction = 16'b1001000011000011;
	       #10 instruction = 16'b1001000101000101;
	       #10 instruction = 16'b1001000100000100;
	       #10 instruction = 16'b0111000100000100;
	       #10 instruction = 16'b0001000000000100;
	       #10 instruction = 16'b0110000011000100;
	       #10 instruction = 16'b0111000101000011;
	       #10 instruction = 16'b0000000000000000;
	   
	       #300 $finish;
	   end
    
endmodule
