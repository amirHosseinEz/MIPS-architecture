`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:30:01 11/02/2022
// Design Name:   fetch_module
// Module Name:   D:/daneshgah/term5/az memari/HWs/MIPS/fetchtesting.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fetch_module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fetch_module_test;

	// Inputs
	reg [31:0] branch_target;
	reg clk;
	reg pc_src;
	initial branch_target = 0;
	initial clk = 0;
	initial pc_src = 1;
	always #25 clk = ~clk;
	// Outputs
	wire [31:0] instruction;
	wire [31:0] nextpc;
	wire hit;

	// Instantiate the Unit Under Test (UUT)
	fetch_module uut (
		.branch_target(branch_target), 
		.clk(clk), 
		.pc_src(pc_src), 
		.instruction(instruction), 
		.nextpc(nextpc), 
		.hit(hit)
	);

	initial begin
		// Initialize Inputs

		// Wait 100 ns for global reset to finish
		#100;
      branch_target = 0;
		pc_src = 0;
		#100;
      branch_target = 0;
		pc_src = 0;
				#100;
      branch_target = 0;
		pc_src = 0;
				#100;
      branch_target = 0;
		pc_src = 0;
				#100;
      branch_target = 0;
		pc_src = 0;
		// Add stimulus here

	end
      
endmodule

