`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2022 09:09:13 PM
// Design Name: 
// Module Name: internal_processing
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

module internal_processing(

        input wire [127:0] key_in,
        input wire key_valid,

        output wire [111:0] cpu_reg,
        output wire cpu_reg_valid,

        input wire clk,
        input wire rst
//        output wire [111:0] cpu_reg_preprocess
    );

 //   wire [127:0] buffer;
  //  wire buffer_valid;
  
 /*  KbBuffer ks (
        .key(key_in),
        .key_valid(key_valid),

        .buffer_out(buffer),
        .buffer_valid(buffer_valid),
        
        .clk(clk),
        .rst(rst)
    );*/
    
   // wire [111:0] cpu_reg_preprocess;
    
    CpuCommand ccommand (
        .buffer(key_in),
        .buffer_valid(key_valid),

        .cpu_reg(cpu_reg), //out, out of module
        .cpu_reg_valid(cpu_reg_valid),
        
        .clk(clk),
        .rst(rst)
    );
    
    

endmodule
