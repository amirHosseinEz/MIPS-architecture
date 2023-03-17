`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:00:58 11/02/2022
// Design Name:   fetch_module
// Module Name:   D:/daneshgah/term5/az memari/HWs/MIPS/fetchtest.v
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

module fetchtest;

	// Inputs
	reg [31:0] branch_target;
	reg clk;
	reg pc_src;

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
		branch_target = 0;
		clk = 0;
		pc_src = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

