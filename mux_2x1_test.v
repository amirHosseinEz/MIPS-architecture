`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:07:55 10/19/2022
// Design Name:   MUX_2x1_32bit
// Module Name:   D:/daneshgah/term5/az memari/HWs/MIPS/mux_2x1_test.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MUX_2x1_32bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux_2x1_test;

	// Inputs
	reg [31:0] inpA;
	reg [31:0] inpB;
	reg sel;
	reg clk;
	initial clk = 0;
	always #20 clk = ~clk;
	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	MUX_2x1_32bit uut (
		.inpA(inpA), 
		.inpB(inpB), 
		.sel(sel), 
		.out(out), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		inpA = 3;
		inpB = 4;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
		inpA = 3;
		inpB = 4;
		sel = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

