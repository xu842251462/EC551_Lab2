`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2022 10:22:57 PM
// Design Name: 
// Module Name: t_memory
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


module t_memory(

    );
    
    // Inputs
	reg clk;
	reg rst;
	reg w_en;
	reg [11:0] pc;
	reg [11:0] w_addr;
	reg [15:0] w_data;
    
    reg [11:0] w_addr_b;
	reg [15:0] w_data_b;
	reg        w_en_b;
	
    reg [11:0] r_addr;
	// Outputs
	wire  [15:0] inst;
	wire  [15:0] r_data;

	// Instantiate the Unit Under Test (UUT)
	Memory uut (
	    .inst(inst),
	    .r_data(r_data),
	    
	    .pc(pc),
        .r_addr(r_addr), 
        .clk(clk), 
        .rst(rst), 
        
        .w_en(w_en), 
        .w_addr(w_addr),
        .w_data(w_data), 
        
        .w_addr_b(w_addr_b), 
        .w_data_b(w_data_b), 
        .w_en_b(w_en_b)
	);

	always begin
        #1 clk = ~clk;
    end 
    
    initial begin
        // Initialize Inputs
            clk = 0;
            rst = 0;
            w_en = 0;
            w_addr = 0;
            w_data = 0;
            //new variable
            w_addr_b = 0;
            w_data_b = 0;
            w_en_b = 0;
            
            pc = 0;
            r_addr = 0;
    end
    
    always@(clk) 
         begin
            #10
            w_en = 0;
            w_addr = 12'd1;
            w_data = 16'd110;
            //new variable
            w_addr_b = 12'd1;
            w_data_b = 16'b1001000011000011;
            w_en_b = 1;
            
            pc = 12'd1;
            r_addr = 12'd1;
            
           
            #10
            w_en = 0;
            w_addr = 12'd2;
            w_data = 16'd11011;
            //new variable
            w_addr_b = 12'd2;
            w_data_b = 16'b1001000101000101;
            w_en_b = 1;
            
            pc = 12'd2;
            r_addr = 12'd2;
            
            #100 $finish;
            
        end
        
endmodule
