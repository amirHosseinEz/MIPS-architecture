`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:45:17 12/02/2022
// Design Name:   control_unit
// Module Name:   C:/Users/user0/Desktop/New folder (13)/MIPS/control_unit_test.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: control_unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module control_unit_test;

	// Inputs
	reg [5:0] opcode;

	// Outputs
	wire reg_dst;
	wire alu_src;
	wire mem_to_reg;
	wire reg_write;
	wire mem_read;
	wire mem_write;
	wire branch;
	wire [2:0] alu_op;

	// Instantiate the Unit Under Test (UUT)
	control_unit uut (
		.opcode(opcode), 
		.reg_dst(reg_dst), 
		.alu_src(alu_src), 
		.mem_to_reg(mem_to_reg), 
		.reg_write(reg_write), 
		.mem_read(mem_read), 
		.mem_write(mem_write), 
		.branch(branch), 
		.alu_op(alu_op)
	);

	initial begin
		// Initialize Inputs
		opcode = 6'b000000;   //R-type
		#25;
		opcode = 6'b000100;   //LW
		#25;
		opcode = 6'b000101;   //SW
		#25;
		opcode = 6'b000111;	 //ADDI
		#25;
		opcode = 6'b000110;	 //BEQ
		#25;
		opcode = 6'b000001;	 //SLTI
		#25;
		
		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here

	end
      
endmodule

