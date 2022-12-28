`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2022 02:16:58 PM
// Design Name: 
// Module Name: uart_rx
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


module uart_rx(
    input wire       clk,          // Input clock from FPGA, 100 MHz (10 ns)
	input wire       uart_data_in, // UART Serial Data line in
	output reg [2:0] bit_idx,    // Signal for when 1 byte has been recevied (high for 1 cycle)
	output wire [7:0] rx_byte       // Byte of data received
   );
	
	// UART Standard Rates: 1200, 2400, 4800, 19200, 38400, 57600, 115200
	parameter UART_RATE = 9600;
	parameter CLK_RATE  = 100000000;  // 100 MHz
	parameter  CLKS_PER_BIT  = 10417; 
	// State definitions
	// Use localparams so these cannot be changed
	localparam STATE_IDLE         = 3'b000;
	localparam STATE_RX_START_BIT = 3'b001;
	localparam STATE_RX_DATA_BITS = 3'b010;
	localparam STATE_RX_STOP_BIT  = 3'b011;
	localparam STATE_CLEANUP      = 3'b100;
	
	reg [2:0] state = STATE_IDLE;  // register to save current state;
	
	// Clock Counter
	// Max value of clk_cnt if Baud rate is changed is 100 MHz / 1200 Baud = 83333
	// which requires 17 bits to store
	reg [14:0] clk_cnt = 0;
	
	//reg [2:0] bit_idx = 0; // Bit index to count for bytes
	
	// To address issues of metastability, implement
	// double register for incoming data
	reg [7:0]     r_RX_Byte     = 0;
    reg           r_RX_DV       = 0;

	
	// RX State Machine
	always @ (posedge clk) begin
		case (state)
			STATE_IDLE: begin
				r_RX_DV <= 0;
				clk_cnt <= 0;
				bit_idx <= 0;
				
				// Start bit Detection
				if (uart_data_in == 1'b0) begin
					state <= STATE_RX_START_BIT;
				end
				else begin
					state <= STATE_IDLE;
				end
			end
			
			STATE_RX_START_BIT: begin
				// Check start bit in middle of bit clock width
				if (clk_cnt == (CLKS_PER_BIT - 1) / 2) begin
					// If Start bit still 0, proceed to rx data
					if (uart_data_in == 1'b0) begin
						clk_cnt <= 0; //reset counter
						state <= STATE_RX_DATA_BITS;
					end
					// otherwise return to idle and wait for valid start bit
					else begin
						state <= STATE_IDLE;
					end
				end
				// Wait for middle of bit width
				else begin
					clk_cnt <= clk_cnt + 1; //increment counter
					state <= STATE_RX_START_BIT;  // stay in state
				end
			end
			
			STATE_RX_DATA_BITS: begin
				// Wait for bit width
				if (clk_cnt < (CLKS_PER_BIT - 1)) begin
					clk_cnt <= clk_cnt + 1'b1; //increment counter
					state <= STATE_RX_DATA_BITS;  // stay in state
				end
				// Sample Data bit
				else begin
					clk_cnt <= 0; //reset counter
					r_RX_Byte[bit_idx] <= uart_data_in;  // sample serial data
					
					// check if we received 8 bits
					if (bit_idx < 7) begin
						bit_idx <= bit_idx + 1;  // increment bit index
						state <= STATE_RX_DATA_BITS; // stay in this state
					end
					// received a byte
					else begin
						bit_idx <= 0;  // reset bit index
						state <= STATE_RX_STOP_BIT; // move to stop bit state
					end
				end
			end
			
			STATE_RX_STOP_BIT: begin
				// Wait for bit width
				r_RX_DV <= 1'b0;
				if (clk_cnt < (CLKS_PER_BIT - 1)) begin
				    r_RX_DV <= 1'b1;
					clk_cnt <= clk_cnt + 1; //increment counter
					state <= STATE_RX_STOP_BIT;  // stay in state
				end
				// Stop bit
				else begin
				    
					clk_cnt <= 0; //reset counter
					state <= STATE_IDLE;  // move on to cleanup state
				end
			end
			
			/*STATE_CLEANUP: begin
				state <= STATE_IDLE;
				r_RX_DV <= 1'b0;
				
			end*/
			
			default: begin
				state <= STATE_IDLE;
			end
			
		endcase	
	end
	
//	assign byte_rxed = r_RX_DV;
	assign rx_byte  = r_RX_Byte;
	
endmodule