`timescale 1ns / 1ps

module ID_EX_reg (
	input clk,
	input hit,
	input [31:0] read_data_1,
	input [31:0] read_data_2,
	input [31:0] immeadiate,
	input reg_dst, 
	input alu_src, 
	input mem_to_reg, 
	input reg_write, 
	input mem_read,
	input mem_write, 
	input branch,
	input [ 2:0] alu_op,
	input [ 4:0] rt,
	input [ 4:0] rd,
	input [ 5:0] funct,
	input [31:0] next_pc,
	
	output reg [31:0] read_data_1_out,
	output reg [31:0] read_data_2_out,
	output reg [31:0] immeadiate_out,
	output reg reg_dst_out, 
	output reg alu_src_out, 
	output reg mem_to_reg_out, 
	output reg reg_write_out, 
	output reg mem_read_out,
	output reg mem_write_out, 
	output reg branch_out,
	output reg [ 2:0] alu_op_out,
	output reg [ 4:0] rt_out,
	output reg [ 4:0] rd_out,
	output reg [ 5:0] funct_out,
	output reg [31:0] next_pc_out
	);
	
	always @(negedge clk) begin
		if (hit == 1'b1) begin
			read_data_1_out <= read_data_1;
			read_data_2_out <= read_data_2;
			immeadiate_out <= immeadiate;
			reg_dst_out <= reg_dst;
			alu_src_out <= alu_src;
			mem_to_reg_out <= mem_to_reg;
			reg_write_out <= reg_write;
			mem_read_out <= mem_read;
			mem_write_out <= mem_write; 
			branch_out <= branch;
			alu_op_out <= alu_op	;
			rt_out <= rt;
			rd_out <= rd;
			funct_out <= funct;
			next_pc_out <= next_pc;
		end
	end

endmodule