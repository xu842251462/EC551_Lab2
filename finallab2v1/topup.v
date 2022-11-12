`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2022 09:27:58 PM
// Design Name: 
// Module Name: top
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
`define INPUT_STATE_BLOCKED 1'b0
`define INPUT_STATE_ALLOWED 1'b1

/*`define EXEC_STATE_INTRO 2'b00
`define EXEC_STATE_BENCH 2'b01
`define EXEC_STATE_CPU   2'b10
`define EXEC_STATE_ALU   2'b11*/

//connecting the string input to printer
`define STRING_NONE    4'b0000
`define STRING_INTRO   4'b0001
`define STRING_BENCH   4'b0010
`define STRING_ALU     4'b0011
`define STRING_CPU     4'b0100
`define STRING_INVALID 4'b0101
`define STRING_REPORT  4'b0110
`define EXEC_STATE_BENCH 4'b0111
`define PRINT_RESULT1 4'b1000
//connecting to the intro_part, which includes I, A, B module
//`define INTRO_ENTER_CPU     3'b000
//`define INTRO_ENTER_ALU     3'b001
//`define INTRO_ENTER_BENCH   3'b010
//`define INTRO_PRINT_INVALID 3'b011

module top(
    input wire CLK ,
    input wire PS2_CLK,
    input wire PS2_DATA,            
    input  wire     rst,
    output wire  UART_RXD_OUT
    );
    reg CLK50MHZ = 0; 
    reg  caps_lock;
    //intro
    wire [7:0] foo [0:27];
    assign foo[0]  = "H";
    assign foo[1]  = "e";
    assign foo[2]  = "l";
    assign foo[3]  = "l";
    assign foo[4]  = "o";
    assign foo[5]  = " ";
    assign foo[6]  = "E";
    assign foo[7]  = "C";
    assign foo[8]  = "5";
    assign foo[9]  = "5";
    assign foo[10] = "1";
    assign foo[11] = ".";
    assign foo[12]  = " ";
    assign foo[13] = "M";
    assign foo[14] = "Y";
    assign foo[15] = " ";
    assign foo[16] = "n";
    assign foo[17] = "a";
    assign foo[18] = "m";
    assign foo[19] = "e";
    assign foo[20] = " ";
    assign foo[21] = "i";
    assign foo[22] = "s";
    assign foo[23] = " ";
    assign foo[24] = "X";
    assign foo[25] = "u";
    assign foo[26] = "\n";
    assign foo[27] = "\r";

    
    //
    wire [7:0] enter [0:21];
    assign enter[0] = "P";
    assign enter[1] = "l";
    assign enter[2] = "e";
    assign enter[3] = "a";
    assign enter[4] = "s";
    assign enter[5] = "e";
    assign enter[6] = " ";
    assign enter[7]  = "e";
    assign enter[8]  = "n";
    assign enter[9]  = "t";
    assign enter[10]  = "e";
    assign enter[11]  = "r";
    assign enter[12]  = " ";
    assign enter[13]  = "a";
    assign enter[14]  = " ";
    assign enter[15]  = "m";
    assign enter[16]  = "o";
    assign enter[17] = "d";
    assign enter[18] = "e";
    assign enter[19] = ":";
    assign enter[20] = "\n";
    assign enter[21] = "\r";
    //Module I, enter instruction
    wire [7:0] cpui [0:28];
    assign cpui[0]  = "M";
    assign cpui[1]  = "O";
    assign cpui[2]  = "D";
    assign cpui[3]  = "E";
    assign cpui[4]  = "L";
    assign cpui[5]  = " ";
    assign cpui[6]  = "I";
    assign cpui[7]  = ":";
    assign cpui[8]  = "E";
    assign cpui[9]  = "N";
    assign cpui[10] = "T";
    assign cpui[11] = "E";
    assign cpui[12] = "R";
    assign cpui[13] = " ";
    assign cpui[14] = "I";
    assign cpui[15] = "N";
    assign cpui[16] = "S";
    assign cpui[17] = "T";
    assign cpui[18] = "R";
    assign cpui[19] = "U";
    assign cpui[20] = "C";
    assign cpui[21] = "T";
    assign cpui[22] = "I";
    assign cpui[23] = "O";
    assign cpui[24] = "N";
    assign cpui[25] = "S";
    assign cpui[26] = ":";
    assign cpui[27] = "\n";
    assign cpui[28] = "\r";
   //Module L, load instruction from UART
    wire [7:0] report [0:37];
    assign report[0]  = "M";
    assign report[1]  = "O";
    assign report[2]  = "D";
    assign report[3]  = "E";
    assign report[4]  = "L";
    assign report[5]  = " ";
    assign report[6]  = "L";
    assign report[7]  = ":";
    assign report[8]  = "L";
    assign report[9]  = "O";
    assign report[10] = "A";
    assign report[11] = "D";
    assign report[12] = " ";
    assign report[13] = " ";
    assign report[14] = "I";
    assign report[15] = "N";
    assign report[16] = "S";
    assign report[17] = "T";
    assign report[18] = "R";
    assign report[19] = "U";
    assign report[20] = "C";
    assign report[21] = "T";
    assign report[22] = "I";
    assign report[23] = "O";
    assign report[24] = "N";
    assign report[25] = "S";
    assign report[26] = " ";
    assign report[27] = "F";
    assign report[28] = "R";
    assign report[29] = "O";
    assign report[30] = "M";
    assign report[31] = " ";
    assign report[32] = "U";
    assign report[33] = "A";
    assign report[34] = "R";
    assign report[35] = "T";
    assign report[36] = "\n";
   assign report[37] = "\r";

    //alu
    wire [7:0] alui [0:36];
    assign alui[0]  = "M";
    assign alui[1]  = "O";
    assign alui[2]  = "D";
    assign alui[3]  = "E";
    assign alui[4]  = "L";
    assign alui[5]  = " ";
    assign alui[6]  = "A";
    assign alui[7]  = ":";
    assign alui[8]  = "L";
    assign alui[9]  = "O";
    assign alui[10] = "A";
    assign alui[11] = "D";
    assign alui[12] = " ";
    assign alui[13] = " ";
    assign alui[14] = "I";
    assign alui[15] = "N";
    assign alui[16] = "S";
    assign alui[17] = "T";
    assign alui[18] = "R";
    assign alui[19] = "U";
    assign alui[20] = "C";
    assign alui[21] = "T";
    assign alui[22] = "I";
    assign alui[23] = "O";
    assign alui[24] = "N";
    assign alui[25] = "S";
    assign alui[26] = " ";
    assign alui[27] = "F";
    assign alui[28] = "R";
    assign alui[29] = "O";
    assign alui[30] = "M";
    assign alui[31] = " ";
    assign alui[32] = "A";
    assign alui[33] = "L";
    assign alui[34] = "U";
    assign alui[35] = "\n";
    assign alui[36] = "\r";
    
    //bench
    wire [7:0] benchi [0:22];
    assign benchi[0]  = "M";
    assign benchi[1]  = "O";
    assign benchi[2]  = "D";
    assign benchi[3]  = "E";
    assign benchi[4]  = "L";
    assign benchi[5]  = " ";
    assign benchi[6]  = "B";
    assign benchi[7]  = ":";
    assign benchi[8]  = "B";
    assign benchi[9]  = "E";
    assign benchi[10] = "N";
    assign benchi[11] = "C";
    assign benchi[12] = "H";
    assign benchi[13] = " ";
    assign benchi[14] = "P";
    assign benchi[15] = "R";
    assign benchi[16] = "O";
    assign benchi[17] = "G";
    assign benchi[18] = "R";
    assign benchi[19] = "A";
    assign benchi[20] = "M";
    assign benchi[21] = "\n";
    assign benchi[22] = "\r";
   
    // Keyboard Variables
	wire [7:0] key;
	wire       shift;
    wire e;
    wire  uartRdy;
    reg   [7:0] uartData;
    reg  uartSend = 0;
    wire uartTX ;
    reg [7:0] option;
    /*keyboard_controller keyboard (
		.clk(PS2_CLK),
		.data(PS2_DATA),
		.key(key),
		.shift(shift),
		.w(e)
	);*/
	wire [31:0] keyb;
	PS2Receiver t(
     .clk(CLK),
     .kclk(PS2_CLK),
     .kdata(PS2_DATA),
     .keycodeout(keyb)
   
    );
    
	reg q  = 0;
	wire [7:0] logic_char_data;
    wire       logic_char_valid;
    UART_TX_CTRL tx(
        .SEND(uartSend),
        .DATA(uartData),
        .CLK(CLK),
        .READY(uartRdy),
        .UART_TX(uartTX)
    );
 
    reg  [13:0] number;
    wire [31:0] command;
    factorial fx (.clk(CLK),.data(number),.number(command));
    
    reg p = 0;
    reg [31:0] strIndex = 4'd0;
    reg [3:0] state = `STRING_INTRO;
    reg [2:0] digit = 0;
	always @(posedge CLK) begin
           case(state)
               `STRING_INTRO: if (uartRdy == 1) begin
                                  if (strIndex <= 8'd27) begin
                                      uartSend <= 1;
                                      uartData <= foo[strIndex];
                                      strIndex <= strIndex + 1;
                                  end else if (strIndex > 8'd27)begin
                                      strIndex <= 0;
                                      uartSend <= 0;
                                      state <= `STRING_NONE;
                                  end
                              end
                              
                `STRING_NONE: if (uartRdy == 1) begin //choose module
                                    if (strIndex <= 8'd21) begin
                                        uartSend <= 1;
                                        uartData <= enter[strIndex];
                                        strIndex <= strIndex + 1;
                                    end else begin
                                         
                                         if (keyb[15:8] != 8'hf0) begin
                                            p <= 1;
                                            uartSend <= 0;
                                            uartData <= 8'h20;
                                            state <= `STRING_NONE;  
                                        end else if ( p == 1) begin
                                              p<=0; 
                                              if (keyb[7:0] != 8'h0A && keyb[7:0] != 8'hFE )begin
                                                uartSend <= 1;
                                                option <= keyb[7:0];
                                                uartData <= keyb[7:0];
                                            end else if (keyb[7:0] == 8'h0A ) begin
                                                strIndex <= 0;
                                                uartSend <= 1;
                                                uartData <= keyb[7:0];
                                                if (option == 8'h69) begin //i module
                                                   /* uartSend <= 1;
                                                    uartData <= 8'h69;*/
                                                    state <= `STRING_REPORT;
                                                end else if (option == 8'h61) begin //a
                                                   /*uartSend <= 1;
                                                    uartData <= 8'h61;*/
                                                    state <= `STRING_ALU;
                                                end else if (option == 8'h6C) begin //L
                                               /* uartSend <= 1;
                                                    uartData <= 8'h6C;*/
                                                    state <= `STRING_CPU;
                                                end  else if (option == 8'h62) begin //b
                                                /*uartSend <= 1;
                                                    uartData <= 8'h62;*/
                                                    state <= `STRING_BENCH; 
                                                end 
                                              option <= 0;   
                                             /* uartSend <= 1;
                                              uartData <= 8'h0D;*/
                                              end       
                                           end else begin
                                                uartSend <= 0;
                                                uartData <= 8'h20;
                                                state <= `STRING_NONE;  
                                           end
                                        end   
                                        end    
                `STRING_ALU: if (uartRdy == 1) begin
                                  if (strIndex <= 8'd36) begin
                                      uartSend <= 1;
                                      uartData <= alui[strIndex];
                                      strIndex <= strIndex + 1;
                                  end else if (strIndex > 8'd36)begin
                                      strIndex <=0;
                                      uartSend <= 0;
                                      state <= `STRING_NONE;
                                  end
                              end
                 
                 `STRING_CPU: if (uartRdy == 1) begin
                                  if (strIndex <= 8'd28) begin
                                      uartSend <= 1;
                                      uartData <= cpui[strIndex];
                                      strIndex <= strIndex + 1;
                                  end else if (strIndex > 8'd28)begin
                                      strIndex<=0;
                                      uartSend <= 0;
                                      state <= `STRING_NONE;
                                  end
                              end
                  
                 `STRING_BENCH:if(uartRdy == 1) begin
                                  if (strIndex <= 8'd22) begin
                                      uartSend <= 1;
                                      uartData <= benchi[strIndex];
                                      strIndex <= strIndex + 1;
                                  end else if (strIndex > 8'd22)begin
                                      strIndex<=0;
                                      uartSend <= 0;
                                      state <= `EXEC_STATE_BENCH;
                                  end
                               end
                 `EXEC_STATE_BENCH:if (uartRdy == 1) begin //choose module
                                if (keyb[15:8] != 8'hf0) begin
                                    q <= 1;
                                    uartSend <= 0;
                                    uartData <= 8'h20;
                                end else if (q == 1) begin
                                    if (keyb[7:0] >= 8'h30 && keyb[7:0] <= 8'h39) begin
                                        uartSend <= 1;
                                        uartData <= keyb[7:0];
                                       // number <= number * 10 + key - 8'h30;
                                        number <= {{6'b0},{keyb[7:0]-8'h30}};
//                                    end else if (keyb[7:0] == 8'h0A) begin
                                        state <= `PRINT_RESULT1;
                                    end 
                                    q<=0; 
                               end else begin
                                    uartSend <= 0;
                                    uartData <= 8'h20;
                                    state <= `EXEC_STATE_BENCH;
                               end                         
                           end
                   `PRINT_RESULT1 : if(uartRdy == 1) begin
                                case (digit)
                                    0: begin uartSend <= 1;
                                       uartData <= command[7:0];
                                       digit <= digit +1;
                                       end
                                    1: begin uartSend <= 1;
                                       uartData <= command[15:8];
                                       digit <= digit +1;
                                       end
                                    2:begin uartSend <= 1;
                                       uartData <= command[23:16];
                                       digit <= digit +1;
                                       end
                                    3:begin uartSend <= 1;
                                       uartData <= command[31:24];
                                       digit <= digit +1;
                                       end
                                    4: begin state <= `STRING_NONE;
                                       digit <= 0;
                                       end
                                endcase
                              end
                  `STRING_REPORT:if(uartRdy == 1) begin
                                  if (strIndex <= 8'd37) begin
                                      uartSend <= 1;
                                      uartData <= report[strIndex];
                                      strIndex <= strIndex + 1;
                                  end else if (strIndex > 8'd37)begin
                                      strIndex<=0;
                                      uartSend <= 0;
                                      state <= `STRING_NONE;
                                  end
                               end
                  
                endcase
        end

    assign UART_RXD_OUT = uartTX;
    
endmodule
