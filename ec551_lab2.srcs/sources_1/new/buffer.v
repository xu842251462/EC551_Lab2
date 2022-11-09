`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2022 11:19:23 PM
// Design Name: 
// Module Name: buffer
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

//this buffer is used for uart_tx, buffer input data and send them to UART
module buffer(
        input  wire [7:0] byte_in,
        input  wire       in_valid,

        output reg  [7:0] byte_out,
        input  wire       out_advance,
        output reg        out_ready,

        input wire clk,
        input wire rst
    );

    reg [9:0] write_addr;
    reg [9:0] read_addr;
    reg [7:0] buffer [1023:0];

    reg out_advance_delay;
	 
	 reg send_newline; // Godammit putty, godammit windows

    always @(posedge clk) begin
        if (rst) begin
            write_addr <= 0;
        end else if (in_valid) begin
            write_addr <= write_addr + 1;
            buffer[write_addr] <= byte_in;
        end
    end

    always @(posedge clk) begin
        if (rst) begin
            read_addr <= 0;
				send_newline <= 0;
        end else if (out_advance && !out_advance_delay) begin
		      if (read_addr != write_addr) begin
				    if (!send_newline) begin
				        read_addr <= read_addr + 1;
					 end
				end
				send_newline <= (byte_out == 8'b00001101);
        end
		  
		  if (send_newline) begin
		      byte_out <= 8'b00001010;
		  end else begin
		      byte_out <= buffer[read_addr];
		  end
    end

    always @(posedge clk) begin
        out_ready <= ((send_newline || (write_addr != read_addr)) && !out_advance);
    end

    always @(posedge clk) begin
        out_advance_delay <= out_advance;
    end
    

endmodule
