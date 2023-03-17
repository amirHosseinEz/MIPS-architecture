`timescale 1ns / 1ps

module execute_module (
   input clk,
	input [31:0] alu_read_data_1,
	input [31:0] alu_read_data_2,
	input [31:0] immediate,
	input [5:0] funct,
	input [2:0] alu_op,
	input alu_src,
	
	input [31:0] PC,
	input [4:0] rt,
	input [4:0] rd,
	input RegDst,
	
	output [31:0] alu_result,
	output ZERO,
	output [31:0] AddResult,
	output [31:0] ALUReadData2_Out,
	output [4:0] RdOrRt
	);
	
	wire [3:0] alu_cnt;
	wire [31:0] input2;
	wire [4:0] shamt;
	assign shamt = immediate[10:6];
	


	alu_control alu_control1 (
		.alu_op(alu_op),
		.funct(funct),
		.alu_cnt(alu_cnt)
   );
	 
	 MUX_2x1_32bit 	MUX_2x1_32bit2  (
    .inpA(alu_read_data_2), 
    .inpB(immediate), 
    .sel(alu_src), 
    .out(input2)
    );

	//MUX_2x1_32bit mux_rt_or_rd (
  //  .inpA(rt), 
   // .inpB(rd), 
   // .sel(RegDst), 
    //.out(RdOrRt)
//);
	 
	assign RdOrRt = (RegDst) ? rd : rt;


	ALU ALU1 (
    .alu_cnt(alu_cnt), 
    .input1(alu_read_data_1), 
    .input2(input2), 
    .shamt(shamt), 
    .result(alu_result), 
    .ZERO(ZERO)
    );
	assign AddResult = PC + (immediate << 2);
	assign ALUReadData2_Out = alu_read_data_2;


endmodule