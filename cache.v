`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:32:35 10/29/2022 
// Design Name: 
// Module Name:    cache 
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
module cache(dataline, address, clk, hit, instruction);
	input [127:0] dataline;
	input [31:0] address;
	input clk;
	output reg hit;
	output reg [31:0] instruction;
	
	integer i;
	integer offset, index;
	
	reg [24:0] tag;
	
	reg [153:0] mycache [0:7];
	initial begin  																		// validity should be 0 in the begining
		for (i = 0; i < 8; i = i+1)
			mycache[i][153] = 0;
	end
	
	always @(dataline) begin
		if(dataline !== 128'bX)begin
			index = address[6:4];														
			mycache[index] = {1'b1, address[31:7], dataline[127:0]};				// Concatenating the bits.
			$display("saveddddddddddddddddddddddddddd!  %b", mycache[index]);
		end
	end
	
	always @(posedge clk) begin
		index = address[6:4];
		if (mycache[index][153] == 1'b1) begin
			//$display("offset issssssssss");
			tag = address[31:7];
			if (tag == mycache[index][152:128]) begin								//	Checking the tag bits
				//$display("HERERERERRER %d   %d    %d",tag, mycache[index][152:128], index);
				offset = address[3:2];
				case (offset)
					2'b11 : instruction = mycache[index][31:0];
					2'b10 : instruction = mycache[index][63:32];
					2'b01 : instruction = mycache[index][95:64];
					2'b00 : instruction = mycache[index][127:96];

				endcase
				$display("qqqqqqqqqqweweweqq  = %h       %d      %h    %d      %h",mycache[index], address , instruction, offset, dataline);

				//$display("offset is = %d", offset);
				hit = 1;																		
			end
			else 
				hit = 0;																		
																								
		end
		else 
			hit = 0;																			
																								
	end



endmodule
