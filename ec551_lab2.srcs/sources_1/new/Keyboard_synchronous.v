`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2022 06:10:24 PM
// Design Name: 
// Module Name: Keyboard_synchronous
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

`define KEY_LINEFEED 8'b00001101
module Keyboard_synchronous(
        input  wire [  7:0] key,
        input  wire         key_valid,
        output reg  [127:0] synchronous_out,
        output reg          synchronous_valid,

        input wire          clk,
        input wire          rst
    );
    integer ii;

    reg [3:0] buffer_pos;
    reg [7:0] buffer [15:0];

    always @(posedge clk) begin
        if (rst) begin
            for (ii=0; ii<16; ii=ii+1) begin
                buffer[ii] <= 0;
            end

            synchronous_valid <= 0;
            buffer_pos <= 0;
        end else if (key_valid) begin
            if (key == `KEY_LINEFEED) begin
                buffer_pos <= 0;
                synchronous_valid <= 1;
                synchronous_out <= {buffer[0], buffer[1], buffer[2], buffer[3],
                               buffer[4], buffer[5], buffer[6], buffer[7],
                               buffer[8], buffer[9], buffer[10], buffer[11],
                               buffer[12], buffer[13], buffer[14], buffer[15]};
            end else begin
                buffer[buffer_pos] <= key;
                buffer_pos <= buffer_pos + 1;
                synchronous_valid <= 0;
            end
        end else begin
            synchronous_valid <= 0;
        end
    end
endmodule
