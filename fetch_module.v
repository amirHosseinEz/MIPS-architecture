`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:01:49 10/29/2022 
// Design Name: 
// Module Name:    fetch_module 
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
module fetch_module (branch_target, clk, pc_src, instruction, nextpc, hit);
	input [31:0] branch_target;
	input clk;
	input pc_src;
	output reg [31:0] instruction;
	output [31:0] nextpc;
	output reg hit;

	wire [127:0] dataline_wire;
	wire [ 31:0] address;
	wire [ 31:0] loaded_address;
	wire [ 31:0] instruction_wire;
	wire [31:0] branch_targetwire;
	wire pc_srcwire;
	wire hit_wire;
	
	wire [31:0] pc;
	initial begin
	hit = 1'b0;

	end
	
	MUX_2x1_32bit MUX_2x1_32bit1 (
		 .inpA(nextpc), 
		 .inpB(branch_target), 
		 .sel(pc_src), 
		 .out(address)
		 );
	editedpc editedpc1 (
    .next_instruction_address(address), 
    .clk(clk), 
    .hit(hit), 
    .curr_instruction_address(loaded_address)
    );
		
	cache cache1 (
    .dataline(dataline_wire), 
    .address(loaded_address), 
    .clk(clk), 
    .hit(hit_wire), 
    .instruction(instruction_wire)
    );
	 
	 Instruction_Memory Instruction_Memory1 (
    .clk(clk), 
    .pc(loaded_address), 
    .out(dataline_wire)
    );
	always @(posedge clk)begin
		$display("address issssssssssssssssssssssssssssssss %d" ,hit);
	end
	assign nextpc = loaded_address + 4;
	always @(hit_wire) hit <= hit_wire;
	always @(instruction_wire) instruction <= instruction_wire;


endmodule
