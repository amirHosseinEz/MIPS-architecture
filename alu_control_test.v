`timescale 1ns / 1ps


module alu_control_test;

	// Inputs
	reg [2:0] alu_op;
	reg [5:0] funct;

	// Outputs
	wire [3:0] alu_cnt;

	// Instantiate the Unit Under Test (UUT)
	alu_control uut (
		.alu_op(alu_op), 
		.funct(funct), 
		.alu_cnt(alu_cnt)
	);

	initial begin
		// Initialize Inputs
		alu_op = 3'b000;   //ADD
		funct = 6'b000000;
		#25
		alu_op = 3'b000;	//SUB
		funct = 6'b000001;
		#25
		alu_op = 3'b000;	//AND
		funct = 6'b000010;
		#25
		alu_op = 3'b000;	//OR
		funct = 6'b000011;
		#25
		alu_op = 3'b000;	//SLT
		funct = 6'b000100;
		#25
		alu_op = 3'b000;	//LSL
		funct = 6'b000101;
		#25
		alu_op = 3'b000;	//LSR
		funct = 6'b000110;
		#25
		alu_op = 3'b000;	//NOT
		funct = 6'b000111;
		#25
		alu_op = 3'b001;	//BEQ -> SUB
		funct = 6'b000111;
		#25
		alu_op = 3'b010;	//SLTI -> SLT
		funct = 6'b000111;
		#25
		alu_op = 3'b011;	//ADDI, LW, SW -> ADD
		funct = 6'b000111;
		#25
		
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

