`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2022 04:52:28 PM
// Design Name: 
// Module Name: internal_process
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


module internal_process(

    );
    
    printer pt(); //connecting to printer which is printing something on terminal
    state_machine sma(); // 
    keyboard_buffer kb(); // connecting the keyword input from the top_module
    introduction_part ip();//connecting the beginning screen showing the 'EC551'
    alu_part ap(); //connecting the alu 
    cpu_part cp(); //connecting the CPU from lab1
    bench_part bp(); // for connecting martix mutiplication
    
endmodule
