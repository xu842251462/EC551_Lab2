`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: BU
// Engineer: Josh Wildey
// 
// Create Date:    02:13:26 04/11/2018 
// Module Name:    kb_code_ascii_convert 
// Project Name: Lab 2 - Peripheral and Processor Integration with I/O
// Target Devices: Nexys3 Spartan 6
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////
module bin_ascii_convert(
	input  wire [3:0] ascii,
    output reg  [7:0] bin
   );

	always @ (*) begin
		case (ascii)
            4'h0: begin
				bin <= 8'h30;
			end
			// 1 or !
			4'h1: begin
				bin <= 8'h31;
			end
			// 2 or @
			4'h2: begin
				bin <= 8'h32;
			end
			// 3 or #
			4'h3: begin
				bin <= 8'h33;
			end
			// 4 or $
			4'h4: begin
				bin <= 8'h34;
			end
			// 5 or %
			4'h5: begin
				bin <= 8'h35;
			end
			// 6 or ^
			4'h6: begin
				bin <= 8'h36;
			end
			// 7 or &
			4'h7: begin
				bin <= 8'h37;
			end
			// 8 or *
			4'h8: begin
				bin <= 8'h38;
			end
			// 9 or (
			4'h9: begin
				bin <= 8'h39;
			end
			// 0 or )
			4'ha: begin
				bin <= 8'h61;
			end
			// - or _
			4'hb: begin
				bin <= 8'h62;
			end
			4'hc: begin
				bin <= 8'h63;
			end
			// = or +
			4'hd: begin
				bin <= 8'h64;
			end
			4'he: begin
				bin <= 8'h65;
			end
			4'hf: begin
				bin <= 8'h66;
			end
	        4'hA: begin
				bin <= 8'h41;
			end
			// - or _
			4'hB: begin
				bin <= 8'h42;
			end
			4'hC: begin
				bin <= 8'h43;
			end
			// = or +
			4'hD: begin
				bin <= 8'h44;
			end
			4'hE: begin
				bin <= 8'h45;
			end
			4'hF: begin
				bin <= 8'h46;
			end
			default: bin <= 8'h0A;
		endcase
		end
		
		endmodule
