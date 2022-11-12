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
                                end else if ( q == 1) begin
                                    if (keyb[7:0] >= 8'h30 && keyb[7:0] <= 8'h39) begin
                                    uartSend <= 1;
                                    uartData <= keyb[7:0];
                                   // number <= number * 10 + key - 8'h30;
                                    number <= {{6'b0},{keyb[7:0]-8'h30}};
                                    end else if (keyb[7:0] == 8'h0A) begin
                                    /*uartSend <= 1;
                                    uartData <= result;*/
                                    state <= `PRINT_RESULT;
                                    end 
                                    q<=0; 
                               end else begin
                                    uartSend <= 0;
                                    uartData <= 8'h20;
                                    state <= `EXEC_STATE_BENCH;
                               end
                          
                                end
                   `PRINT_RESULT : if(uartRdy == 1) begin
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
