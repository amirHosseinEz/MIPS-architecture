
`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:29:04 12/07/2022
// Design Name:   execute_module
// Module Name:   C:/Users/user0/Desktop/New folder (13)/MIPS/execute_test.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: execute_module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module execute_TB;

	// Inputs
	reg clk;
	initial clk = 0;
	always #25 clk = ~clk;
	reg [31:0] alu_read_data_1;
	reg [31:0] alu_read_data_2;
	reg [31:0] immediate;
	reg [5:0] funct;
	reg [2:0] alu_op;
	reg alu_src;
	reg [31:0] PC;
	reg [4:0] rt;
	reg [4:0] rd;
	reg RegDst;

	// Outputs
	wire [31:0] alu_result;
	wire ZERO;
	wire [31:0] AddResult;
	wire [31:0] ALUReadData2_Out;
	wire [4:0] RdOrRt;

	// Instantiate the Unit Under Test (UUT)
	execute_module uut (
		.clk(clk), 
		.alu_read_data_1(alu_read_data_1), 
		.alu_read_data_2(alu_read_data_2), 
		.immediate(immediate), 
		.funct(funct), 
		.alu_op(alu_op), 
		.alu_src(alu_src), 
		.PC(PC),
		.rt(rt),
		.rd(rd),
		.RegDst(RegDst),
		.alu_result(alu_result), 
		.ZERO(ZERO),
		.AddResult(AddResult),
		.ALUReadData2_Out(ALUReadData2_Out),
		.RdOrRt(RdOrRt)
	);

	initial begin
		// Initialize Inputs
		alu_read_data_1 = 3;			// 3 + 7 = 10
		alu_read_data_2 = 7;
		immediate = 5;
		funct = 6'b000000;
		alu_op = 3'b000;
		alu_src = 0;
		rd = 0;
		rt = 1;
		RegDst = 0;
		PC = 0;
		

		// Wait 100 ns for global reset to finish
		#50;
		alu_read_data_1 = 3;			// 3 + 5 = 8
		alu_read_data_2 = 7;
		immediate = 5;
		funct = 6'b000000;
		alu_op = 3'b011;
		alu_src = 1;
		rd = 0;
		rt = 1;
		RegDst = 1;
      PC = 0;
 
		// Add stimulus here

		#50;
		alu_read_data_1 = 7;       // 7 - 3 = 4
		alu_read_data_2 = 3;
		immediate = 5;
		funct = 6'b000001;
		alu_op = 3'b000;
		alu_src = 0;
		rd = 0;
		rt = 1;
		RegDst = 1;
      PC = 0;
		#50;
		alu_read_data_1 = 2;       // 2 & 3 = 2
		alu_read_data_2 = 3;
		immediate = 5;
		funct = 6'b000010;
		alu_op = 3'b000;
		alu_src = 0;
		rd = 0;
		rt = 1;
		RegDst = 1;
      PC = 0;
		#50;
		alu_read_data_1 = 8;       // 8 | 4 = 12
		alu_read_data_2 = 4;
		immediate = 4;
		funct = 6'b000011;
		alu_op = 3'b000;
		alu_src = 0;
		rd = 0;
		rt = 1;
		RegDst = 1;
      PC = 0;
		#50;
		alu_read_data_1 = 2;       // 2 < 3
		alu_read_data_2 = 3;
		immediate = 5;
		funct = 6'b000100;
		alu_op = 3'b000;
		alu_src = 0;
		rd = 0;
		rt = 1;
		RegDst = 1;
      PC = 0;
		#50;
		alu_read_data_1 = 1;       // 1 << 3 = 8
		alu_read_data_2 = 1;
		immediate = 32'b00000000000000000000000011000000; // shamt = 3
		funct = 6'b000101;
		alu_op = 3'b000;
		alu_src = 0;
		rd = 0;
		rt = 1;
		RegDst = 1;
      PC = 0;
		#50;
		alu_read_data_1 = 7;       // 7 >> 2 = 1
		alu_read_data_2 = 2;
		immediate = 32'b00000000000000000000000010000000;  // shamt = 2
		funct = 6'b000110;
		alu_op = 3'b000;
		alu_src = 0;
		rd = 0;
		rt = 1;
		RegDst = 1;
      PC = 0;
		
		
	end
      
endmodule


