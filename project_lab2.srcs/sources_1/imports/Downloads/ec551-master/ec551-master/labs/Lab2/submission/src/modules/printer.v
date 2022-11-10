
`define STRING_NONE    3'b000
`define STRING_INTRO   3'b001
`define STRING_BENCH   3'b010
`define STRING_ALU     3'b011
`define STRING_CPU     3'b100
`define STRING_INVALID 3'b101
`define STRING_REPORT  3'b110


`define REPORT_NONE  3'b000
`define REPORT_ALU   3'b001
`define REPORT_CPU   3'b010
`define REPORT_BENCH 3'b011

module Printer (
        output reg         print_en,
        output reg  [ 7:0] print_char,
        output reg         print_done,

        input  wire [ 7:0] key_in,
        input  wire        key_valid,

        input  wire [15:0] alu_in,
        input  wire        alu_valid,

        input  wire [31:0] cpu_in,
        input  wire        cpu_valid,

        input  wire [ 7:0] bench_in,
        input  wire        bench_valid,

        input  wire [ 2:0] print_cmd,

        input  wire        clk,
        input  wire        rst
    );

    reg [6:0] print_counter;

    reg [2:0] print_report_target;

    always @(posedge clk) begin
        if (rst) begin
            print_report_target <= `REPORT_NONE;
        end else if (alu_valid) begin
            print_report_target <= `REPORT_ALU;
        end else if (cpu_valid) begin
            print_report_target <= `REPORT_CPU;
        end else if (bench_valid) begin
            print_report_target <= `REPORT_BENCH;
        end
    end

    always @(posedge clk) begin
        if (rst) begin
            print_en <= 0;
            print_counter <= 0;
            print_char <= 0;
            print_done <= 0;

        end else if (print_cmd == `STRING_NONE) begin
            if (key_valid) begin
                print_en <= 1;
					 print_char <= key_in;
						
            end else begin
                print_en <= 0;
                print_char <= 0;
            end
            print_counter <= 0;
            print_done <= 0;

        end else if (print_cmd == `STRING_INTRO) begin
            case (print_counter)
                0: begin print_char <= 72; print_counter <= print_counter + 1; print_en <= 1; end
                1: begin print_char <= 69; print_counter <= print_counter + 1; print_en <= 1; end
                2: begin print_char <= 76; print_counter <= print_counter + 1; print_en <= 1; end
                3: begin print_char <= 76; print_counter <= print_counter + 1; print_en <= 1; end
                4: begin print_char <= 79; print_counter <= print_counter + 1; print_en <= 1; end
                5: begin print_char <= 32; print_counter <= print_counter + 1; print_en <= 1; end
                6: begin print_char <= 69; print_counter <= print_counter + 1; print_en <= 1; end
                7: begin print_char <= 67; print_counter <= print_counter + 1; print_en <= 1; end
                8: begin print_char <= 53; print_counter <= print_counter + 1; print_en <= 1; end
                9: begin print_char <= 53; print_counter <= print_counter + 1; print_en <= 1; end
                10: begin print_char <= 49; print_counter <= print_counter + 1; print_en <= 1; end
                11: begin print_char <= 46; print_counter <= print_counter + 1; print_en <= 1; end
                12: begin print_char <= 13; print_counter <= print_counter + 1; print_en <= 1; end
                13: begin print_char <= 77; print_counter <= print_counter + 1; print_en <= 1; end
                14: begin print_char <= 89; print_counter <= print_counter + 1; print_en <= 1; end
                15: begin print_char <= 32; print_counter <= print_counter + 1; print_en <= 1; end
                16: begin print_char <= 78; print_counter <= print_counter + 1; print_en <= 1; end
                17: begin print_char <= 65; print_counter <= print_counter + 1; print_en <= 1; end
                18: begin print_char <= 77; print_counter <= print_counter + 1; print_en <= 1; end
                19: begin print_char <= 69; print_counter <= print_counter + 1; print_en <= 1; end
                20: begin print_char <= 32; print_counter <= print_counter + 1; print_en <= 1; end
                21: begin print_char <= 73; print_counter <= print_counter + 1; print_en <= 1; end
                22: begin print_char <= 83; print_counter <= print_counter + 1; print_en <= 1; end
                23: begin print_char <= 58; print_counter <= print_counter + 1; print_en <= 1; end
                24: begin print_char <= 32; print_counter <= print_counter + 1; print_en <= 1; end
                25: begin print_char <= 66; print_counter <= print_counter + 1; print_en <= 1; end
                26: begin print_char <= 79; print_counter <= print_counter + 1; print_en <= 1; end
                27: begin print_char <= 88; print_counter <= print_counter + 1; print_en <= 1; end
                28: begin print_char <= 13; print_counter <= print_counter + 1; print_en <= 1; end
                29: begin print_char <= 80; print_counter <= print_counter + 1; print_en <= 1; end
                30: begin print_char <= 76; print_counter <= print_counter + 1; print_en <= 1; end
                31: begin print_char <= 69; print_counter <= print_counter + 1; print_en <= 1; end
                32: begin print_char <= 65; print_counter <= print_counter + 1; print_en <= 1; end
                33: begin print_char <= 83; print_counter <= print_counter + 1; print_en <= 1; end
                34: begin print_char <= 69; print_counter <= print_counter + 1; print_en <= 1; end
                35: begin print_char <= 32; print_counter <= print_counter + 1; print_en <= 1; end
                36: begin print_char <= 69; print_counter <= print_counter + 1; print_en <= 1; end
                37: begin print_char <= 78; print_counter <= print_counter + 1; print_en <= 1; end
                38: begin print_char <= 84; print_counter <= print_counter + 1; print_en <= 1; end
                39: begin print_char <= 69; print_counter <= print_counter + 1; print_en <= 1; end
                40: begin print_char <= 82; print_counter <= print_counter + 1; print_en <= 1; end
                41: begin print_char <= 32; print_counter <= print_counter + 1; print_en <= 1; end
                42: begin print_char <= 65; print_counter <= print_counter + 1; print_en <= 1; end
                43: begin print_char <= 32; print_counter <= print_counter + 1; print_en <= 1; end
                44: begin print_char <= 77; print_counter <= print_counter + 1; print_en <= 1; end
                45: begin print_char <= 79; print_counter <= print_counter + 1; print_en <= 1; end
                46: begin print_char <= 68; print_counter <= print_counter + 1; print_en <= 1; end
                47: begin print_char <= 69; print_counter <= print_counter + 1; print_en <= 1; end
                48: begin print_char <= 58; print_counter <= print_counter + 1; print_en <= 1; end
                49: begin print_char <= 13; print_counter <= print_counter + 1; print_en <= 1; end
                default: begin print_char <= 0; print_en <= 0; print_done <= 1; end
                
            endcase

        end else if (print_cmd == `STRING_BENCH) begin
            case (print_counter)
                0: begin print_char <= 66; print_counter <= print_counter + 1; print_en <= 1; end
                1: begin print_char <= 69; print_counter <= print_counter + 1; print_en <= 1; end
                2: begin print_char <= 78; print_counter <= print_counter + 1; print_en <= 1; end
                3: begin print_char <= 67; print_counter <= print_counter + 1; print_en <= 1; end
                4: begin print_char <= 72; print_counter <= print_counter + 1; print_en <= 1; end
                5: begin print_char <= 77; print_counter <= print_counter + 1; print_en <= 1; end
                6: begin print_char <= 65; print_counter <= print_counter + 1; print_en <= 1; end
                7: begin print_char <= 82; print_counter <= print_counter + 1; print_en <= 1; end
                8: begin print_char <= 75; print_counter <= print_counter + 1; print_en <= 1; end
                9: begin print_char <= 32; print_counter <= print_counter + 1; print_en <= 1; end
                10: begin print_char <= 77; print_counter <= print_counter + 1; print_en <= 1; end
                11: begin print_char <= 79; print_counter <= print_counter + 1; print_en <= 1; end
                12: begin print_char <= 68; print_counter <= print_counter + 1; print_en <= 1; end
                13: begin print_char <= 69; print_counter <= print_counter + 1; print_en <= 1; end
                14: begin print_char <= 13; print_counter <= print_counter + 1; print_en <= 1; end
                default: begin print_char <= 0; print_en <= 0; print_done <= 1; end

            endcase
        
        end else if (print_cmd == `STRING_ALU) begin
            case (print_counter)
                0: begin print_char <= 65; print_counter <= print_counter + 1; print_en <= 1; end
                1: begin print_char <= 76; print_counter <= print_counter + 1; print_en <= 1; end
                2: begin print_char <= 85; print_counter <= print_counter + 1; print_en <= 1; end
                3: begin print_char <= 32; print_counter <= print_counter + 1; print_en <= 1; end
                4: begin print_char <= 77; print_counter <= print_counter + 1; print_en <= 1; end
                5: begin print_char <= 79; print_counter <= print_counter + 1; print_en <= 1; end
                6: begin print_char <= 68; print_counter <= print_counter + 1; print_en <= 1; end
                7: begin print_char <= 69; print_counter <= print_counter + 1; print_en <= 1; end
                8: begin print_char <= 13; print_counter <= print_counter + 1; print_en <= 1; end
                default: begin print_char <= 0; print_en <= 0; print_done <= 1; end

            endcase

        end else if (print_cmd == `STRING_CPU) begin
            case (print_counter)
                0: begin print_char <= 67; print_counter <= print_counter + 1; print_en <= 1; end
                1: begin print_char <= 80; print_counter <= print_counter + 1; print_en <= 1; end
                2: begin print_char <= 85; print_counter <= print_counter + 1; print_en <= 1; end
                3: begin print_char <= 32; print_counter <= print_counter + 1; print_en <= 1; end
                4: begin print_char <= 77; print_counter <= print_counter + 1; print_en <= 1; end
                5: begin print_char <= 79; print_counter <= print_counter + 1; print_en <= 1; end
                6: begin print_char <= 68; print_counter <= print_counter + 1; print_en <= 1; end
                7: begin print_char <= 69; print_counter <= print_counter + 1; print_en <= 1; end
                8: begin print_char <= 13; print_counter <= print_counter + 1; print_en <= 1; end
                default: begin print_char <= 0; print_en <= 0; print_done <= 1; end

            endcase

        end else if (print_cmd == `STRING_INVALID) begin
            case (print_counter)
                0: begin print_char <= 73; print_counter <= print_counter + 1; print_en <= 1; end
                1: begin print_char <= 78; print_counter <= print_counter + 1; print_en <= 1; end
                2: begin print_char <= 86; print_counter <= print_counter + 1; print_en <= 1; end
                3: begin print_char <= 65; print_counter <= print_counter + 1; print_en <= 1; end
                4: begin print_char <= 76; print_counter <= print_counter + 1; print_en <= 1; end
                5: begin print_char <= 73; print_counter <= print_counter + 1; print_en <= 1; end
                6: begin print_char <= 68; print_counter <= print_counter + 1; print_en <= 1; end
                7: begin print_char <= 32; print_counter <= print_counter + 1; print_en <= 1; end
                8: begin print_char <= 67; print_counter <= print_counter + 1; print_en <= 1; end
                9: begin print_char <= 79; print_counter <= print_counter + 1; print_en <= 1; end
                10: begin print_char <= 77; print_counter <= print_counter + 1; print_en <= 1; end
                11: begin print_char <= 77; print_counter <= print_counter + 1; print_en <= 1; end
                12: begin print_char <= 65; print_counter <= print_counter + 1; print_en <= 1; end
                13: begin print_char <= 78; print_counter <= print_counter + 1; print_en <= 1; end
                14: begin print_char <= 68; print_counter <= print_counter + 1; print_en <= 1; end
                15: begin print_char <= 13; print_counter <= print_counter + 1; print_en <= 1; end
                default: begin print_char <= 0; print_en <= 0; print_done <= 1; end
            
            endcase

        end else if (print_cmd == `STRING_REPORT) begin
            if (print_report_target == `REPORT_ALU) begin
                case (print_counter)
                    0: begin print_char <= alu_in[15:8]; print_counter <= print_counter + 1; print_en <= 1; end
                    1: begin print_char <= alu_in[7:0]; print_counter <= print_counter + 1; print_en <= 1; end
						  2: begin print_char <= 13; print_counter <= print_counter + 1; print_en <= 1; end
                    default: begin print_char <= 0; print_en <= 0; print_done <= 1; end
                endcase
            end else if (print_report_target == `REPORT_CPU) begin
                case (print_counter)
                    0: begin print_char <= cpu_in[31:24]; print_counter <= print_counter + 1; print_en <= 1; end
                    1: begin print_char <= cpu_in[23:16]; print_counter <= print_counter + 1; print_en <= 1; end
                    2: begin print_char <= cpu_in[15:8]; print_counter <= print_counter + 1; print_en <= 1; end
                    3: begin print_char <= cpu_in[7:0]; print_counter <= print_counter + 1; print_en <= 1; end
						  4: begin print_char <= 13; print_counter <= print_counter + 1; print_en <= 1; end
                    default: begin print_char <= 0; print_en <= 0; print_done <= 1; end
                endcase
            end else if (print_report_target == `REPORT_BENCH) begin
                if (bench_valid) begin
                    print_char <= bench_in;
                    print_en <= 1;
                end else begin
                    print_char <= 0;
                    print_done <= 1;
                    print_en <= 0;
                end
            end


        end else begin
            print_en <= 0;
            print_counter <= 0;
            print_char <= 0;
        end
    end
endmodule

