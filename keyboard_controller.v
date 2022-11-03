`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2022 03:51:40 PM
// Design Name: 
// Module Name: keyboard_controller
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


module keyboard_controller(
    input wire clk,
    input wire data,
    output reg [7:0]key,
    output reg shift
    );
    reg [7:0] data_curr; 
	reg [7:0] data_pre;
	reg [7:0] key_pre;
	reg [3:0] b; 
	reg flag; // 
	reg caps_lock;
	
    kb_code_ascii_convert kcac(
        .kb_code(key_pre),
		.caps_lock(caps_lock),
		.shift(shift),
		.ascii(key));
		
    initial begin
        b <= 4'b0;
        flag <= 1'b0;
        flag<=1'b0; 
		data_curr<=8'hf0; 
		data_pre<=8'hf0; 
		key_pre<=8'hf0; 
		shift<=1'b0;
    end
    
    always@(negedge clk)begin //activate from keyboard
        case(b)
            1: ;
            2: data_curr[0] <= data;
            3: data_curr[1] <= data;
            4:data_curr[2]<=data; 
            5:data_curr[3]<=data; 
            6:data_curr[4]<=data; 
            7:data_curr[5]<=data; 
            8:data_curr[6]<=data; 
            9:data_curr[7]<=data; 
            10:flag <= 1'b1; // parity
            11:flag <= 1'b0; //stop
         endcase
    
    
            if (b <= 10) b <= b + 1;
            else if (b == 11) b <= 1;
    end
    
    // getting data fron led
    always@(posedge clk)begin
        if (data_curr == 8'h12 || data_curr == 8'h59) begin
            shift <= 1'b1;
        end else if (data_curr == 8'hf0)begin
            key_pre <= data_pre;
            if (shift == 1'b1) shift <= 1'b0;
        end else begin
            data_pre <= data_curr;
        end
    end
endmodule
