`timescale 1ns / 1ps

module write_back (
	input mem_to_reg,
	input [31:0] read_data,
	input [31:0] alu_result,
	output [31:0] write_data
	);
	
	assign write_data = mem_to_reg == 1'b1 ? read_data : alu_result;

endmodule