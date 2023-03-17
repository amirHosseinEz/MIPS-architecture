`timescale 1ns / 1ps

module MUX_2x1_32bit(inpA, inpB, sel, out);
	input [31:0] inpA;
	input [31:0] inpB;
	input sel;
	output [31:0] out;
	//always@(posedge clk)
	assign out = sel == 1? inpB: inpA;

endmodule
