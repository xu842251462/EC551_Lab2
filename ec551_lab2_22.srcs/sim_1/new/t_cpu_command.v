`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2022 10:11:17 PM
// Design Name: 
// Module Name: t_cpu_command
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


module t_cpu_command(

    );
    reg [127:0]buffer;
    reg buffer_valid;
    
    wire [31:0]print_data;
    wire print_valid;
    
    reg clk;
    reg rst;
    
    CpuCommand uut(
         .buffer(buffer),
         .buffer_valid(buffer_valid),
         .print_data(print_data),
         .print_valid(print_valid),
         .clk(clk),
         .rst(rst)
    );
    
    always begin
        #1 clk = ~clk;
    end 
    
    initial begin
        clk = 0;
        rst = 0;
        buffer = 128'd0;
        buffer_valid = 0;
    end
    
    always@(clk) 
         begin
            #10
            buffer = 128'd18;
            buffer_valid = 1;

            #10
            buffer = 128'd25;
            buffer_valid = 1;
            
            #100 $finish;
        end
        
endmodule
