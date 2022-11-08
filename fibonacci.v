`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2022 05:27:07 AM
// Design Name: 
// Module Name: fibonacci
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


module fibonacci(
    input [31:0] data,
    output reg [31:0] result
    );
    reg clk;
    initial begin 
        forever begin
        clk = 0;
        #10 clk = ~clk;
    end end
    reg [31:0] i;
    reg [31:0] j;
    reg [31:0] k;
    reg [31:0] s;
    //reg [31:0] data = 32'b1000;
    initial begin
        s = 32'b0;
        i = 32'b0;        
        j = 32'b1;
        k = 32'b10;
    end
    
    always @(posedge clk) begin
       if (data == 32'b0) begin
            result = 32'b0;
        end else if(data == 32'b1) begin
            result = 32'b1;
        end else begin
            if ( k < data + 1) begin
                k = k + 1;
                s = i + j;
                i = j;
                j = s;
                result = s;
            end
        end
    end
endmodule
