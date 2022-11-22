
`define OP_NOP   4'b0000
`define OP_ADD   4'b0001
`define OP_SUB   4'b0010
`define OP_INC   4'b0011
`define OP_XOR   4'b0100
`define OP_CMP   4'b0101
`define OP_SADD  4'b0110
`define OP_SSUB  4'b0111
`define OP_SMULT 4'b1000
`define OP_SDIV  4'b1001
`define OP_A     4'b1010
`define OP_B     4'b1011

`define SEL_NON 2'b00
`define SEL_REG 2'b01
`define SEL_MEM 2'b10
`define SEL_IMM 2'b11

`define PCSEL_INC 3'b000
`define PCSEL_JMP 3'b001
`define PCSEL_JE  3'b010
`define PCSEL_JNE 3'b011
`define PCSEL_HLT 3'b100

`define INST_HALT 4'b0000
`define INST_INC  4'b0001
`define INST_JMP  4'b0010
`define INST_JNE  4'b0011
`define INST_JE   4'b0100
`define INST_ADD  4'b0101
`define INST_SUB  4'b0110
`define INST_XOR  4'b0111
`define INST_CMP  4'b1000
`define INST_LIMM 4'b1001
`define INST_MOV  4'b1010
`define INST_SW   4'b1011
`define INST_LW   4'b1100
`define INST_SPEC 4'b1101

module Cpu(
	output wire [111:0] regexpose,

    output wire done,

    input wire [11:0] memhack_addr,
    input wire [15:0] memhack_data,
    input wire        memhack_valid,

	input wire clk,
	input wire rst
);
	reg  [15:0] pc; //pass pc counter to reg_file/memory
	wire [15:0] pc_next;
	reg         cmp_eq;

	wire [15:0] instruction;

	wire [15:0] imm_a;
	wire [ 2:0] reg_src_a;
	wire [ 1:0] a_sel;
	wire [15:0] a_reg_out;
	wire [15:0] a_data;

	wire [15:0] imm_b;
	wire [ 2:0] reg_src_b;
	wire [ 1:0] b_sel;
	wire [15:0] b_reg_out;
	wire [15:0] b_data;

	wire [ 3:0] alu_op;
	wire [15:0] alu_out;

	wire [ 2:0] reg_w;
	wire        reg_w_en;

	wire        mem_w_en;
	wire [15:0] mem_w_data;
	wire [15:0] mem_r_data;

	wire        cmp_write;

	wire [ 2:0] pc_sel;
	wire [15:0] jump_target;

	Idecode idecode(
		.instruction(instruction),

		.imm_a(imm_a),
		.reg_a(reg_src_a),
		.a_sel(a_sel),

		.imm_b(imm_b),
		.reg_b(reg_src_b),
		.b_sel(b_sel),

		.alu_op(alu_op),

		.reg_w(reg_w),
		.reg_w_en(reg_w_en),

		.mem_w_en(mem_w_en),

		.cmp_write(cmp_write),

		.pc_sel(pc_sel), 
		.jump_target(jump_target), //connect to the decode, which decide the jump step

		.clk(clk),
		.rst(rst)
	);

	Regfile regfile(
		.a_data(a_reg_out),
		.a_sel(reg_src_a),

		.b_data(b_reg_out),
		.b_sel(reg_src_b),

		.w_data(alu_out),
		.w_sel(reg_w),
		.w_en(reg_w_en),
		
		.r6(pc),
		
		.regexpose(regexpose),
		
		.clk(clk),
		.rst(rst)
	);

	Memory memory(
		.r_addr(b_reg_out[11:0]),
		.r_data(mem_r_data),

		.w_addr(a_reg_out[11:0]),
		.w_data(alu_out),
		.w_en(mem_w_en),

		.pc(pc_next[11:0]),
		.inst(instruction),

        .w_addr_b(memhack_addr),
        .w_data_b(memhack_data),
        .w_en_b(memhack_valid),

		.clk(clk),
		.rst(rst)
	);

	assign a_data = (a_sel == `SEL_REG ? a_reg_out : 16'b0);
	assign b_data = (
		b_sel == `SEL_REG ? b_reg_out :
		b_sel == `SEL_MEM ? mem_r_data :
		b_sel == `SEL_IMM ? imm_b :
		16'b0
	);

	Alu alu(
		.a_data(a_data),
		.b_data(b_data),
		.alu_op(alu_op),
		.out(alu_out),
		.clk(clk),
		.rst(rst)
	);
    
    //pc counter, which choose to jump or next instr
	assign pc_next = (
		(rst)                             ? 16'h001f    :
		(pc_sel == `PCSEL_HLT)            ? pc          :
		(pc_sel == `PCSEL_JMP)            ? jump_target :
		(pc_sel == `PCSEL_JE && cmp_eq)   ? jump_target :
		(pc_sel == `PCSEL_JNE && ~cmp_eq) ? jump_target :
		                                    pc + 1
	);

    assign done = (pc_sel == `PCSEL_HLT);


	always @(posedge clk) begin
		if (rst) begin
			cmp_eq = 0;
		end else if (cmp_write) begin
			cmp_eq = alu_out ? 1'b1 : 1'b0;
		end

		if (rst) begin
			pc = 31;
		end else begin
			pc = pc_next;
		end
	end
	
endmodule

