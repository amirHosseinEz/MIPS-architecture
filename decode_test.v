`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:10:32 11/14/2022
// Design Name:   decode_module
// Module Name:   C:/Users/user0/Desktop/New folder (13)/MIPS/decode_test.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: decode_module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module decode_test;

	// Inputs
	reg clk;
	reg [31:0] instruction;
	reg reg_write;
	reg [4:0] write_reg;
	reg [31:0] write_data;

	// Outputs
	wire [31:0] read_data_1;
	wire [31:0] read_data_2;
	wire [31:0] sign_extended_immediate;
	wire [4:0] rt;
	wire [4:0] rd;
	wire [4:0] opcode;

	initial clk = 0;
	always #25 clk = ~clk;
	// Instantiate the Unit Under Test (UUT)
	decode_module uut (
		.clk(clk), 
		.instruction(instruction), 
		.reg_write(reg_write), 
		.write_reg(write_reg), 
		.write_data(write_data), 
		.read_data_1(read_data_1), 
		.read_data_2(read_data_2), 
		.sign_extended_immediate(sign_extended_immediate), 
		.rt(rt), 
		.rd(rd),
		.opcode(opcode)
	);

	initial begin
		// Initialize Inputs
		instruction = 32'b00000001001010100100000000100000;
		reg_write = 0;
		write_reg = 0;
		write_data = 0;

		// Wait 100 ns for global reset to finish
		#100;
		instruction = 32'b00000001001010111100000000100000;
		reg_write = 1;
		write_reg = 8;
		write_data = 7;
        
		// Add stimulus here

	end
      
endmodule

