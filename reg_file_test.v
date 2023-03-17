`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:47:39 11/16/2022
// Design Name:   reg_file
// Module Name:   C:/Users/user0/Desktop/New folder (13)/MIPS/reg_file_test.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: reg_file
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module reg_file_test;

	// Inputs
	reg clk;
	reg RegWrite;
	reg [4:0] read_reg_1;
	reg [4:0] read_reg_2;
	reg [4:0] write_reg;
	reg [31:0] write_data;
	
	initial clk = 0;
	always #25 clk = ~clk;
	// Outputs
	wire [31:0] read_data_1;
	wire [31:0] read_data_2;

	// Instantiate the Unit Under Test (UUT)
	reg_file uut (
		.clk(clk), 
		.RegWrite(RegWrite), 
		.read_reg_1(read_reg_1), 
		.read_reg_2(read_reg_2), 
		.write_reg(write_reg), 
		.write_data(write_data), 
		.read_data_1(read_data_1), 
		.read_data_2(read_data_2)
	);

	initial begin
		// Initialize Inputs
		RegWrite = 0;
		read_reg_1 = 3;
		read_reg_2 = 7;
		write_reg = 0;
		write_data = 0;

		// Wait 100 ns for global reset to finish
		#100;
      RegWrite = 1;
		read_reg_1 = 3;
		read_reg_2 = 7;
		write_reg = 0;
		write_data = 7;
		// Add stimulus here
		#100;
      RegWrite = 1;
		read_reg_1 = 3;
		read_reg_2 = 7;
		write_reg = 5;
		write_data = 12;
		
		#100;
      RegWrite = 0;
		read_reg_1 = 5;
		read_reg_2 = 5;
		write_reg = 5;
		write_data = 12;

	end
      
endmodule

