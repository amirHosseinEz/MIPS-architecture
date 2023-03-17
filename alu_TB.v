`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:15:57 12/02/2022
// Design Name:   ALU
// Module Name:   C:/Users/user0/Desktop/New folder (13)/MIPS/alu_TB.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_TB;

	// Inputs
	reg [3:0] alu_cnt;
	reg [31:0] input1;
	reg [31:0] input2;
	reg [4:0] shamt;

	// Outputs
	wire [31:0] result;
	wire ZERO;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.alu_cnt(alu_cnt), 
		.input1(input1), 
		.input2(input2), 
		.shamt(shamt), 
		.result(result), 
		.ZERO(ZERO),
		
	);

	initial begin
		// Initialize Inputs
		alu_cnt = 4'b0000;										
		input1 = 32'b00000000000000000000000000000100;	// 4 + 2 = 6
		input2 = 32'b00000000000000000000000000000010;
		shamt = 5'b00000;
		#25
		alu_cnt = 4'b0001;
		input1 = 32'b00000000000000000000000000000100;
		input2 = 32'b00000000000000000000000000000010;	// 4 - 2 = 2
		shamt = 5'b00000;
		#25
		alu_cnt = 4'b0010;
		input1 = 32'b00000000000000000000000000000100;
		input2 = 32'b00000000000000000000000000000010;	// !4 = 32'b11111111111111111111111111111011  = -5
		shamt = 5'b00000;
		#25
		alu_cnt = 4'b0011;
		input1 = 32'b00000000000000000000000000000100;
		input2 = 32'b00000000000000000000000000000010;	// 4 << 3 = 32
		shamt = 5'b00011;
		#25
		alu_cnt = 4'b0100;
		input1 = 32'b00000000000000000000000000000100;
		input2 = 32'b00000000000000000000000000000010;	// 4 >> 2 = 1
		shamt = 5'b00010;
		#25
		alu_cnt = 4'b0101;
		input1 = 32'b00000000000000000000000000000100;
		input2 = 32'b00000000000000000000000000000010;	// 4 & 2 = 0
		shamt = 5'b00000;
		#25
		alu_cnt = 4'b0110;
		input1 = 32'b00000000000000000000000000000100;
		input2 = 32'b00000000000000000000000000000010;	// 4 | 2 = 6
		shamt = 5'b00000;
		#25
		alu_cnt = 4'b0111;
		input1 = 32'b00000000000000000000000000000100;
		input2 = 32'b00000000000000000000000000000010;	// (4 > 2)-> 0
		shamt = 5'b00000;
		#25
		alu_cnt = 4'b0111;
		input1 = 32'b00000000000000000000000000000100;
		input2 = 32'b00000000000000000000000000000010;	// (4 > 2)-> 0
		shamt = 5'b00000;


	end
      
endmodule

