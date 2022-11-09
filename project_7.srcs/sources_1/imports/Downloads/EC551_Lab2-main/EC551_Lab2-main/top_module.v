`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2022 04:42:30 PM
// Design Name: 
// Module Name: top_module
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


module top_module(
    input wire clk_in,
    input wire PS2KeyboardData,
    input wire PS2KeyboardClk,
    output wire [7:0]seg,
    output wire [3:0]an,
    input  wire       RxD,             // UART RX Port
	output wire       TxD             // UART TX Port
    );

    // 7 Segment Display Variables
	seg_display sev_seg_display (
		.clk(clk_in),
		.value({rx_byte, key}),  // upper byte UART Rx, lower byte keyboard key
		.seg(seg),
		.an(an)
	);
    
   //via top_module, passing uart_buffer value to tx
//    buffer bu (
//        .byte_in(logic_char_data),
//        .in_valid(logic_char_valid),

//        .byte_out(uart_logic_tx_data),
//        .out_advance(tx_done),
//        .out_ready(uart_logic_tx_valid),

//        .clk(clk_in),
//        .rst(rst)
//    );
      UART_TX_CTRL utx(
         .SEND(logic_char_valid), 
         .DATA(logic_char_data), 
         .CLK(clk_in), 
         .READY(uart_logic_tx_valid), 
         .UART_TX(uart_logic_tx_data) 
        );
      
   // UART Receive
	wire       byte_rxed;
	reg  [7:0] rx_byte_pre;
	wire [7:0] rx_byte;
	uart_rx serial_rx(
		.clk(clk_in),
		.uart_data_in(RxD),
		.byte_rxed(byte_rxed),
		.rx_byte(rx_byte)
	);
	
		// UART Transmit
	reg       tx_wr_pre;
	reg       tx_wr;
	reg [7:0] tx_data;
	wire      tx_active;
	wire      tx_done;
	
	wire [7:0] uart_logic_tx_data;
    wire uart_logic_tx_valid;
    
	uart_tx serial_tx(
		.clk(clk_in),
		//.tx_wr(tx_wr),
		//.tx_byte(tx_data),
        .tx_wr(uart_logic_tx_valid),
        .tx_byte(uart_logic_tx_data),
		.tx_active(tx_active),
		.tx_data_out(TxD),
		.tx_done(tx_done)
	);
    
    // Keyboard Variables
	wire [7:0] key;
	wire       shift;
	keyboard_controller keyboard (
		.clk(PS2KeyboardClk),
		.data(PS2KeyboardData),
		.key(key),
		.shift(shift)
	);
	
	wire [7:0] logic_char_data;
    wire       logic_char_valid;
	
    internal_process ip(
        .key_in(rx_byte),
        .key_valid(byte_rxed),

        .print_char(logic_char_data),
        .print_valid(logic_char_valid),

        .clk(clk_in),
        .rst(rst)
    );
    
    always @(posedge clk_in) begin
		if (tx_wr_pre) tx_wr <= 1'b0; // reset tx_wr
		if (rx_byte_pre == 8'h0D) begin
			if (!tx_active) begin
				tx_data <= 8'h0A;
				tx_wr <= 1'b1;
				rx_byte_pre <= 8'h00;
			end
		end else if (byte_rxed)	begin
			tx_data <= rx_byte;
			tx_wr <= 1'b1;
			rx_byte_pre <= rx_byte;
		end
		tx_wr_pre <= tx_wr;
	end
	
	
endmodule
