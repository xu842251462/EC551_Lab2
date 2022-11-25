`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2022 05:04:53 PM
// Design Name: 
// Module Name: binTObcd_cpu
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


module binTObcd_cpu(

    input      [111:0] bin,
    output wire [111:0] bcd
   );
   wire inputA;
   
   assign inputA = bin[15:0] +
                   bin[31:16] * 10 +
                   bin[47:32] * 100 +
                   bin[63:48] * 1000 +
                   bin[79:64] * 10000 +
                   bin[95:80] * 100000;
    
   assign bcd[15:0]  =  inputA % 10;            // digit 0, ones place
   assign bcd[31:16] = (inputA / 10) % 10;     // digit 1, tens place
   assign bcd[47:32] = (inputA / 100) % 10;   // digit 2, hundreds place
   assign bcd[63:48] = (inputA / 1000) % 10; // digit 3, thousands place
   assign bcd[79:64] = (inputA / 10000) % 10;
   assign bcd[95:80] = (inputA / 100000) % 10;
      
    
endmodule
