`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:40:31 12/07/2022
// Design Name:   ID_EX_reg
// Module Name:   C:/Users/user0/Desktop/New folder (13)/MIPS/ID_EX_TB.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ID_EX_reg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ID_EX_TB;

	// Inputs
	reg clk;
	reg hit;
	reg [31:0] read_data_1;
	reg [31:0] read_data_2;
	reg [31:0] immeadiate;
	reg reg_dst;
	reg alu_src;
	reg mem_to_reg;
	reg reg_write;
	reg mem_read;
	reg mem_write;
	reg branch;
	reg [2:0] alu_op;
	reg [4:0] rt;
	reg [4:0] rd;
	reg [5:0] funct;
	reg [31:0] next_pc;

	// Outputs
	wire [31:0] read_data_1_out;
	wire [31:0] read_data_2_out;
	wire [31:0] immeadiate_out;
	wire reg_dst_out;
	wire alu_src_out;
	wire mem_to_reg_out;
	wire reg_write_out;
	wire mem_read_out;
	wire mem_write_out;
	wire branch_out;
	wire [2:0] alu_op_out;
	wire [4:0] rt_out;
	wire [4:0] rd_out;
	wire [5:0] funct_out;
	wire [31:0] next_pc_out;

	// Instantiate the Unit Under Test (UUT)
	ID_EX_reg uut (
		.clk(clk), 
		.hit(hit), 
		.read_data_1(read_data_1), 
		.read_data_2(read_data_2), 
		.immeadiate(immeadiate), 
		.reg_dst(reg_dst), 
		.alu_src(alu_src), 
		.mem_to_reg(mem_to_reg), 
		.reg_write(reg_write), 
		.mem_read(mem_read), 
		.mem_write(mem_write), 
		.branch(branch), 
		.alu_op(alu_op), 
		.rt(rt), 
		.rd(rd), 
		.funct(funct), 
		.next_pc(next_pc), 
		.read_data_1_out(read_data_1_out), 
		.read_data_2_out(read_data_2_out), 
		.immeadiate_out(immeadiate_out), 
		.reg_dst_out(reg_dst_out), 
		.alu_src_out(alu_src_out), 
		.mem_to_reg_out(mem_to_reg_out), 
		.reg_write_out(reg_write_out), 
		.mem_read_out(mem_read_out), 
		.mem_write_out(mem_write_out), 
		.branch_out(branch_out), 
		.alu_op_out(alu_op_out), 
		.rt_out(rt_out), 
		.rd_out(rd_out), 
		.funct_out(funct_out), 
		.next_pc_out(next_pc_out)
	);

	initial begin
		// Initialize Inputs
		clk = 1;
		hit = 1;
		read_data_1 = 0;
		read_data_2 = 0;
		immeadiate = 0;
		reg_dst = 0;
		alu_src = 0;
		mem_to_reg = 0;
		reg_write = 0;
		mem_read = 0;
		mem_write = 0;
		branch = 0;
		alu_op = 0;
		rt = 0;
		rd = 0;
		funct = 0;
		next_pc = 0;

		// Wait 100 ns for global reset to finish
		#100;
		clk = 0;
		hit = 1;
		read_data_1 = 0;
		read_data_2 = 1;
		immeadiate = 0;
		reg_dst = 1;
		alu_src = 0;
		mem_to_reg = 1;
		reg_write = 0;
		mem_read = 1;
		mem_write = 0;
		branch = 1;
		alu_op = 0;
		rt = 1;
		rd = 0;
		funct = 1;
		next_pc = 0;
        
		// Add stimulus here

	end
      
endmodule

