`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2022 09:45:23 PM
// Design Name: 
// Module Name: t_intro_command
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


module t_intro_command();
        wire option;
        wire option_validation;
        wire clk;
        wire rst;
        reg [2:0]command;
        reg command_validation;
        
        introduction_part uut(
        .option(option), 
        .option_validation(option_validation),
        .clk(clk),
        .rst(rst),
        .command(command),
        .command_validation(command_validation));
        
        
        initial
        begin
            clk = 0;
        end
        
        always@(*) 
            #5 clk <= ~clk;
        
        
        initial 
        begin
            #10 option = 8'h49;
            #300 $finish;
        end 
        
endmodule
