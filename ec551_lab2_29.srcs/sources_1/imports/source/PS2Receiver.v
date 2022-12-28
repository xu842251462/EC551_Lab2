`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2022 05:34:49 PM
// Design Name: 
// Module Name: PS2Receiver
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


module PS2Receiver(
    input clk,
    input kclk,
    input kdata,
    output [31:0] keycodeout
    );
    
    wire kclkf, kdataf;
    reg [7:0]datacur;
    reg [7:0]dataprev;
    reg [3:0]cnt;
    reg [31:0]keycode;
    reg flag;
    
    initial begin
        keycode[31:0]<=8'h00000000;
        cnt<=4'b0000;
        flag<=1'b0;
    end
    reg shift,caps_lock;
    debounce debounce(
        .clk(clk),
        .I0(kclk),
        .I1(kdata),
        .O0(kclkf),
        .O1(kdataf)
    );
    wire [7:0] key_pre;
    kb_code_ascii_convert convert (
		.kb_code(datacur),
		.caps_lock(caps_lock),
		.shift(shift),
		.ascii(key_pre)
	);
	
    always@(negedge(kclkf))begin
        case(cnt)
        0:;//Start bit
        1:datacur[0]<=kdataf;
        2:datacur[1]<=kdataf;
        3:datacur[2]<=kdataf;
        4:datacur[3]<=kdataf;
        5:datacur[4]<=kdataf;
        6:datacur[5]<=kdataf;
        7:datacur[6]<=kdataf;
        8:datacur[7]<=kdataf;
        9:flag<=1'b1;
        10:flag<=1'b0;
        
        endcase
            if(cnt<=9) cnt<=cnt+1;
            else if(cnt==10) cnt<=0;
            
    end
    
    always @(posedge flag)begin
            if (keycode[15:0] == 16'hE0FE) shift <= 1'b1;
            if (keycode[15:0] == 16'hF0FE) shift <= 1'b0;
            keycode[31:24]<=keycode[23:16];
            keycode[23:16]<=keycode[15:8];
            keycode[15:8]<=dataprev;
            keycode[7:0]<=key_pre;
            dataprev<=key_pre;
    end    
    assign keycodeout=keycode;
endmodule