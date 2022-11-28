
//connecting the string input to printer
`define STRING_NONE      6'b000000
`define STRING_INTRO     6'b000001
`define STRING_BENCH     6'b000010
`define STRING_ALU       6'b000011
`define STRING_CPU       6'b000100
`define STRING_INVALID   6'b000101
`define STRING_REPORT    6'b000110
`define EXEC_STATE_BENCH 6'b000111

`define EXE_STATE_ALU    6'b001000
`define EXE_STATE_REPORT 6'b001001
`define PRINT_REPORT     6'b001010
`define EXE_STRING_CPU   6'b001011
`define EXE_STATE_ALU1   6'b001100
`define EXE_STATE_ALU2   6'b001101
`define EXE_STATE_ALU3   6'b001110
`define PRINT_RESULT     6'b001111
`define PRINT_RESULT1    6'b010000
`define END              6'b010001

`define EXE_STATE_CPU1   6'b010010
`define EXE_STATE_CPU2   6'b010011
`define EXE_STATE_CPU3   6'b010100
`define EXE_STATE_CPU4   6'b010101

`define PRINT_RESULT2    6'b010110
`define PRINT_RESULT3    6'b010111
`define PRINT_RESULT4    6'b011000

`define EXE_STATE_REPORT1 6'b011001
`define EXE_STATE_REPORT2 6'b011010
`define EXE_STATE_REPORT3 6'b011011
`define EXE_STATE_REPORT4 6'b011100

`define EXEC_STATE_BENCH1 6'b011101

`define EXE_STATE_CPU5 6'b011110
module top(
       input  wire  CLK ,
       input  wire  PS2_CLK,
       input  wire  PS2_DATA,            
       input  wire  rst,
       input  wire  UART_TXD_IN,
       output wire  UART_RXD_OUT
       
       
    );
    
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
    wire  uartRdy;
    reg   [7:0] uartData;
    reg   uartSend = 0;
    wire  uartTX ;
    reg   [7:0] option; //for choosing module   
	wire  [31:0] keyb;
	
	PS2Receiver t(
     .clk(CLK),
     .kclk(PS2_CLK), //in
     .kdata(PS2_DATA), //in
     .keycodeout(keyb) //out, as ascci
   
    );
    
    // for state machine
	reg q  = 0;
	reg p = 0;
	
    UART_TX_CTRL tx(
        .SEND(uartSend),
        .DATA(uartData),
        .CLK(CLK),
        .READY(uartRdy),
        .UART_TX(uartTX)
    );
    
   
   //veriables for exec cpu 
    reg  [7:0] ins [0:3];
    reg  [3:0] num = 4'd0;
    wire [7:0] word;
    wire [2:0] received;
    //    wire [3:0] par;

    uart_rx rx(
       .clk(CLK),          // Input clock from FPGA, 100 MHz (10 ns)
	   .uart_data_in(UART_TXD_IN), // UART Serial Data line in
	   .bit_idx(received),    // Signal for when 1 byte has been recevied (high for 1 cycle)
	   .rx_byte(word)       // Byte of data received
    );

    //intro variable
    reg [31:0] strIndex = 32'd0;
    reg [5:0] state = `STRING_INTRO;
    
    //alu variable
    reg [7:0]A = 0;
    reg [7:0]B = 0;
    reg [7:0]cmd;
    reg [7:0]res;
   
    //factorial variable
    reg  [13:0] number;
    wire [31:0] command;
    reg [31:0] digit = 32'd0;
    
    factorial fx(
        .clk(CLK),
        .data(number),//in
        .number(command) //out
    );
    
    // cpu variable, cpu module
    wire [111:0] cpu_reg;
    wire         cpu_reg_valid;
    reg [7:0]C = 0;
    reg [7:0]D = 0;
    reg  [39:0]   key_in;
    reg            key_valid;
    integer      ii;
    wire RST;
    internal_processing ip(
        .key_in(key_in), //in, 8 bits
        .key_valid(key_valid),//in, 
        
        .cpu_reg(cpu_reg), //out, to UART_TX, 112 bits
        .cpu_reg_valid(cpu_reg_valid),//out, to UART_TX
        
        .clk(CLK),
        .rst(rst)
    );
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
                                               if (keyb[7:0] != 8'h0A && keyb[7:0] != 8'hFE&& keyb[7:0] != 8'h80 )begin
                                                   uartSend <= 1;
                                                   option <= keyb[7:0];
                                                   uartData <= keyb[7:0];
                                               end else if (keyb[7:0] == 8'h0A ) begin
                                                   strIndex <= 0;
                                                   uartSend <= 1;
                                                   uartData <= keyb[7:0];
                                               if (option == 8'h69) begin //i module

                                                   state <= `STRING_REPORT;
                                               end else if (option == 8'h61) begin //a

                                                   state <= `STRING_ALU;
                                               end else if (option == 8'h6C) begin //L
                                                   state <= `STRING_CPU;
                                               end  else if (option == 8'h62) begin //b
                                               
                                                   state <= `STRING_BENCH; 
                                                    end 
                                                      option <= 0;   

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
                                      strIndex<=0;
                                      uartSend <= 0;
                                      state <= `EXE_STATE_ALU;                                                              
                                  end
                                end    

                    //ENTER NUM 1
                `EXE_STATE_ALU:if (uartRdy == 1) begin //choose module
                                if (keyb[15:8] != 8'hf0) begin
                                    q <= 1;
                                    uartSend <= 0;
                                    uartData <= 8'h20;
                                end else if (q == 1) begin
                                    if (keyb[7:0] >= 8'h30 && keyb[7:0] <= 8'h39) begin
                                        uartSend <= 1;
                                        uartData <= keyb[7:0];                                  
                                        A <= keyb[7:0];
                                 
                                        state <= `EXE_STATE_ALU1;
                                        end 
                                        q<=0; 
                                end else begin
                                    uartSend <= 0;
                                    uartData <= 8'h20;
                                    state <= `EXE_STATE_ALU;
                               end
                              end
                              
                              //ENTER CMD
                `EXE_STATE_ALU1:if (uartRdy == 1) begin //choose module
                                if (keyb[15:8] != 8'hf0) begin
                                    q <= 1;
                                    uartSend <= 0;
                                    uartData <= 8'h20;
                                end else if ( q == 1) begin
                                    if (keyb[7:0] == 8'h2B || keyb[7:0] == 8'h2D || keyb[7:0] == 8'h5E || keyb[7:0] == 8'h2A) begin
                                        uartSend <= 1;
                                        uartData <= keyb[7:0];                                  
                                        cmd <= keyb[7:0];

                                        state <= `EXE_STATE_ALU2;
                                    end 
                                    q <= 0; 
                                end else begin
                                    uartSend <= 0;
                                    uartData <= 8'h20;
                                    state <= `EXE_STATE_ALU1;
                               end
                              end
                              
                              
                        //ENTER NUMNER 2
                `EXE_STATE_ALU2:if (uartRdy == 1) begin //choose module
                                if (keyb[15:8] != 8'hf0) begin
                                    q <= 1;
                                    uartSend <= 0;
                                    uartData <= 8'h20;
                                end else if ( q == 1) begin
                                        if (keyb[7:0] >= 8'h30 && keyb[7:0] <= 8'h39) begin
                                            uartSend <= 1;
                                            uartData <= keyb[7:0];                                  
                                            B <= keyb[7:0];
                                            state <= `EXE_STATE_ALU3;
                                        end 
                                        q<=0; 
                                 end else begin
                                    uartSend <= 0;
                                    uartData <= 8'h20;
                                    state <= `EXE_STATE_ALU2;
                               end
                              end
                              //PRESS ENTER
                `EXE_STATE_ALU3:if (uartRdy == 1) begin //choose module
                                if (keyb[15:8] != 8'hf0) begin
                                    q <= 1;
                                    uartSend <= 0;
                                    uartData <= 8'h20;
                                end else if (q == 1) begin
                                       if (keyb[7:0] == 8'h0A) begin
                                            state <= `PRINT_RESULT;
                                        end 
                                        q<=0; 
                                 end else begin
                                    uartSend <= 0;
                                    uartData <= 8'h20;
                                    state <= `EXE_STATE_ALU3;
                               end
                              end
                `PRINT_RESULT : if(uartRdy == 1) begin
                                      if (cmd == 8'h2B) begin
                                         res = (A + B)- 8'h30;
                                         uartSend = 1;
                                         uartData = res;
                                         state = `END;
                                      end else if (cmd == 8'h2D) begin
                                         res = ((A - B)% 8'h30) + "0";
                                         uartSend = 1;
                                         uartData = res;
                                         state = `END;
                                      end else if (cmd == 8'h5E) begin
                                         res = (A-8'h30) / (B-8'h30) + 8'h30;
                                         uartSend = 1;
                                         uartData = res;
                                         state = `END;
                                      end else if (cmd == 8'h2A) begin
                                         res = (A-8'h30) * (B-8'h30) + 8'h30;
                                         uartSend = 1;
                                         uartData = res;
                                         state = `END;
                                      end  
                                end
                                
                 `END : if(uartRdy == 1) begin                                      
                                   state = `STRING_NONE;                                     
                                end   
                                   
                   //print module instruction on terminal                    
                 `STRING_CPU: if (uartRdy == 1) begin
                                  if (strIndex <= 8'd28) begin
                                      uartSend <= 1;
                                      uartData <= cpui[strIndex];
                                      strIndex <= strIndex + 1;
                                  end else if (strIndex > 8'd28)begin
                                      strIndex<=0;
                                      uartSend <= 0;
                                      state <= `EXE_STRING_CPU;
                                  end
                              end
                              
                 `EXE_STRING_CPU:if (uartRdy == 1) begin 
                                     if (keyb[15:8] != 8'hf0) begin
                                         q <= 1;
                                         uartSend <= 0;
                                         uartData <= 8'h20;
                                     end else if (q == 1) begin
                                             A <= keyb[7:0];
                                             uartSend <= 1;
                                             uartData <= keyb[7:0];
                                             state <= `EXE_STATE_CPU1; 
                                         q<=0; 
                                      end else begin
                                           uartSend <= 0;
                                           uartData <= 8'h20;
                                           state <= `EXE_STRING_CPU;
                                      end                         
                               end
                  `EXE_STATE_CPU1: if (uartRdy == 1) begin 
                                     if (keyb[15:8] != 8'hf0) begin
                                         q <= 1;
                                         uartSend <= 0;
                                     end else if (q == 1) begin
                                             B <= keyb[7:0];   
                                             uartSend <= 1;
                                             uartData <= keyb[7:0];                           
                                             state <= `EXE_STATE_CPU2; 
                                         q<=0; 
                                      end else begin
                                           uartSend <= 0;
                                           state <= `EXE_STATE_CPU1;
                                      end                         
                               end
                 `EXE_STATE_CPU2: if (uartRdy == 1) begin 
                                     if (keyb[15:8] != 8'hf0) begin
                                         q <= 1;
                                         uartSend <= 0;
                                     end else if (q == 1) begin
                                             C <= keyb[7:0];
                                             uartSend <= 1;
                                             uartData <= keyb[7:0];                                      
                                             state <= `EXE_STATE_CPU3; 
                                         q<=0; 
                                      end else begin
                                           uartSend <= 0;
                                           state <= `EXE_STATE_CPU2;
                                      end                         
                               end
                 `EXE_STATE_CPU3: if (uartRdy == 1) begin 
                                     if (keyb[15:8] != 8'hf0) begin
                                         q <= 1;
                                         uartSend <= 0;
                                     end else if (q == 1) begin                                  
                                             D <= keyb[7:0];
                                             uartSend <= 1;
                                             uartData <= keyb[7:0];
                                                                               
                                             state <= `EXE_STATE_CPU4; 
                                         q<=0; 
                                      end else begin
                                           uartSend <= 0;
                                           state <= `EXE_STATE_CPU3;
                                      end                         
                               end
                 `EXE_STATE_CPU4: if (uartRdy == 1) begin 
                                     if (keyb[15:8] != 8'hf0) begin
                                         q <= 1;
                                         uartSend <= 0;
                                     end else if (q == 1) begin
                                         if (keyb[7:0] == 8'h52 || keyb[7:0] == 8'h72) begin
                                           
                                             uartSend <= 1;
                                             uartData <= keyb[7:0];
                                             state <= `EXE_STATE_CPU5; 
                                        
                                         end 
                                         q<=0; 
                                      end else begin
                                           uartSend <= 0;
                                           state <= `EXE_STATE_CPU4;
                                      end                         
                               end
                 `EXE_STATE_CPU5: if (uartRdy == 1) begin 
                                     if (keyb[15:8] != 8'hf0) begin
                                         q <= 1;
                                         uartSend <= 0;
                                     end else if (q == 1) begin
                                         if (keyb[7:0] == 8'h0A) begin

                                             state <= `PRINT_RESULT1; 
                                        
                                         end 
                                         q<=0; 
                                      end else begin
                                           uartSend <= 0;
                                           state <= `EXE_STATE_CPU5;
                                      end                         
                               end             
                 `PRINT_RESULT1 : if(uartRdy == 1) begin
                                 key_in <={A,B,C,D,8'h72};  
                                 key_valid <= 1;
                           if(cpu_reg_valid == 1)begin
                                 case (digit)
                                    0: begin uartSend <= 1;
                                       uartData <= 8'h0A;
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2;   
                                       end
                                    1: begin uartSend <= 1;
                                       uartData <= 8'h0D;
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2;   
                                       end
                                    2: begin uartSend <= 1;                     
                                       uartData <= 8'h52;
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end
                                    3:begin uartSend <= 1;
                                       uartData <= 8'h30;
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end
                                    4:begin uartSend <= 1;
                                       uartData <= 8'h20;
                                       digit <= digit +1;
                                       state <= `PRINT_RESULT2; 
                                       end
                                    5:begin if (cpu_reg[111:108]>= 0 &&  cpu_reg[111:108] <= 9) begin;
                                       uartSend <= 1;
                                       uartData <= cpu_reg[111:108] + 8'h30;
                                       end else begin
                                       uartSend <= 1;
                                       uartData <= cpu_reg[111:108] + 8'h37;
                                       end
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end
                                    6:begin if (cpu_reg[107:104]>= 0 &&  cpu_reg[107:104] <= 9) begin;
                                       uartSend <= 1;
                                       uartData <= cpu_reg[107:104] + 8'h30;
                                       end else begin
                                       uartSend <= 1;
                                       uartData <= cpu_reg[107:104] + 8'h37;
                                       end
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end
                                    7:begin if (cpu_reg[103:100]>= 0 &&  cpu_reg[103:100] <= 9) begin;
                                       uartSend <= 1;
                                       uartData <= cpu_reg[103:100] + 8'h30;
                                       end else begin
                                       uartSend <= 1;
                                       uartData <= cpu_reg[103:100] + 8'h37;
                                       end
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end
                                     8:begin if (cpu_reg[99:96]>= 0 &&  cpu_reg[99:96] <= 9) begin;
                                       uartSend <= 1;
                                       uartData <= cpu_reg[99:96] + 8'h30;
                                       end else begin
                                       uartSend <= 1;
                                       uartData <= cpu_reg[99:96] + 8'h37;
                                       end
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end
                                    9:begin uartSend <= 1;
                                       uartData <= 8'h0A;
                                       digit <= digit +1;
                                       state <= `PRINT_RESULT2; 
                                       end
                                    10: begin uartSend <= 1;
                                       uartData <= 8'h0D;
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2;   
                                       end
                                    11:begin uartSend <= 1;
                                       uartData <= 8'h52;
                                       digit <= digit +1;
                                       state <= `PRINT_RESULT2; 
                                       end
                                    12:begin uartSend <= 1;
                                       uartData <= 8'h31;
                                       digit <= digit +1;
                                       state <= `PRINT_RESULT2; 
                      
                                       end
                                    13:begin uartSend <= 1;
                                       uartData <= 8'h20;
                                       digit <= digit +1;
                                       state <= `PRINT_RESULT2; 
                                  
                                       end
                                    14:begin if (cpu_reg[95:92]>= 0 &&  cpu_reg[95:92] <= 9) begin;
                                       uartSend <= 1;
                                       uartData <= cpu_reg[95:92] + 8'h30;
                                       end else begin
                                       uartSend <= 1;
                                       uartData <= cpu_reg[95:92] + 8'h37;
                                       end
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end
                                  15:begin if (cpu_reg[91:88]>= 0 &&  cpu_reg[91:88] <= 9) begin;
                                       uartSend <= 1;
                                       uartData <=  cpu_reg[91:88] + 8'h30;
                                       end else begin
                                       uartSend <= 1;
                                       uartData <= cpu_reg[91:88] + 8'h37;
                                       end
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end
                                     16:begin if (cpu_reg[87:84]>= 0 &&  cpu_reg[87:84] <= 9) begin;
                                       uartSend <= 1;
                                       uartData <=  cpu_reg[87:84] + 8'h30;
                                       end else begin
                                       uartSend <= 1;
                                       uartData <= cpu_reg[87:84] + 8'h37;
                                       end
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end
                                    17:begin if (cpu_reg[83:80]>= 0 &&  cpu_reg[83:80] <= 9) begin;
                                       uartSend <= 1;
                                       uartData <=  cpu_reg[83:80] + 8'h30;
                                       end else begin
                                       uartSend <= 1;
                                       uartData <= cpu_reg[83:80] + 8'h37;
                                       end
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end
                                   18:begin uartSend <= 1;
                                       uartData <= 8'h0A;
                                       digit <= digit +1;
                                       state <= `PRINT_RESULT2; 
                                       
                                       end
                                   19: begin uartSend <= 1;
                                       uartData <= 8'h0D;
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2;   
                                       end
                                   20:begin uartSend <= 1;
                                       uartData <= 8'h52;
                                       digit <= digit +1;
                                       state <= `PRINT_RESULT2; 
                                       end
                                   21:begin uartSend <= 1;
                                       uartData <= 8'h32;
                                       digit <= digit +1;
                                       state <= `PRINT_RESULT2; 
                      
                                       end
                                   22:begin uartSend <= 1;
                                       uartData <= 8'h20;
                                       digit <= digit +1;
                                       state <= `PRINT_RESULT2; 
                                  
                                       end
                                  23:begin if (cpu_reg[79:76]>= 0 &&  cpu_reg[79:76] <= 9) begin;
                                       uartSend <= 1;
                                       uartData <=  cpu_reg[79:76] + 8'h30;
                                       end else begin
                                       uartSend <= 1;
                                       uartData <= cpu_reg[79:76] + 8'h37;
                                       end
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end
                                  24:begin if (cpu_reg[75:72]>= 0 &&  cpu_reg[75:72] <= 9) begin;
                                       uartSend <= 1;
                                       uartData <=  cpu_reg[75:72] + 8'h30;
                                       end else begin
                                       uartSend <= 1;
                                       uartData <= cpu_reg[75:72] + 8'h37;
                                       end
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end
                                   25:begin if (cpu_reg[71:68] >= 0 &&  cpu_reg[71:68] <= 9) begin;
                                       uartSend <= 1;
                                       uartData <=  cpu_reg[71:68] + 8'h30;
                                       end else begin
                                       uartSend <= 1;
                                       uartData <= cpu_reg[71:68] + 8'h37;
                                       end
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end
                                   26:begin if (cpu_reg[67:64] >= 0 &&  cpu_reg[67:64] <= 9) begin;
                                       uartSend <= 1;
                                       uartData <=  cpu_reg[67:64] + 8'h30;
                                       end else begin
                                       uartSend <= 1;
                                       uartData <= cpu_reg[67:64] + 8'h37;
                                       end
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end
                               
                               
                                
                                   27:begin uartSend <= 1;
                                       uartData <= 8'h0A;
                                       digit <= digit +1;
                                       state <= `PRINT_RESULT2; 
                                       
                                       end
                                   28: begin uartSend <= 1;
                                       uartData <= 8'h0D;
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2;   
                                       end
                                  29:begin uartSend <= 1;
                                       uartData <= 8'h52;
                                       digit <= digit +1;
                                       state <= `PRINT_RESULT2; 
                                       end
                                  30:begin uartSend <= 1;
                                       uartData <= 8'h33;
                                       digit <= digit +1;
                                       state <= `PRINT_RESULT2; 
                      
                                       end
                                  31:begin uartSend <= 1;
                                       uartData <= 8'h20;
                                       digit <= digit +1;
                                       state <= `PRINT_RESULT2; 
                                  
                                       end
                                  32:begin if (cpu_reg[63:60] >= 0 &&  cpu_reg[63:60] <= 9) begin;
                                       uartSend <= 1;
                                       uartData <=  cpu_reg[63:60] + 8'h30;
                                       end else begin
                                       uartSend <= 1;
                                       uartData <= cpu_reg[63:60] + 8'h37;
                                       end
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end
                                   33:begin if (cpu_reg[59:56] >= 0 &&  cpu_reg[59:56] <= 9) begin;
                                       uartSend <= 1;
                                       uartData <=  cpu_reg[59:56] + 8'h30;
                                       end else begin
                                       uartSend <= 1;
                                       uartData <= cpu_reg[59:56] + 8'h37;
                                       end
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end
                                  34:begin if (cpu_reg[55:52] >= 0 &&  cpu_reg[55:52] <= 9) begin;
                                       uartSend <= 1;
                                       uartData <=  cpu_reg[55:52] + 8'h30;
                                       end else begin
                                       uartSend <= 1;
                                       uartData <=  cpu_reg[55:52] + 8'h37;
                                       end
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end 
                                  35:begin  if (cpu_reg[51:48] >= 0 &&  cpu_reg[51:48] <= 9) begin;
                                       uartSend <= 1;
                                       uartData <=  cpu_reg[51:48] + 8'h30;
                                       end else begin
                                       uartSend <= 1;
                                       uartData <=  cpu_reg[51:48] + 8'h37;
                                       end
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end          
                                 36:begin uartSend <= 1;
                                       uartData <= 8'h0A;
                                       digit <= digit +1;
                                       state <= `PRINT_RESULT2; 
                                       
                                       end
                                 37: begin uartSend <= 1;
                                       uartData <= 8'h0D;
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2;   
                                       end
                                 38:begin uartSend <= 1;
                                       uartData <= 8'h52;
                                       digit <= digit +1;
                                       state <= `PRINT_RESULT2; 
                                       end
                                 39:begin uartSend <= 1;
                                       uartData <= 8'h34;
                                       digit <= digit +1;
                                       state <= `PRINT_RESULT2; 
                      
                                       end
                                  
                                40:begin uartSend <= 1;
                                       uartData <= 8'h20;
                                       digit <= digit +1;
                                       state <= `PRINT_RESULT2; 
                                  
                                       end
                                 41:begin  if (cpu_reg[47:44] >= 0 &&  cpu_reg[47:44] <= 9) begin;
                                       uartSend <= 1;
                                       uartData <=  cpu_reg[47:44] + 8'h30;
                                       end else begin
                                       uartSend <= 1;
                                       uartData <=  cpu_reg[47:44] + 8'h37;
                                       end
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end
                                  42:begin  if (cpu_reg[43:40] >= 0 &&  cpu_reg[43:40] <= 9) begin;
                                       uartSend <= 1;
                                       uartData <=  cpu_reg[43:40] + 8'h30;
                                       end else begin
                                       uartSend <= 1;
                                       uartData <=  cpu_reg[43:40] + 8'h37;
                                       end
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end
                                  43:begin if (cpu_reg[39:36] >= 0 &&  cpu_reg[39:36] <= 9) begin;
                                       uartSend <= 1;
                                       uartData <=  cpu_reg[39:36] + 8'h30;
                                       end else begin
                                       uartSend <= 1;
                                       uartData <=  cpu_reg[39:36] + 8'h37;
                                       end
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end  
                                44:begin if (cpu_reg[35:32] >= 0 &&  cpu_reg[35:32] <= 9) begin;
                                       uartSend <= 1;
                                       uartData <=  cpu_reg[35:32] + 8'h30;
                                       end else begin
                                       uartSend <= 1;
                                       uartData <=  cpu_reg[35:32] + 8'h37;
                                       end
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end
                                 45:begin uartSend <= 1;
                                       uartData <= 8'h0A;
                                       digit <= digit +1;
                                       state <= `PRINT_RESULT2; 
                                       
                                       end
                                 46: begin uartSend <= 1;
                                       uartData <= 8'h0D;
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2;   
                                       end
                                 47:begin uartSend <= 1;
                                       uartData <= 8'h52;
                                       digit <= digit +1;
                                       state <= `PRINT_RESULT2; 
                                       end
                                 48:begin uartSend <= 1;
                                       uartData <= 8'h35;
                                       digit <= digit +1;
                                       state <= `PRINT_RESULT2; 
                      
                                       end
                                49:begin uartSend <= 1;
                                       uartData <= 8'h20;
                                       digit <= digit +1;
                                       state <= `PRINT_RESULT2; 
                                  
                                       end
                                  50:begin if ( cpu_reg[31:28] >= 0 &&  cpu_reg[31:28] <= 9) begin;
                                       uartSend <= 1;
                                       uartData <=  cpu_reg[31:28] + 8'h30;
                                       end else begin
                                       uartSend <= 1;
                                       uartData <=  cpu_reg[31:28] + 8'h37;
                                       end
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end
                                  51:begin if ( cpu_reg[27:24] >= 0 &&  cpu_reg[27:24] <= 9) begin;
                                       uartSend <= 1;
                                       uartData <=  cpu_reg[27:24] + 8'h30;
                                       end else begin
                                       uartSend <= 1;
                                       uartData <=  cpu_reg[27:24] + 8'h37;
                                       end
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end 
                                  52:begin if (cpu_reg[23:20] >= 0 && cpu_reg[23:20] <= 9) begin;
                                       uartSend <= 1;
                                       uartData <= cpu_reg[23:20] + 8'h30;
                                       end else begin
                                       uartSend <= 1;
                                       uartData <= cpu_reg[23:20] + 8'h37;
                                       end
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end
                                 53: begin if (cpu_reg[19:16] >= 0 && cpu_reg[19:16] <= 9) begin;
                                       uartSend <= 1;
                                       uartData <= cpu_reg[19:16] + 8'h30;
                                       end else begin
                                       uartSend <= 1;
                                       uartData <= cpu_reg[19:16] + 8'h37;
                                       end
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end
                                   
                                54:begin uartSend <= 1;
                                       uartData <= 8'h0A;
                                       digit <= digit +1;
                                       state <= `PRINT_RESULT2; 
                                       
                                       end
                                55: begin uartSend <= 1;
                                       uartData <= 8'h0D;
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2;   
                                       end
                                56:begin uartSend <= 1;
                                       uartData <= 8'h43;
                                       digit <= digit +1;
                                       state <= `PRINT_RESULT2; 
                                       end
                                57:begin uartSend <= 1;
                                       uartData <= 8'h20;
                                       digit <= digit +1;
                                       state <= `PRINT_RESULT2; 
                                  
                                       end
                                  58:begin if (cpu_reg[15:12] >= 0 && cpu_reg[15:12] <= 9) begin;
                                       uartSend <= 1;
                                       uartData <= cpu_reg[15:12] + 8'h30;
                                       end else begin
                                       uartSend <= 1;
                                       uartData <= cpu_reg[15:12] + 8'h37;
                                       end
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end
                                  59:begin if (cpu_reg[11:8] >= 0 && cpu_reg[11:8] <= 9) begin;
                                       uartSend <= 1;
                                       uartData <= cpu_reg[11:8] + 8'h30;
                                       end else begin
                                       uartSend <= 1;
                                       uartData <= cpu_reg[11:8] + 8'h37;
                                       end
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end
                                   60:begin if (cpu_reg[7:4] >= 0 && cpu_reg[7:4] <= 9) begin;
                                       uartSend <= 1;
                                       uartData <= cpu_reg[7:4] + 8'h30;
                                       end else begin
                                       uartSend <= 1;
                                       uartData <= cpu_reg[7:4] + 8'h37;
                                       end
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end   
                                61:begin if (cpu_reg[3:0] >= 0 && cpu_reg[3:0] <= 9) begin;
                                       uartSend <= 1;
                                       uartData <= cpu_reg[3:0] + 8'h30;
                                       end else begin
                                       uartSend <= 1;
                                       uartData <= cpu_reg[3:0] + 8'h37;
                                       end
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2; 
                                       end 
                                62:begin uartSend <= 1;
                                       uartData <= 8'h0A;
                                       digit <= digit +1;
                                       state <= `PRINT_RESULT2; 
                                       
                                       end
                                 63: begin uartSend <= 1;
                                       uartData <= 8'h0D;
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT2;   
                                       end
                                64: begin  uartSend <= 0;
                                       state <= `STRING_NONE;
                                       digit <= 0;
                                       end
                                endcase   
                                end
                  end                                                  
                  `PRINT_RESULT2 : if(uartRdy == 1) begin
                                        uartSend <= 0;
                                        state <=  `PRINT_RESULT1;                                                 
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
                                        number <= {{6'b0},{keyb[7:0]-8'h30}};                                
                                        state <= `EXEC_STATE_BENCH1;
                                    end 
                                    q<=0; 
                               end else begin
                                    uartSend <= 0;
                                    uartData <= 8'h20;
                                    state <= `EXEC_STATE_BENCH;
                               end                         
                           end
                   `EXEC_STATE_BENCH1:if (uartRdy == 1) begin //choose module
                                if (keyb[15:8] != 8'hf0) begin
                                    q <= 1;
                                    uartSend <= 0;
                                    uartData <= 8'h20;
                                end else if (q == 1) begin
                                       if (keyb[7:0] == 8'h0A) begin
                                            state <= `PRINT_RESULT3;
                                        end 
                                        q<=0; 
                                 end else begin
                                    uartSend <= 0;
                                    uartData <= 8'h20;
                                    state <= `EXEC_STATE_BENCH1;
                               end
                     end      
                   `PRINT_RESULT3 : if(uartRdy == 1) begin
                                 case (digit)
                                    0: begin uartSend <= 1;
                                       uartData <= command[7:0];
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT4; 
                                      
                                       end
                                    1: begin uartSend <= 1;                     
                                       uartData <= command[15:8];
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT4; 
                                      
                                       end
                                    2:begin uartSend <= 1;
                                       uartData <= command[23:16];
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT4; 
                                      
                                       end
                                    3:begin uartSend <= 1;
                                       uartData <= command[31:24];
                                       digit <= digit +1;
                                       state <=  `PRINT_RESULT4; 
                                      
                                       end
                                    4: begin  uartSend <= 0;
                                       
                                       state <= `STRING_NONE;
                                       digit <= 0;
                                       end
                                endcase                                          
                              end
                   `PRINT_RESULT4 : if(uartRdy == 1) begin
                                        uartSend <= 0;
                                        state <=  `PRINT_RESULT3;                                                 
                                    end
                   
                   `STRING_REPORT:if (uartRdy == 1) begin
                                      if (strIndex <= 8'd37) begin
                                          uartSend <= 1;
                                          uartData <= report[strIndex];
                                          strIndex <= strIndex + 1;
                                      end else if (strIndex > 8'd37)begin
                                          strIndex<=0;
                                          uartSend <= 0;
                                          state <= `EXE_STATE_REPORT;                                                              
                                      end
                                    end   
                   `EXE_STATE_REPORT: if (uartRdy == 1) begin //choose module
                                if(received == 7)begin
                                     uartSend <= 1;
                                     uartData <= word;
                                     state <= `EXE_STATE_REPORT1;
                                end else begin
                                    uartSend <= 0;
                                    state <= `EXE_STATE_REPORT;
                                end
                                              
                             end
                   `EXE_STATE_REPORT1: if (uartRdy == 1) begin //choose module
                                if(received == 7)begin
                                     uartSend <= 1;
                                     uartData <= word;
                                     A <= word;
                                     state <= `EXE_STATE_REPORT2;
                                end else begin
                                    uartSend <= 0;
                                    num <= 0;
                                    state <= `EXE_STATE_REPORT1;
                                end              
                             end
                 `EXE_STATE_REPORT2:if (uartRdy == 1) begin //choose module
                                if(received == 7)begin
                                     uartSend <= 1;
                                     uartData <= word;
                                     B <= word;
                                     state <= `EXE_STATE_REPORT3;
                                end else begin
                                    uartSend <= 0;
                                    num <= 0;
                                    state <= `EXE_STATE_REPORT2;
                                end              
                             end          
                   `EXE_STATE_REPORT3:if (uartRdy == 1) begin //choose module
                                if(received == 7)begin
                                     uartSend <= 1;
                                     uartData <= word;
                                     C <= word;
                                     state <= `EXE_STATE_REPORT4;
                                end else begin
                                    uartSend <= 0;
                                    num <= 0;
                                    state <= `EXE_STATE_REPORT3;
                                end              
                             end                 
                    `EXE_STATE_REPORT4:if (uartRdy == 1) begin //choose module
                                if(received == 7)begin
                                     uartSend <= 1;
                                     uartData <= word;
                                     D <= word;
                                     state <= `EXE_STATE_CPU4;
                                end else begin
                                    uartSend <= 0;
                                    num <= 0;
                                    state <= `EXE_STATE_REPORT4;
                                end              
                             end 
                endcase
        end
    
    assign UART_RXD_OUT = uartTX;
    
    
endmodule
