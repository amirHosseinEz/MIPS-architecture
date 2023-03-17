`timescale 1ns / 1ps

module EX_MEM_reg (
   input clk,
	input hit,
	input [31:0] branch_target,
	input [31:0] alu_result,
	input [31:0] read_data_2,
	input [ 4:0] write_reg,
	input branch,
	input zeroflag,
	input mem_to_reg,
	input reg_write, 
	input mem_read, 
	input mem_write,
	
	

	output reg [31:0] branch_target_out,
	output reg [31:0] alu_result_out,
	output reg [31:0] read_data_2_out,
	output reg [ 4:0] write_reg_out,
	output reg zeroflagOut,
	output reg mem_to_reg_out,
	output reg reg_write_out, 
	output reg mem_read_out, 
	output reg mem_write_out,
	output reg branch_out,
	output reg pcsrc_ex_mem
	);
	initial pcsrc_ex_mem = 0;
	always @(negedge clk) begin
		if (hit == 1'b1) begin
			branch_target_out <= branch_target;
			alu_result_out <= alu_result;
			read_data_2_out <= read_data_2;
			write_reg_out <= write_reg;
			mem_to_reg_out <= mem_to_reg; 
			reg_write_out <= reg_write;
			mem_read_out <= mem_read;  
			mem_write_out <= mem_write;
			branch_out <= branch;
			zeroflagOut <= zeroflag;
		end	
	end
	always @(negedge clk)
		if(zeroflag & branch)
			pcsrc_ex_mem = 1;
		else
			pcsrc_ex_mem = 0;
	
	
endmodule