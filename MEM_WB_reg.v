`timescale 1ns / 1ps

module MEM_WB_reg (
   input clk,
	input hit,
	input [31:0] read_data,
	input [31:0] alu_result,
	input [ 4:0] write_reg,
	input reg_write,
	input mem_to_reg,
	
	output reg [31:0] read_data_out,
	output reg [31:0] alu_result_out,
	output reg [ 4:0] write_reg_out,
	output reg reg_write_out,
	output reg mem_to_reg_out
	);
	
	always @(negedge clk) begin
		if (hit == 1'b1) begin
			read_data_out <= read_data;
			alu_result_out <= alu_result;
			write_reg_out <= write_reg;
			reg_write_out <= reg_write;
			mem_to_reg_out <= mem_to_reg;
		end
	end

endmodule