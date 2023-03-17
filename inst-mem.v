`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:36:58 10/28/2022 
// Design Name: 
// Module Name:    inst-mem 
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
module Instruction_Memory(clk, pc, out);
	input clk;
	input [31:0] pc;
	output reg [127:0] out;
	reg [31:0] mem [0:1023];
	reg [2:0] counter;
	reg [27:0] first_28_bits;
	initial begin
	counter = 3'b000;
	$readmemh("code.txt",mem);
	end
	always @(posedge clk) begin
		if (first_28_bits !=  pc[31:4]) begin
				counter = 3'b000;
				out = 128'bX;
		end
		else if (counter < 3'b100) begin 
				counter = counter + 3'b001;
		end
		else begin
			out[127:96] = mem[((pc>>4) << 2)];
			out[95:64] = mem[((pc>>4) << 2) + 1];
			out[63:32] = mem[((pc>>4) << 2) + 2];
			out[31:0] = mem[((pc>>4) << 2) + 3];
			counter = 3'b000;
		end
	end
	
	
	
endmodule