`timescale 1ns / 1ps

module decode_module (
   input clk,
	input [31:0] instruction,
	input reg_write,
	input [4:0] write_reg,
	input [31:0] write_data,
	output [31:0] read_data_1,
	output [31:0] read_data_2,
	output [31:0] sign_extended_immediate,
	output reg [4:0] rt,
	output reg [4:0] rd,
	output [5:0] opcode
	);
	
	reg [15:0] value;									
	reg [4:0] rs;
	assign opcode = instruction[31:26];

	always @(posedge clk) begin
		rs <= instruction[25:21];
		rt <= instruction[20:16];
		rd <= instruction[15:11];
		value <= instruction[15:0];
	end		
	
	//always @(write_reg) rd = reg_write;
	
	reg_file reg_file1 (
    .clk(clk), 
    .RegWrite(reg_write), 
    .read_reg_1(rs), 
    .read_reg_2(rt), 
    .write_reg(write_reg), 
    .write_data(write_data), 
    .read_data_1(read_data_1), 
    .read_data_2(read_data_2)
    );
	 
	sign_extend sign_extend1 (
    .value(value), 
    .sign_extended_value(sign_extended_immediate)
    );

endmodule