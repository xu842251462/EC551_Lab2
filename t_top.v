module t_top(
    
    );
     reg CLK;
     reg PS2_CLK;
     reg PS2_DATA;            
     reg rst;
     wire UART_RXD_OUT;
     
     top uut(
        .CLK(CLK),
        .PS2_CLK(PS2_CLK),
        .PS2_DATA(PS2_DATA),
        .rst(rst),
        .UART_RXD_OUT(UART_RXD_OUT)
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
