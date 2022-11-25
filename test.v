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
    output reg [111:0] bcd
   );
//   wire inputA;
   
//   assign inputA = bin[15:0] +
//                   bin[31:16] * 10 +
//                   bin[47:32] * 100 +
//                   bin[63:48] * 1000 +
//                   bin[79:64] * 10000 +
//                   bin[95:80] * 100000;
    
//   assign bcd[15:0]  =  inputA % 10;            // digit 0, ones place
//   assign bcd[31:16] = (inputA / 10) % 10;     // digit 1, tens place
//   assign bcd[47:32] = (inputA / 100) % 10;   // digit 2, hundreds place
//   assign bcd[63:48] = (inputA / 1000) % 10; // digit 3, thousands place
//   assign bcd[79:64] = (inputA / 10000) % 10;
//   assign bcd[95:80] = (inputA / 100000) % 10;
      
    integer i;
        
    always @(bin) begin
        bcd=0;		 	
        for (i=0;i<110;i=i+1) begin					//Iterate once for each bit in input number
            if (bcd[15:0]  >= 17) bcd[15:0]  = bcd[15:0]  + 3;		//If any BCD digit is >= 5, add three
            if (bcd[31:16] >= 17) bcd[31:16] = bcd[31:16] + 3;
            if (bcd[47:32] >= 17) bcd[47:32] = bcd[47:32] + 3;
            if (bcd[63:48] >= 17) bcd[63:48] = bcd[63:48] + 3;
            if (bcd[79:64] >= 17) bcd[79:64] = bcd[79:64] + 3;
            if (bcd[95:80] >= 17) bcd[95:80] = bcd[95:80] + 3;
            bcd = {bcd[110:0],bin[109 - i]};				//Shift one bit, and shift in proper bit from input 
        end
    end
endmodule
