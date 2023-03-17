`timescale 1ns / 1ps

module data_memory (
   input clk,
	input [31:0] address,
	input [31:0] write_data,
	input mem_read,
	input mem_write,
	output reg [31:0] read_data
	);
	
	integer i;
	reg [7:0] data_mem [0:1023];
	initial begin
		for (i = 0; i < 1024; i = i+1) data_mem[i] = i;
	end

	
	reg [7:0] tmp1, tmp2, tmp3, tmp4;

	always @(posedge clk) begin
		if (mem_write == 1'b1) begin
			data_mem[address+0] = write_data[7:0];
			data_mem[address+1] = write_data[15:8];
			data_mem[address+2] = write_data[23:16];
			data_mem[address+3] = write_data[31:24];
		end
		
		if (mem_read == 1'b1) begin
			tmp1 = data_mem[address + 0];
			tmp2 = data_mem[address + 1];
			tmp3 = data_mem[address + 2];
			tmp4 = data_mem[address + 3];
			read_data = {tmp4, tmp3, tmp2, tmp1};
		end
	end
	
	
	integer file;
	
	always @(data_mem) begin
		file = $fopen("data_mem.txt","w");
		for (i = 0; i < 1024; i = i+1)
			$fwrite(file,"%d: %b\n",i, data_mem[i]);
		$fclose(file);
	end

endmodule