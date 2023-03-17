`timescale 1ns / 1ps

module ALU (
   input [3:0] alu_cnt, 
	input signed [31:0] input1,
	input signed [31:0] input2,
	input [4:0] shamt,
	output [31:0] result,
	output ZERO
	);
	

	assign result =	alu_cnt == 4'b0000 	? 	  (input1 + input2)					     :   // ADD
				 	alu_cnt == 4'b0001 	? 	  (input1 - input2)       			     :   // SUB
					alu_cnt == 4'b0010 	? 	  (~input1)               			     :   // NOT
					alu_cnt == 4'b0011   ? 	  (input1 << shamt)       			     :   // LSL
					alu_cnt == 4'b0100   ?    (input1 >> shamt)       			     :	// LSR
					alu_cnt == 4'b0101   ?    (input1 & input2)      			     :	// AND
					alu_cnt == 4'b0110   ?    (input1 | input2)       			     :	// OR
					alu_cnt == 4'b0111   ?    (input1 < input2 ? 32'b1 : 32'b0)   :	// SLTI
					32'bX;		

	
	assign ZERO = (result == 0) ? 1 : 0;

	/*
	integer i;
	always @(*) begin
		result =	alu_cnt == 4'b0000 	? 	  (input1 + input2)					     :   // ADD
				 	alu_cnt == 4'b0001 	? 	  (input1 - input2)       			     :   // SUB
					alu_cnt == 4'b0010 	? 	  (~input1)               			     :   // NOT
					alu_cnt == 4'b0011   ? 	  (input1 << shamt)       			     :   // LSL
					alu_cnt == 4'b0100   ?    (input1 >> shamt)       			     :	// LSR
					alu_cnt == 4'b0101   ?    (input1 & input2)      			     :	// AND
					alu_cnt == 4'b0110   ?    (input1 | input2)       			     :	// OR
					alu_cnt == 4'b0111   ?    (input1 < input2 ? 32'b1 : 32'b0)   :	// SLTI
					32'bX;		
	end
	
	assign zero = (result == 0) ? 1 : 0;
	assign ALUResult = (ALUCont == 4'b0000) ? input1 + input2 :
	
	always @(result) begin
			if(result == 0)
				ZERO = 1;
			else
				ZERO = 0;

	end
	*/

endmodule