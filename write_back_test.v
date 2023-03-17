`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:23:00 01/13/2023
// Design Name:   write_back
// Module Name:   C:/Users/user0/Desktop/New folder (13)/MIPS/write_back_test.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: write_back
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module write_back_test;

	// Inputs
	reg mem_to_reg;
	reg [31:0] read_data;
	reg [31:0] alu_result;


	// Outputs
	
	wire [31:0] write_data;

	// Instantiate the Unit Under Test (UUT)
	write_back uut (
		.mem_to_reg(mem_to_reg), 
		.read_data(read_data), 
		.alu_result(alu_result), 
		.write_data(write_data)
	);

	initial begin
		// Initialize Inputs
		mem_to_reg = 1;
		read_data = 1;
		alu_result = 2;

		// Wait 100 ns for global reset to finish
		#100;
		mem_to_reg = 0;
		read_data = 1;
		alu_result = 2;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

