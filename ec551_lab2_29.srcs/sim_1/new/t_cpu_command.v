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
    
    
    wire [15:0] hex_decode;
    wire [11:0] mem_addr;  //from memory, save value 
    wire [15:0] mem_data;  //from memory, save value 
    wire        mem_valid; //from memory, save value 
    
    CpuCommand uut(
         .buffer(buffer),
         .buffer_valid(buffer_valid),
         .cpu_reg(cpu_reg),
         .cpu_reg_valid(cpu_reg_valid),
         .clk(clk),
         .rst(rst),
         
         .hex_decode(hex_decode),
         .mem_addr(mem_addr),  
         .mem_data(mem_data),  
         .mem_valid(mem_valid)
  
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
    
    always@(clk) 
         begin
           
            #10
            rst = 0;
            buffer[127:120] = "9";
            buffer[119:112] = "0";
            buffer[111:104] = "4";
            buffer[103:96]  = "1";
            buffer[95:88]   = "r";
//            buffer[119:112] = 8'h39;
//            buffer[111:104] = 8'h30;
//            buffer[103:96]  = 8'h30;
//            buffer[95:88]   = 8'h30;
            buffer_valid = 1;
            

            
            
            
            #100 $finish;
        end
        
endmodule
