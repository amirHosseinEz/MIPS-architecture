`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:10:36 01/13/2023
// Design Name:   data_memory
// Module Name:   C:/Users/user0/Desktop/New folder (13)/MIPS/data_memory_test.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: data_memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module data_memory_test;

	// Inputs
	reg clk;
	reg [31:0] address;
	reg [31:0] write_data;
	reg mem_read;
	reg mem_write;

	// Outputs
	initial clk = 0;
	always #25 clk = ~clk;
	wire [31:0] read_data;

	// Instantiate the Unit Under Test (UUT)
	data_memory uut (
		.clk(clk), 
		.address(address), 
		.write_data(write_data), 
		.mem_read(mem_read), 
		.mem_write(mem_write), 
		.read_data(read_data)
	);

	initial begin
		// Initialize Inputs
		address = 5;
		write_data = 7;
		mem_read = 0;
		mem_write = 1;

		// Wait 100 ns for global reset to finish
		#100;
		address = 5;
		write_data = 7;
		mem_read = 1;
		mem_write = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

