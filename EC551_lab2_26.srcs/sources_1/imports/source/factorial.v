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
    input  wire [13:0] data,
    output wire [31:0] number
    );
    
   /* reg clk;
    initial begin 
        forever begin
        clk = 0;
        #10 clk = ~clk;
    end end*/
    
    reg [13:0] result;
    reg [13:0] i = 1;
    wire [15:0] dec;
    reg [13:0] final;
    initial begin        
        i = 14'b0;
        result = 14'b1;
    end
    
    bintobcd t(
        .bin(final), //in
        .bcd(dec) //out
    );
   
    introduction_part ip(
        .clk(clk), //in
        .bcd(dec), //in
        .command(number) //out
    );
   
    always @(posedge clk) begin
        if (data == 0) result <= 1;
        else begin
          if (i < data) begin
            i = i + 1;
            result = i * result;
        end else begin
            final = result;
        end
    end
   end
    
endmodule