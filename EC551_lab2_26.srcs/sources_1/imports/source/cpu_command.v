
module CpuCommand (
        input wire [127:0] buffer,//from buffer
        input wire         buffer_valid,

//        output reg  [31:0] print_data,
        output wire         cpu_reg_valid,
        output wire [111:0] cpu_reg,

        input wire clk,
        input wire rst
    );

    reg [15:0] hex_decode;

    reg [11:0] mem_addr;  //from memory, save value 
    reg [15:0] mem_data;  //from memory, save value 
    reg        mem_valid; //from memory, save value 
    wire cpu_done;

    

    Cpu cpu (
        .regexpose(cpu_reg),
        .done(cpu_done),

        .memhack_addr(mem_addr),//in
        .memhack_data(mem_data),//in
        .memhack_valid(mem_valid),//in

        .clk(clk),
        .rst(rst)
    );
    
    //when enter 'r', it will execute
    always @(posedge clk) begin
        if (rst) begin
            mem_addr <= 31;
            mem_data <= 0;
            mem_valid <= 0;
        end else if (buffer_valid) begin
            if (buffer[127:120] == "r") begin
            end else begin
                mem_data <= hex_decode;
                mem_addr <= mem_addr + 1;
                mem_valid <= 1;
            end
        end else begin
            mem_valid <= 0;
        end
    end
    
    assign cpu_reg_valid = mem_valid;

    always @(*) begin
        case (buffer[119:112])
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
        case (buffer[111:104])
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
        case (buffer[103:96])
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
        case (buffer[95:88])
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

