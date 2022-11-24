`EXE_STRING_CPU:if (uartRdy == 1) begin 
                                     if (keyb[15:8] != 8'hf0) begin
                                         q <= 1;
                                         uartSend <= 0;
                                     end else if (q == 1) begin
                                         if (keyb[7:0] != 8'h52 && keyb[7:0] != 8'h72) begin
                                             uartSend <= 1;
                                             uartData <= keyb[7:0];
                                             key_in <= keyb[7:0]; //pass value to internal processing
                                             key_valid <= 1; //pass valid to internal processing
                                             
                                             state <= `EXE_STATE_CPU1;
                                         end
                                         q<=0; 
                                      end else begin
                                           uartSend <= 0;
                                           state <= `EXE_STRING_CPU;
                                      end                         
                               end
                  
                               //second num           
                  `EXE_STATE_CPU1: if (uartRdy == 1) begin 
                                     if (keyb[15:8] != 8'hf0) begin
                                         q <= 1;
                                         uartSend <= 0;
                                     end else if (q == 1) begin
                                         if (keyb[7:0] != 8'h52 && keyb[7:0] != 8'h72) begin
                                             uartSend <= 1;
                                             uartData <= keyb[7:0];
                                             key_in <= keyb[7:0]; //pass value to internal processing
                                             key_valid <= 1; //pass valid to internal processing                                            
                                             state <= `EXE_STATE_CPU2; 
                                        
                                         end
                                         q<=0; 
                                      end else begin
                                           uartSend <= 0;
                                           state <= `EXE_STATE_CPU1;
                                      end                         
                               end
                              //third num 
                 `EXE_STATE_CPU2: if (uartRdy == 1) begin 
                                     if (keyb[15:8] != 8'hf0) begin
                                         q <= 1;
                                         uartSend <= 0;
                                     end else if (q == 1) begin
                                         if (keyb[7:0] != 8'h52 && keyb[7:0] != 8'h72) begin
                                             uartSend <= 1;
                                             uartData <= keyb[7:0];
                                             key_in <= keyb[7:0]; //pass value to internal processing
                                             key_valid <= 1; //pass valid to internal processing 
                                            
                                             state <= `EXE_STATE_CPU3; 
                                        
                                         end
                                         q<=0; 
                                      end else begin
                                           uartSend <= 0;
                                           state <= `EXE_STATE_CPU2;
                                      end                         
                               end
                               //fourth num
                 `EXE_STATE_CPU3: if (uartRdy == 1) begin 
                                     if (keyb[15:8] != 8'hf0) begin
                                         q <= 1;
                                         uartSend <= 0;
                                     end else if (q == 1) begin
                                         if (keyb[7:0] != 8'h52 && keyb[7:0] != 8'h72) begin
                                             uartSend <= 1;
                                             uartData <= keyb[7:0];
                                             key_in <= keyb[7:0]; //pass value to internal processing
                                             key_valid <= 1; //pass valid to internal processing 
                                            
                                             state <= `EXE_STATE_CPU4; 
                                
                                         end
                                         q<=0; 
                                      end else begin
                                           uartSend <= 0;
                                           state <= `EXE_STATE_CPU3;
                                      end                         
                               end
                               
                               //'r' for cpu
                  `EXE_STATE_CPU4: if (uartRdy == 1) begin 
                                     if (keyb[15:8] != 8'hf0) begin
                                         q <= 1;
                                         uartSend <= 0;
                                     end else if (q == 1) begin
                                         if (keyb[7:0] == 8'h52 || keyb[7:0] == 8'h72) begin
                                             uartSend <= 1;
                                             uartData <= keyb[7:0];
                                             key_in <= keyb[7:0]; //pass value to internal processing
                                             key_valid <= 1; //pass valid to internal processing 
                                            
                                             state <= `EXE_STATE_CPU5; 
                                
                                         end
                                         q<=0; 
                                      end else begin
                                           uartSend <= 0;
                                           state <= `EXE_STATE_CPU4;
                                      end                         
                               end
                               //enter
                  `EXE_STATE_CPU5: if (uartRdy == 1) begin 
                                     if (keyb[15:8] != 8'hf0) begin
                                         q <= 1;
                                         uartSend <= 0;
                                     end else if (q == 1) begin
                                         if (keyb[7:0] == 8'h0A) begin
                                             uartSend <= 1;
                                             uartData <= keyb[7:0];
                                             key_in <= keyb[7:0]; //pass value to internal processing
                                             key_valid <= 1; //pass valid to internal processing 
                                            
                                             state <= `PRINT_CPU; 
                                
                                         end
                                         q<=0; 
                                      end else begin
                                           uartSend <= 0;
                                           state <= `EXE_STATE_CPU5;
                                      end                         
                               end 

                 `PRINT_CPU:  if(uartRdy == 1) begin
                                    uartSend <= cpu_reg_valid;
                                    uartData <= cpu_reg + 8'h30;
                                    state = `END;
                              end
