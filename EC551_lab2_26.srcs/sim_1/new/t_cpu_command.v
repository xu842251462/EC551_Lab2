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
    reg  [127:0]buffer;
    reg  buffer_valid;
    
    wire [111:0] cpu_reg;
    wire cpu_reg_valid;
    
    reg clk;
    reg rst;
    
    

    
    CpuCommand uut(
         .buffer(buffer),
         .buffer_valid(buffer_valid),
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
        buffer = 128'd0;
        buffer_valid = 0;
    end
    
    initial 
         begin
//            #10
//            buffer = 128'h9000;
//            buffer_valid = 1;
////            buffer[127:120] = "r";
//            rst = 0;
           
            #10
            buffer[119:112] = "9";
            buffer[111:104] = 8'h0;
            buffer[103:96]  = 8'h4;
            buffer[95:88]   = 8'h1;
//            buffer[119:112] = 8'h39;
//            buffer[111:104] = 8'h30;
//            buffer[103:96]  = 8'h30;
//            buffer[95:88]   = 8'h30;
            buffer_valid = 1;
            buffer[127:120] = "r";
            rst = 0;
            
//             #10
//            buffer = 128'ha081;
//            buffer_valid = 1;
//            buffer[127:120] = "r";
//            rst = 0;
            
            
            #100 $finish;
        end
        
endmodule
