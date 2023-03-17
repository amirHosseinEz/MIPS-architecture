`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:33:44 11/30/2022 
// Design Name: 
// Module Name:    MIPS 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module MIPS(
    );
	reg clk;

	////fetch
	wire [31:0] nextpc;
	wire [31:0] instruction;
	wire pcsrc; // initialized with 0
	wire [31:0] branch_target_out_EX_MEM;

	///IF/ID
	wire [31:0] instruction_out;
	wire [31:0] next_pc_out;
	
	///decode
	wire [5:0] opcode;
	wire [31:0] read_data1;
	wire [31:0] read_data2;
	wire [31:0] sign_extended_immediate;
	wire [4:0] rt;
	wire [4:0] rd;
	wire reg_write_out_MEM_WB;
	wire [4:0] write_reg_out_MEM_WB;
	
	///control unit
	wire regdst;
	wire ALUsrc;
	wire memtoreg;
	wire regwrite;
	wire memRead;
	wire memwrite;
	wire branch;
	wire [2:0] ALUop;
	
	///ID/EX
	wire [31:0] read_data_1_out_EX;
	wire [31:0] read_data_2_out_EX;
	wire [31:0] immeadiate_out_EX;
	wire reg_dst_out_EX;
	wire alu_src_out_EX;
	wire mem_to_reg_out_EX;
	wire reg_write_out_EX;
	wire mem_read_out_EX ;
   wire mem_write_out_EX;
	wire branch_out_EX;
	wire [2:0] alu_op_out_EX;
	wire [4:0] rt_out_EX;
	wire [4:0] rd_out_EX;
	wire [5:0] funct_out_EX;
	wire [31:0] next_pc_out_EX;
	
	///execute
	wire [31:0] alu_result_EXE;
	wire ZERO;
	wire [31:0] ALUReadData2_Out;
	wire [31:0] AddResult;
	wire [4:0] RdOrRt;
	
	///EX/MEM
	wire [31:0] alu_result_out_EX_MEM;
	wire [31:0] read_data_2_out_EX_MEM;
	wire [4:0] write_reg_out_EX_MEM;
	wire zeroflagOut_EX_MEM;
	wire mem_to_reg_out_EX_MEM;
	wire reg_write_out_EX_MEM;
	wire mem_read_out_EX_MEM;
	wire mem_write_out_EX_MEM;
	wire branch_out_EX_MEM;
	
	///data memory
	wire [31:0] read_data_out_data_memory;
	
	///mem writeback
	wire [31:0] read_data_out_MEM_WB;
	wire [31:0] alu_result_out_MEM_WB;
	wire mem_to_reg_out_MEM_WB;
	wire [31:0] write_data_out_write_back;

	

	 

	 initial begin
		clk = 0;
		//pcsrc = 1'b0;
	 end
	 
	 always #10 clk = ~clk;
	 
	//============fetch==============
	 fetch_module fetch_module1 (
    .branch_target(branch_target_out_EX_MEM), 
    .clk(clk), 
    .pc_src(pcsrc), 
    .instruction(instruction), 
    .nextpc(nextpc), 
    .hit(hit)
    );

	//============IF/ID==============


	IF_ID_regs IF_ID_regs1 (
    .clk(clk), 
    .next_pc(nextpc), 
    .instruction(instruction), 
    .hit(hit), 
    .next_pc_out(next_pc_out), 
    .instruction_out(instruction_out)
    );

	//============decode==============

	

	decode_module decode_module1 (
    .clk(clk), 
    .instruction(instruction_out), 
    .reg_write(reg_write_out_MEM_WB), 
    .write_reg(write_reg_out_MEM_WB), 
    .write_data(write_data_out_write_back), 
    .read_data_1(read_data1), 
    .read_data_2(read_data2), 
    .sign_extended_immediate(sign_extended_immediate), 
    .rt(rt), 
    .rd(rd), 
    .opcode(opcode)
    );
	 
	//============CONTROL UNIT==============


	 
	 control_unit control_unit1(
    .opcode(opcode), 
    .reg_dst(regdst), 
    .alu_src(ALUsrc), 
    .mem_to_reg(memtoreg), 
    .reg_write(regwrite), 
    .mem_read(memRead), 
    .mem_write(memwrite), 
    .branch(branch), 
    .alu_op(ALUop)
    );
	 //============ID/EX==============


	ID_EX_reg ID_EX_reg1 (
    .clk(clk), 
    .hit(hit), 
    .read_data_1(read_data1), 
    .read_data_2(read_data2), 
    .immeadiate(sign_extended_immediate), 
    .reg_dst(regdst), 
    .alu_src(ALUsrc), 
    .mem_to_reg(memtoreg), 
    .reg_write(regwrite), 
    .mem_read(memRead), 
    .mem_write(memwrite), 
    .branch(branch), 
    .alu_op(ALUop), 
    .rt(rt), 
    .rd(rd), 
    .funct(sign_extended_immediate[5:0]), 
    .next_pc(next_pc_out), 
    .read_data_1_out(read_data_1_out_EX), 
    .read_data_2_out(read_data_2_out_EX), 
    .immeadiate_out(immeadiate_out_EX), 
    .reg_dst_out(reg_dst_out_EX), 
    .alu_src_out(alu_src_out_EX), 
    .mem_to_reg_out(mem_to_reg_out_EX), 
    .reg_write_out(reg_write_out_EX), 
    .mem_read_out(mem_read_out_EX), 
    .mem_write_out(mem_write_out_EX), 
    .branch_out(branch_out_EX), 
    .alu_op_out(alu_op_out_EX), 
    .rt_out(rt_out_EX), 
    .rd_out(rd_out_EX), 
    .funct_out(funct_out_EX), 
    .next_pc_out(next_pc_out_EX)
    );
	 
	//============Execute==============

	execute_module execute_module1 (
    .clk(clk), 
    .alu_read_data_1(read_data_1_out_EX), 
    .alu_read_data_2(read_data_2_out_EX), 
    .immediate(immeadiate_out_EX), 
    .funct(funct_out_EX),
    .alu_op(alu_op_out_EX), 
    .alu_src(alu_src_out_EX), 
	 .PC(next_pc_out_EX), 
    .rt(rt_out_EX), 
    .rd(rd_out_EX), 
    .RegDst(reg_dst_out_EX),
	 
    .alu_result(alu_result_EXE), 
    .ZERO(ZERO),
	 .AddResult(AddResult), 
    .ALUReadData2_Out(ALUReadData2_Out), 
    .RdOrRt(RdOrRt)
    );
	
	//==========EX/MEM reg=============

	EX_MEM_reg EX_MEM_reg1 (
    .clk(clk), 
    .hit(hit), 
    .branch_target(AddResult), 
    .alu_result(alu_result_EXE), 
    .read_data_2(read_data_2_out_EX), 
    .write_reg(RdOrRt), 
    .branch(branch_out_EX), 
    .zeroflag(ZERO), 
    .mem_to_reg(mem_to_reg_out_EX), 
    .reg_write(reg_write_out_EX), 
    .mem_read(mem_read_out_EX), 
    .mem_write(mem_write_out_EX),
    .branch_target_out(branch_target_out_EX_MEM), 
    .alu_result_out(alu_result_out_EX_MEM), 
    .read_data_2_out(read_data_2_out_EX_MEM),
    .write_reg_out(write_reg_out_EX_MEM), 
    .zeroflagOut(zeroflagOut_EX_MEM), 
    .mem_to_reg_out(mem_to_reg_out_EX_MEM), 
    .reg_write_out(reg_write_out_EX_MEM), 
    .mem_read_out(mem_read_out_EX_MEM), 
    .mem_write_out(mem_write_out_EX_MEM), 
    .branch_out(branch_out_EX_MEM),
	 .pcsrc_ex_mem(pcsrc)
    );
	// always @(negedge clk)
		//if(zeroflagOut_EX_MEM & branch_out_EX_MEM)
		//	pcsrc = 1;
		//else
		//	pcsrc = 0;
			

	 

	

	//==========Data memory============
	

	data_memory data_memory1 (
    .clk(clk), 
    .address(alu_result_out_EX_MEM), 
    .write_data(read_data_2_out_EX_MEM), 
    .mem_read(mem_read_out_EX_MEM), 
    .mem_write(mem_write_out_EX_MEM), 
    .read_data(read_data_out_data_memory)
    );
	 //=========MEM/WB reg=============

	 MEM_WB_reg MEM_WB_reg1 (
    .clk(clk), 
    .hit(hit), 
    .read_data(read_data_out_data_memory), 
    .alu_result(alu_result_out_EX_MEM), 
    .write_reg(write_reg_out_EX_MEM), 
    .reg_write(reg_write_out_EX_MEM), 
    .mem_to_reg(mem_to_reg_out_EX_MEM), 
    .read_data_out(read_data_out_MEM_WB), 
    .alu_result_out(alu_result_out_MEM_WB), 
    .write_reg_out(write_reg_out_MEM_WB), 
    .reg_write_out(reg_write_out_MEM_WB), 
    .mem_to_reg_out(mem_to_reg_out_MEM_WB)
    );
	 //=======write back=============

	 write_back instance_name (
    .mem_to_reg(mem_to_reg_out_MEM_WB), 
    .read_data(read_data_out_MEM_WB), 
    .alu_result(alu_result_out_MEM_WB), 
    .write_data(write_data_out_write_back)
    );



endmodule
