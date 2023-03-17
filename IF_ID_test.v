`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:08:48 12/02/2022
// Design Name:   IF_ID_regs
// Module Name:   C:/Users/user0/Desktop/New folder (13)/MIPS/IF_ID_test.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: IF_ID_regs
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module IF_ID_test;

	// Inputs
	reg clk;
	reg [31:0] next_pc;
	reg [31:0] instruction;
	reg hit;
	
	initial clk = 0;
	always #25 clk = ~clk;
	// Outputs
	wire [31:0] next_pc_out;
	wire [31:0] instruction_out;
	wire hit_out;

	// Instantiate the Unit Under Test (UUT)
	IF_ID_regs uut (
		.clk(clk), 
		.next_pc(next_pc), 
		.instruction(instruction), 
		.hit(hit), 
		.next_pc_out(next_pc_out), 
		.instruction_out(instruction_out), 
		.hit_out(hit_out)
	);

	initial begin
		// Initialize Inputs
		next_pc = 32'b000000000000000000000000000000001100;
		instruction = 32'b10101010101010101010101010101010;
		hit = 0;

		// Wait 100 ns for global reset to finish
		#100;
		next_pc = 32'b000000000000000000000000000000001100;
		instruction = 32'b10101010101010101010101010101010;
		hit = 1;
        
		// Add stimulus here

	end
      
endmodule

