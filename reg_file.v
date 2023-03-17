`timescale 1ns / 1ps

module reg_file(
	input clk,
	input RegWrite,
	input  [ 4:0] read_reg_1,
	input  [ 4:0] read_reg_2,
	input  [ 4:0] write_reg,
	input  [31:0] write_data,
	output [31:0] read_data_1,
	output [31:0] read_data_2
   );

	integer i;

	reg [31:0] register [0:31];
	initial begin
		for (i = 0; i < 32; i = i+1)
			register[i] = i;
	end
	
	assign read_data_1 = register[read_reg_1];
	assign read_data_2 = register[read_reg_2];
	
	always @(posedge clk) begin
		if (RegWrite == 1'b1) begin
			if (write_reg == 5'b0)begin
				$display("CAN'T WRITE IN ZERO!");
			end
			else register[write_reg] = write_data;
			$display("hereeee write reg : %d", write_reg);
			$display("hereeee2 write data : %d", write_data);

		end
	end
	
	integer file;
	always @(register) begin
		file = $fopen("registers.txt","w");
		for (i = 0; i < 32; i = i+1)
			$fwrite(file,"%d: %b\n",i, register[i]);
		$fclose(file);
	end
	
	always @(register)begin
		$display("reg8 = %d", register[1]);
	end

endmodule