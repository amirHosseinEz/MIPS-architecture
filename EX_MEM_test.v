`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:57:17 01/13/2023
// Design Name:   EX_MEM_reg
// Module Name:   C:/Users/user0/Desktop/New folder (13)/MIPS/EX_MEM_test.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: EX_MEM_reg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module EX_MEM_test;

	// Inputs
	reg clk;
	reg hit;
	reg [31:0] branch_target;
	reg [31:0] alu_result;
	reg [31:0] read_data_2;
	reg [4:0] write_reg;
	reg branch;
	reg zeroflag;
	reg mem_to_reg;
	reg reg_write;
	reg mem_read;
	reg mem_write;
	
	initial clk = 0;
	always #25 clk = ~clk;

	// Outputs
	wire [31:0] branch_target_out;
	wire [31:0] alu_result_out;
	wire [31:0] read_data_2_out;
	wire [4:0] write_reg_out;
	wire zeroflagOut;
	wire mem_to_reg_out;
	wire reg_write_out;
	wire mem_read_out;
	wire mem_write_out;
	wire branch_out;

	// Instantiate the Unit Under Test (UUT)
	EX_MEM_reg uut (
		.clk(clk), 
		.hit(hit), 
		.branch_target(branch_target), 
		.alu_result(alu_result), 
		.read_data_2(read_data_2), 
		.write_reg(write_reg), 
		.branch(branch), 
		.zeroflag(zeroflag), 
		.mem_to_reg(mem_to_reg), 
		.reg_write(reg_write), 
		.mem_read(mem_read), 
		.mem_write(mem_write), 
		.branch_target_out(branch_target_out), 
		.alu_result_out(alu_result_out), 
		.read_data_2_out(read_data_2_out), 
		.write_reg_out(write_reg_out), 
		.zeroflagOut(zeroflagOut), 
		.mem_to_reg_out(mem_to_reg_out), 
		.reg_write_out(reg_write_out), 
		.mem_read_out(mem_read_out), 
		.mem_write_out(mem_write_out), 
		.branch_out(branch_out)
	);

	initial begin
		// Initialize Inputs

		hit = 0;
		branch_target = 1;
		alu_result = 0;
		read_data_2 = 1;
		write_reg = 0;
		branch = 1;
		zeroflag = 0;
		mem_to_reg = 1;
		reg_write = 0;
		mem_read = 1;
		mem_write = 0;
		

		// Wait 100 ns for global reset to finish
		#100;
		hit = 1;
		branch_target = 1;
		alu_result = 0;
		read_data_2 = 1;
		write_reg = 0;
		branch = 1;
		zeroflag = 0;
		mem_to_reg = 1;
		reg_write = 0;
		mem_read = 1;
		mem_write = 0;
		

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

