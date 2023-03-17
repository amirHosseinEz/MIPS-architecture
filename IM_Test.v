`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:43:01 10/20/2022
// Design Name:   Instruction_Memory
// Module Name:   D:/daneshgah/term5/az memari/HWs/MIPS/IM_Test.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Instruction_Memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module IM_Test;

	// Inputs
	reg clk;
	initial clk = 0;
	always #25 clk = ~clk;
	reg [31:0] pc;
	// Outputs
	wire [127:0] out;

	// Instantiate the Unit Under Test (UUT)
	Instruction_Memory uut (
		.clk(clk), 
		.pc(pc), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		pc = 0;

		// Wait 100 ns for global reset to finish
		#100;
				pc = 4;

		// Wait 100 ns for global reset to finish
		#100;
				pc = 8;

		// Wait 100 ns for global reset to finish
		#100;
				pc = 12;

		// Wait 100 ns for global reset to finish
		#100;
				pc = 16;

		// Wait 100 ns for global reset to finish
		#100;
				pc = 20;

		// Wait 100 ns for global reset to finish
		#100;
				pc = 24;

		// Wait 100 ns for global reset to finish
		#100;
				pc = 28;
		#100;
				pc = 32;
		#100;
				pc = 36;
		#100;
				pc = 40;
		#100;
				pc = 44;
		#100;
				pc = 48;
		#100;
				pc = 52;
		#100;
				pc = 56;
		#100;
				pc = 60;
		#100;
				pc = 64;
		// Add stimulus here

	end
      
endmodule

