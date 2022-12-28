`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2022 11:56:38 PM
// Design Name: 
// Module Name: t_cpu
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


module t_cpu(

    );
    wire [111:0] regexpose;
    wire done;
    
    reg [11:0] memhack_addr;
    reg [15:0] memhack_data;
    reg        memhack_valid;
	reg clk;
	reg rst;
    
    
    wire [15:0] pc; //pass pc counter to reg_file/memory
	wire [15:0] pc_next;
	wire         cmp_eq;
    
	wire [15:0] instruction;
    
	wire [15:0] imm_a;
	wire [ 2:0] reg_src_a;
	wire [ 1:0] a_sel;
	wire [15:0] a_reg_out;
	wire [15:0] a_data;
    
	wire [15:0] imm_b;
	wire [ 2:0] reg_src_b;
	wire [ 1:0] b_sel;
	wire [15:0] b_reg_out;
	wire [15:0] b_data;
    
	wire [ 3:0] alu_op;
	wire [15:0] alu_out;
    
	wire [ 2:0] reg_w;
	wire        reg_w_en;
    
	wire        mem_w_en;
	wire [15:0] mem_w_data;
	wire [15:0] mem_r_data;
    
	wire        cmp_write;
    
	wire [ 2:0] pc_sel;
	wire [15:0] jump_target;
    
    
    Cpu uut(
	   .regexpose(regexpose),
       .done(done),
       .memhack_addr(memhack_addr),
       .memhack_data(memhack_data),
       .memhack_valid(memhack_valid),
	   .clk(clk),
	   .rst(rst),
	   
	   
	   .pc(pc), //pass pc
       .pc_next(pc_next),     
       .cmp_eq(cmp_eq),      
       .instruction(instruction),   
       .imm_a(imm_a),       
       .reg_src_a(reg_src_a),   
       .a_sel(a_sel),       
       .a_reg_out(a_reg_out),   
       .a_data(a_data),          
       .imm_b(imm_b),       
       .reg_src_b(reg_src_b),   
       .b_sel(b_sel),       
       .b_reg_out(b_reg_out),   
       .b_data(b_data),          
       .alu_op(alu_op),      
       .alu_out(alu_out),     
       .reg_w(reg_w),       
       .reg_w_en(reg_w_en),    
            
       .mem_w_en(mem_w_en),    
       .mem_w_data(mem_w_data),  
       .mem_r_data(mem_r_data),  
              
       .cmp_write(cmp_write),   
       .pc_sel(pc_sel),      
       .jump_target(jump_target)  
    );
    
    initial begin
		clk = 1;
		forever #5 clk = ~clk;
	end
	
	initial begin
	    rst = 1;
	    memhack_addr = 12'b0; 
        memhack_data = 16'b0; 
        memhack_valid = 0;
	end
	
	always@(clk)
	   begin
	        #10
	        memhack_addr = 12'd31; 
            memhack_data = 16'b1001000000000000; 
//            memhack_data = 16'hfbbb; 
            memhack_valid = 1;
            rst = 0;
            
            #10
	        memhack_addr = 12'd32; 
            memhack_data = 16'b1001000001000001; 
//            memhack_data = 16'h5678; 
            memhack_valid = 1;
//            rst = 0;
            
            #10
	        memhack_addr = 12'd33; 
            memhack_data = 16'b1010000010000001; 
//            memhack_data = 16'h4567; 
            memhack_valid = 1;
//            rst = 0;
            
            #10
	        memhack_addr = 12'd34; 
            memhack_data = 16'b1001000011000011; 
            memhack_valid = 1;
//            rst = 0;
            
            #200 $finish;
	   end
	
endmodule
