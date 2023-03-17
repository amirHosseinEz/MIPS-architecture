`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:12:00 10/29/2022 
// Design Name: 
// Module Name:    editedpc 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module editedpc (next_instruction_address, clk, hit, curr_instruction_address);
	input [31:0] next_instruction_address;
	input clk;
	input hit;
	output reg [31:0] curr_instruction_address;
	
	initial curr_instruction_address = 0;
	
	always @(negedge clk) begin
		if (hit == 1'b1) 
			#0.001 curr_instruction_address <= next_instruction_address;
	end

endmodule
