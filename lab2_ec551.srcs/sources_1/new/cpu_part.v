`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2022 02:59:01 PM
// Design Name: 
// Module Name: cpu_part
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


module cpu_part(
        input wire  [127:0] synchronous_in,
        input wire          synchronous_valid,

        output reg  [31:0] out,
        output reg         out_valid,

        input wire clk,
        input wire rst
    );
        reg [15:0] hex_decode;

        reg cpu_rst;
    
        reg [11:0] memory_addr;
        reg [15:0] memory_data;
        reg        memory_valid;
    
        wire [111:0] cpu_reg;
        wire cpu_done;
    
        reg [11:0] print_raw;

    
        Cpu cpu(
            .regexpose(cpu_reg),
            .done(cpu_done),
    
            .mem_addr(memory_addr),
            .mem_data(memory_data),
            .mem_valid(memory_valid),
    
            .clk(clk),
            .rst(cpu_rst));
        
        always @(posedge clk) begin
            if (rst) begin
                memory_addr <= 31; // starting from 31
                memory_data <= 0;
                memory_valid <= 0;
            end else if (synchronous_valid) begin
                    if (synchronous_in[127:120] == "r") begin
                    end else begin
                        memory_data <= hex_decode;
                        memory_addr <= memory_addr + 1;
                        memory_valid <= 1;
                     end
            end else begin
                memory_valid <= 0;
            end
        end
        
        always @(posedge clk) begin
            if (rst) begin
                cpu_rst <= 1;
                out_valid <= 0;
                print_raw <= 0;
            end else if (synchronous_valid) begin
                if (synchronous_in[127:120] == "r") begin
                    cpu_rst <= 0;
                end
            end else if (cpu_done) begin
                print_raw <= cpu_reg[11:0];
                out_valid <= 1;
                cpu_rst <= 1;
            end else begin
                out_valid <= 0;
            end
        end
        
        always @(*) begin
            out[31:24] = "0" + (print_raw / 1000);
            out[23:16] = "0" + (print_raw % 1000) / 100;
            out[15:8]  = "0" + (print_raw % 100 ) / 10;
            out[7:0]   = "0" + (print_raw % 10  );
        end
        
        //
        always @(*) begin
            case (synchronous_in[127:120])
                "0": hex_decode[15:12] = 4'h0;
                "1": hex_decode[15:12] = 4'h1;
                "2": hex_decode[15:12] = 4'h2;
                "3": hex_decode[15:12] = 4'h3;
                "4": hex_decode[15:12] = 4'h4;
                "5": hex_decode[15:12] = 4'h5;
                "6": hex_decode[15:12] = 4'h6;
                "7": hex_decode[15:12] = 4'h7;
                "8": hex_decode[15:12] = 4'h8;
                "9": hex_decode[15:12] = 4'h9;
                "A": hex_decode[15:12] = 4'ha;
                "B": hex_decode[15:12] = 4'hb;
                "C": hex_decode[15:12] = 4'hc;
                "D": hex_decode[15:12] = 4'hd;
                "E": hex_decode[15:12] = 4'he;
                "F": hex_decode[15:12] = 4'hf;
                default: hex_decode[15:12] = 4'h0;
             endcase
        end
        
        always @(*) begin
            case (synchronous_in[119:112])
                "0": hex_decode[11:8] = 4'h0;
                "1": hex_decode[11:8] = 4'h1;
                "2": hex_decode[11:8] = 4'h2;
                "3": hex_decode[11:8] = 4'h3;
                "4": hex_decode[11:8] = 4'h4;
                "5": hex_decode[11:8] = 4'h5;
                "6": hex_decode[11:8] = 4'h6;
                "7": hex_decode[11:8] = 4'h7;
                "8": hex_decode[11:8] = 4'h8;
                "9": hex_decode[11:8] = 4'h9;
                "A": hex_decode[11:8] = 4'ha;
                "B": hex_decode[11:8] = 4'hb;
                "C": hex_decode[11:8] = 4'hc;
                "D": hex_decode[11:8] = 4'hd;
                "E": hex_decode[11:8] = 4'he;
                "F": hex_decode[11:8] = 4'hf;
                default: hex_decode[11:8] = 4'h0;
            endcase
        end
        
        always @(*) begin
            case (synchronous_in[111:104])
                "0": hex_decode[7:4] = 4'h0;
                "1": hex_decode[7:4] = 4'h1;
                "2": hex_decode[7:4] = 4'h2;
                "3": hex_decode[7:4] = 4'h3;
                "4": hex_decode[7:4] = 4'h4;
                "5": hex_decode[7:4] = 4'h5;
                "6": hex_decode[7:4] = 4'h6;
                "7": hex_decode[7:4] = 4'h7;
                "8": hex_decode[7:4] = 4'h8;
                "9": hex_decode[7:4] = 4'h9;
                "A": hex_decode[7:4] = 4'ha;
                "B": hex_decode[7:4] = 4'hb;
                "C": hex_decode[7:4] = 4'hc;
                "D": hex_decode[7:4] = 4'hd;
                "E": hex_decode[7:4] = 4'he;
                "F": hex_decode[7:4] = 4'hf;
                default: hex_decode[7:4] = 4'h0;
            endcase
        end
        
        always @(*) begin
            case (synchronous_in[103:96])
                "0": hex_decode[3:0] = 4'h0;
                "1": hex_decode[3:0] = 4'h1;
                "2": hex_decode[3:0] = 4'h2;
                "3": hex_decode[3:0] = 4'h3;
                "4": hex_decode[3:0] = 4'h4;
                "5": hex_decode[3:0] = 4'h5;
                "6": hex_decode[3:0] = 4'h6;
                "7": hex_decode[3:0] = 4'h7;
                "8": hex_decode[3:0] = 4'h8;
                "9": hex_decode[3:0] = 4'h9;
                "A": hex_decode[3:0] = 4'ha;
                "B": hex_decode[3:0] = 4'hb;
                "C": hex_decode[3:0] = 4'hc;
                "D": hex_decode[3:0] = 4'hd;
                "E": hex_decode[3:0] = 4'he;
                "F": hex_decode[3:0] = 4'hf;
                default: hex_decode[3:0] = 4'h0;
            endcase
        end
        
endmodule
