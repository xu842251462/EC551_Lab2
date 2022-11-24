`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2022 03:36:58 PM
// Design Name: 
// Module Name: t_top
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


module t_top(
    
    );
     reg CLK;
     reg PS2_CLK;
     reg PS2_DATA;            
     reg rst;
     wire UART_RXD_OUT;
     
     wire         uartRdy;
     wire [7:0]   uartData;
     wire         uartTX;
     wire [7:0]   option; //for choosing module   
     wire [31:0]  keyb;
       
     wire [111:0] cpu_reg;
     wire         cpu_reg_valid;
     wire [7:0]   key_in;
     wire         key_valid;
     
     top uut(
        .CLK(CLK),
        .PS2_CLK(PS2_CLK),
        .PS2_DATA(PS2_DATA),
        .rst(rst),
        .UART_RXD_OUT(UART_RXD_OUT),
        
        .uartRdy(uartRdy),  
        .uartData(uartData),
        .uartTX(uartTX),
        .option(option),
        .keyb(keyb),

        .cpu_reg(cpu_reg),      
        .cpu_reg_valid(cpu_reg_valid),
        .key_in(key_in),           
        .key_valid(key_valid)  
     );  
     
    initial begin
        CLK = 1;
        forever #5 CLK = ~CLK;
    end
     
    initial begin
        PS2_CLK = 1;
        forever #5 PS2_CLK = ~PS2_CLK;
    end

    initial begin
        rst = 1;
        #10 rst = 0;
    end

    initial begin
        PS2_DATA <= 8'h61; //A
        #100
        PS2_DATA <= 8'h34; //4
        #100
        PS2_DATA <= 8'h2B; //4
        #100
        PS2_DATA <= 8'h37; //+
        #100
        PS2_DATA <= 8'h0A; //7
    
    end
     
endmodule
