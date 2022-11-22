`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2022 11:19:18 PM
// Design Name: 
// Module Name: introduction_part
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


module introduction_part(
         input clk,
         input [15:0] bcd,
        output reg [31:0] command 
    );
   /* reg clk;
    initial begin 
        forever begin
        clk = 0;
        #10 clk = ~clk;*/
   // end end
  /* wire [15:0] result = 16'b0001000101011001;
   reg [31:0] command = 0;*/
    reg [1:0] index = 0;
    reg [7:0] temp = 0;
    reg [7:0] temp1 = 0;
    reg [7:0] temp2 = 0;
    reg [7:0] temp3 = 0;
    integer i;

       always @(posedge clk) begin
     
            temp <= {{4'b0},bcd[3:0]} + 8'h30;
            temp1 <= {{4'b0},bcd[7:4]} + 8'h30;
            temp2 <= {{4'b0},bcd[11:8]} + 8'h30;
            temp3 <= {{4'b0},bcd[15:12]} + 8'h30;
            command <= {temp,temp1,temp2,temp3};
       end
endmodule
