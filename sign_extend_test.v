`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:41:49 11/16/2022
// Design Name:   sign_extend
// Module Name:   C:/Users/user0/Desktop/New folder (13)/MIPS/sign_extend_test.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sign_extend
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sign_extend_test;

	// Inputs
	reg [15:0] value;

	// Outputs
	wire [31:0] sign_extended_value;

	// Instantiate the Unit Under Test (UUT)
	sign_extend uut (
		.value(value), 
		.sign_extended_value(sign_extended_value)
	);

	initial begin
		// Initialize Inputs
		value = 16'b0000000000000000;
		
		// Wait 100 ns for global reset to finish
		#100;
      value = 16'b1000000000000000;
		
		// Wait 100 ns for global reset to finish
		// Add stimulus here

	end
      
endmodule

