`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2022 03:00:58 AM
// Design Name: 
// Module Name: factorial
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


module factorial(
    input  clk,
    input [31:0] data,
    output reg [31:0] result
    );
/*    reg clk;
    initial begin 
        forever begin
        clk = 0;
        #10 clk = ~clk;
    end end*/
    reg [31:0] i;
    initial begin        
        i = 32'b0;
        result = 32'b1;
    end
    
    always @(posedge clk) begin
       // i = i + 1;
        if (i < data) begin
            i = i + 1;
            result = i * result;
        end

    end
    
endmodule
