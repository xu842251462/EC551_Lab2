`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2022 12:09:09 AM
// Design Name: 
// Module Name: t_regfile
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


module t_regfile(

    );
    wire [15:0] a_data, b_data;
	reg  [ 2:0] a_sel,  b_sel;

	reg  [15:0] w_data;
	reg  [ 2:0] w_sel;
	reg         w_en;

	reg clk, rst;

	Regfile uut(
		.a_data(a_data),
		.a_sel (a_sel),
		
		.b_data(b_data),
		.b_sel(b_sel),

		.w_data(w_data),
		.w_sel (w_sel),
		.w_en  (w_en),

		.clk(clk),
		.rst(rst)
	);

	initial begin
		rst = 1;
		#10 rst = 0;
		#990 $finish;
	end

	initial begin
		clk = 1;
		forever #5 clk = ~clk;
	end

	initial begin
		a_sel  <= 0;
		b_sel  <= 0;
		w_sel  <= 0;
		w_data <= 0;
		w_en   <= 0;
	end

	initial begin
		
		#10;
		w_data <= 16'hf000; w_en <= 1; w_sel <= 1;
		a_sel <= 1;
		#10; 
		w_data <= 16'hfbbb; w_en <= 0; w_sel <= 1;
		b_sel <= 3;
		#10; 
		w_data <= 16'h5678; w_en <= 1; w_sel <= 5;
		#10; 
		w_data <= 16'h4567; w_en <= 1; w_sel <= 4;
		#10; 
		w_data <= 16'h3456; w_en <= 1; w_sel <= 3;
		#10; 
		w_data <= 16'h2345; w_en <= 1; w_sel <= 2;
		#10; 
		w_data <= 16'h1234; w_en <= 1; w_sel <= 1;
		#10; 
		w_data <= 16'h0123; w_en <= 1; w_sel <= 0;
		#10; 
		w_en <= 0;
		a_sel <= 0;
		b_sel <= 1;
		#10;
		a_sel <= 2;
		b_sel <= 3;
		#10;
		a_sel <= 4;
		b_sel <= 5;
		#10;
		a_sel <= 6;
		b_sel <= 7;
	end
endmodule
