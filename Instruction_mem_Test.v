`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:58:01 10/20/2022
// Design Name:   Instruction_Memory
// Module Name:   D:/daneshgah/term5/az memari/HWs/MIPS/Instruction_mem_Test.v
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

module Instruction_mem_Test;

	// Inputs
	reg clk;
	reg [31:0] pc;
	initial clk = 0;
	always #50 clk = ~clk;
	// Outputs
	wire [31:0] out;

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
		// Add stimulus here

	end
      
endmodule

