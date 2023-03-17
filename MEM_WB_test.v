`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:19:11 01/13/2023
// Design Name:   MEM_WB_reg
// Module Name:   C:/Users/user0/Desktop/New folder (13)/MIPS/MEM_WB_test.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MEM_WB_reg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MEM_WB_test;

	// Inputs
	reg clk;
	reg hit;
	reg [31:0] read_data;
	reg [31:0] alu_result;
	reg [4:0] write_reg;
	reg reg_write;
	reg mem_to_reg;
	
	initial clk = 0;
	always #25 clk = ~clk;

	// Outputs
	wire [31:0] read_data_out;
	wire [31:0] alu_result_out;
	wire [4:0] write_reg_out;
	wire reg_write_out;
	wire mem_to_reg_out;

	// Instantiate the Unit Under Test (UUT)
	MEM_WB_reg uut (
		.clk(clk), 
		.hit(hit), 
		.read_data(read_data), 
		.alu_result(alu_result), 
		.write_reg(write_reg), 
		.reg_write(reg_write), 
		.mem_to_reg(mem_to_reg), 
		.read_data_out(read_data_out), 
		.alu_result_out(alu_result_out), 
		.write_reg_out(write_reg_out), 
		.reg_write_out(reg_write_out), 
		.mem_to_reg_out(mem_to_reg_out)
	);

	initial begin
		// Initialize Inputs
		hit = 0;
		read_data = 1;
		alu_result = 0;
		write_reg = 1;
		reg_write = 0;
		mem_to_reg = 1;

		// Wait 100 ns for global reset to finish
		#100;
      hit = 1;
		read_data = 1;
		alu_result = 0;
		write_reg = 1;
		reg_write = 0;
		mem_to_reg = 1;
		// Add stimulus here

	end
      
endmodule

