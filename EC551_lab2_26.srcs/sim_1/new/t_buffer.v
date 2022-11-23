`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2022 03:16:17 PM
// Design Name: 
// Module Name: t_buffer
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


module t_buffer(

    );
    wire  [127:0] buffer_out;
    wire  buffer_valid;
    
    reg   [7:0] key;
    reg   key_valid;
    reg   clk;
    reg   rst;
    
    KbBuffer uut(
        .key(key),
        .key_valid(key_valid),
        .buffer_out(buffer_out),
        .buffer_valid(buffer_valid),
        .clk(clk),
        .rst(rst)
    );
    
    always begin
        #1 clk = ~clk;
    end 
    
    initial begin
        clk = 0;
        rst = 1;
        key = 8'h42;
        key_valid = 0;
    end
    
    always@(clk)
        begin
            #10
            rst = 0;
            key = 8'h21;
            key_valid = 1;
            
            #10
            key = 8'h0A;
            
            #100 $finish;
        end
    
endmodule
