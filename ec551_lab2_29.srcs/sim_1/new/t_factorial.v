`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2022 10:54:24 PM
// Design Name: 
// Module Name: t_factorial
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


module t_factorial(

    );
    
    reg clk;
    reg [13:0] data;
    wire [31:0] number;
    
    factorial uut(
       .clk(clk),
       .data(data),
       .number(number)
    );
    
    initial begin
		clk = 1;
		forever #5 clk = ~clk;
	end
	
	initial begin
	
	    #10
	    data = 14'd6;
	    	    
	    #100 $finish;
	    
	end
    
    
endmodule
