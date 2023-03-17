`timescale 1ns / 1ps



module alu_control(
   input [2:0] alu_op,
	input [5:0] funct,
	output reg [3:0] alu_cnt
	);
	
	
	always @(*) begin
			alu_cnt = alu_op == 3'b000 ? (						// R-Type:
							funct == 6'b000000 ? 4'b0000 :				// ADD
							funct == 6'b000001 ? 4'b0001 :				// SUB
							funct == 6'b000010 ? 4'b0101 :				// AND
							funct == 6'b000011 ? 4'b0110 :				//	OR
							funct == 6'b000100 ? 4'b0111 : 				//	SLT
							funct == 6'b000101 ? 4'b0011 :				// LSL
							funct == 6'b000110 ? 4'b0100 :				// LSR
							funct == 6'b000111 ? 4'b0010 : 				// NOT
							4'bX) 
					 
					 : alu_op == 3'b001 ? 4'b0001					      // BEQ
					 : alu_op == 3'b010 ? 4'b0111					      // SLTI
					 : alu_op == 3'b011 ? 4'b0000     					// ADDI, LW, SW
					 : 4'bX;
	end


endmodule