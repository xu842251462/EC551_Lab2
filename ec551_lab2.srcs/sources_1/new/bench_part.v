`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2022 12:21:16 AM
// Design Name: 
// Module Name: bench_part
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


module bench_part(
    input wire  [127:0] synchronous_in,
    input wire          synchronous_valid,
    output reg  [  7:0] print_data,
    output reg          print_valid,

    input  wire         clk,
    input  wire         rst
    );
    
    wire [7:0]matrix_res;
    reg [2:0]counter;
    reg [2:0] A [2:0] [2:0];
    reg [2:0] B [2:0] [2:0]; //2d array, row is 3, col is 3, each 3 bits
    reg [1:0] print_row;
    reg [1:0] print_col;
    reg [1:0] print_digit ;
    
   assign matrix_res = (
        A[print_col][0] * B[0][print_row] +
        A[print_col][1] * B[1][print_row] +
        A[print_col][2] * B[2][print_row]
    );
    
    always @(posedge clk) begin
        if (rst) begin
            counter <= 0;
        end else if (0 <= counter && counter < 6) begin
            if (synchronous_valid) begin
                counter <= counter + 1;
                if (counter < 3) begin
                    A [counter] [0] <= decode_ascii(synchronous_in[127:120]);
                    A [counter] [1] <= decode_ascii(synchronous_in[111:104]);
                    A [counter] [2] <= decode_ascii(synchronous_in[ 95: 88]);
                end else begin
                    B [counter-3] [0] <= decode_ascii(synchronous_in[127:120]);
                    B [counter-3] [1] <= decode_ascii(synchronous_in[111:104]);
                    B [counter-3] [2] <= decode_ascii(synchronous_in[ 95: 88]);
                end
            end
        end else if (counter < 7) begin
            counter <= counter + 1;
        end else if (print_row == 2 && print_col == 2)begin
            counter <= 0;
        end
            
     end
     
     always @(posedge clk) begin
        if (rst) begin
            print_row <= 0;
            print_col <= 0;
            print_digit <= 0;
            print_valid <= 0;
        end else if (counter < 6) begin
            print_row <= 0;
            print_col <= 0;
            print_digit <= 0;
            print_valid <= 0;
        end else if (counter == 6) begin
            print_valid <= 1;
        end else begin
            print_data <= (
                print_digit == 0 ? "0" + (matrix_res / 100) :
                print_digit == 1 ? "0" + (matrix_res % 100) / 10 :
                print_digit == 2 ? "0" + (matrix_res % 10) :
                (print_row == 2 ? 13 : " ")
            );
            print_row <= (
                print_digit != 3 ? print_row :
                print_row == 2 && print_col == 2 ? 3 :
                print_row == 2 ? 0 :
                print_row + 1
            );
            print_col <= (
                (print_row != 2 || print_digit != 3) ? print_col :
                print_col + 1
            );
             print_valid <= ~(print_row == 3 && print_col == 3);
             print_digit <= print_digit + 1;
        end
      end
      
      function automatic [2:0] decode_ascii;
        input [7:0] data;
        case (data)
                "0": decode_ascii = 3'b000;
                "1": decode_ascii = 3'b001;
                "2": decode_ascii = 3'b010;
                "3": decode_ascii = 3'b011;
                "4": decode_ascii = 3'b100;
                "5": decode_ascii = 3'b101;
                "6": decode_ascii = 3'b110;
                "7": decode_ascii = 3'b111;
                default: decode_ascii = 3'b111;
        endcase
    endfunction
endmodule
