`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2022 03:15:48 PM
// Design Name: 
// Module Name: t_internal_processing
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


module t_internal_processing(

    );
    
    reg [7:0] key_in;
    reg key_valid;

    wire [111:0] cpu_reg;
    wire cpu_reg_valid;

    reg clk;
    reg rst;
    
    internal_processing uut(
        .key_in(key_in),
        .key_valid(key_valid),
        
        .cpu_reg(cpu_reg),
        .cpu_reg_valid(cpu_reg_valid),
        
        .clk(clk),
        .rst(rst)
    );
    
    always begin
        #1 clk = ~clk;
    end 
    
    initial begin
        clk = 0;
        rst = 1;
        key_in = 8'h0;
        key_valid = 0;
    end
    
    initial
        begin
            #10
            rst = 0;
            key_in = "9";
            key_valid = 1;
            
            #10
            rst = 0;
            key_in = "0";
            key_valid = 1;
            
            #10
            rst = 0;
            key_in = 8'h34;
            key_valid = 1;
            
            #10
            rst = 0;
            key_in = 8'h31;
            key_valid = 1;
            
//            #10
//            rst = 0;
//            key_in = 8'h0A; //press enter
//            key_valid = 1;
            
            #10
            rst = 0;
            key_in = "r"; //enter 'r'
            key_valid = 1;

            
            #200 $finish;
        end
    
endmodule
