`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:42:34 10/29/2022
// Design Name:   cache
// Module Name:   D:/daneshgah/term5/az memari/HWs/MIPS/cache_testing.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cache
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cache_testing;

	// Inputs
	reg [127:0] dataline;
	reg [31:0] address;
	reg clk;
	initial clk = 0;
	always #25 clk = ~clk;
	// Outputs
	wire hit;
	wire [31:0] instruction;

	// Instantiate the Unit Under Test (UUT)
	cache uut (
		.dataline(dataline), 
		.address(address), 
		.clk(clk), 
		.hit(hit), 
		.instruction(instruction)
	);

	initial begin
		// Initialize Inputs
		dataline = 128'h0000000c000000080000000400000000;
		address = 32'h00000000;
		#50
		address = 32'h00000004;
				#50
		address = 32'h00000008;
				#50
		address = 32'h00000000c;
				#50
		address = 32'h00000100;

		// Wait 100 ns for global reset to finish
		#500;

        
		// Add stimulus here

	end
      
endmodule

