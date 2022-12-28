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


module binTObcd(

    input      [13:0] bin,
    output reg [15:0] bcd
   );

      
   /* integer i;

    
    always @(bin) begin
        bcd=0;		 	
        for (i=0;i<14;i=i+1) begin					//Iterate once for each bit in input number
            if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;		//If any BCD digit is >= 5, add three
            if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
            if (bcd[11:8] >= 5) bcd[11:8] = bcd[11:8] + 3;
            if (bcd[15:12] >= 5) bcd[15:12] = bcd[15:12] + 3;
            bcd = {bcd[14:0],bin[13-i]};				//Shift one bit, and shift in proper bit from input 
        end
    end*/
    integer i;
        
    always @(bin) begin
        bcd=0;		 	
        for (i=0; i<112; i=i+1) begin					//Iterate once for each bit in input number
            if (bin[i] <= 9 && bin[i] >= 0) begin
                bcd[i] = bin[i];
            end else if (bin[i] == "a") begin
                bcd[i] = 0;
            end else if (bin[i] == "b") begin
                bcd[i] = 1;
            end else if (bin[i] == "c") begin
                bcd[i] = 2;
            end else if (bin[i] == "d") begin
                bcd[i] = 3;
            end else if (bin[i] == "e") begin
                bcd[i] = 4;
            end else if (bin[i] == "f") begin
                bcd[i] = 5;
            end 
        end
    end
endmodule