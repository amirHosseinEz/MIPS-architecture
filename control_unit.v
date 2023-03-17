`timescale 1ns / 1ps

module control_unit (
	input [5:0] opcode,
	output  reg_dst, 
	output  alu_src, 
	output  mem_to_reg, 
	output  reg_write, 
	output  mem_read,
	output  mem_write, 
	output  branch,
	output  [2:0] alu_op
   );

	assign reg_dst = (opcode == 0) ? 1 : 0;
	assign alu_src = (opcode == 0) ? 0 :(opcode == 6)? 0 : 1;
	assign mem_to_reg = (opcode == 4) ? 1 : 0;
	assign reg_write = (opcode == 5) ? 0 :(opcode == 6) ? 0 : 1;
	assign mem_read = (opcode == 4) ? 1 : 0;
	assign mem_write = (opcode == 5) ? 1 : 0;
	assign branch = (opcode == 6) ? 1 : 0;
	assign alu_op = (opcode == 0) ? 0 : (opcode == 6) ? 1 : (opcode == 1) ? 2'b10 : 2'b11;
	/*
	always @(opcode) begin
		reg_dst <= opcode == 6'b000000 ? 1'b1 : 1'b0;
		
		alu_src <= (opcode == 6'b000100 || 		
					   opcode == 6'b000101 || 
					   opcode == 6'b000111 || 
					   opcode == 6'b000001) ? 1'b1 : 1'b0;
		
		mem_to_reg <= opcode == 6'b000100 ? 1'b1 : 1'b0;
		
		reg_write <= (opcode == 6'b000000 || 
						 opcode == 6'b000100 || 
						 opcode == 6'b000111 || 
						 opcode == 6'b000001) ? 1'b1 : 1'b0;
		
		mem_read <= opcode == 6'b000100 ? 1'b1 : 1'b0;
		
		mem_write <= opcode == 6'b000101 ? 1'b1 : 1'b0;
		
		branch <= opcode == 6'b000110 ? 1'b1 : 1'b0;
		
		if (opcode == 6'b000000)	alu_op <= 3'b000;
		else if (opcode == 6'b000100 ||	opcode == 6'b000101 || opcode == 6'b000111)
			alu_op <=  3'b011;
		else if (opcode == 6'b000110) alu_op <= 3'b001;
		else if (opcode == 6'b000001) alu_op <= 3'b010;
		else alu_op <= 3'bX;
		
	end

*/

endmodule