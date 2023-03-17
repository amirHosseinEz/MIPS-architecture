`timescale 1ns / 1ps

module sign_extend (
	input  [15:0] value,
	output [31:0] sign_extended_value
   );
	
	assign sign_extended_value = {{16{value[15]}}, value[15:0]};

endmodule