module mainfor1(
	input [7:0]a,
	input [7:0]b,
	input [7:0]c,
	input [7:0]W,
	output [7:0]a_out,
	output [7:0]b_out,
	output [7:0]c_out
	
);

	wire [7:0] x;
	
	assign x = a ^ b;

	assign a_out = b ^ c;
	assign b_out = c<<4;
	assign c_out = x + 8'h99 + W;
    

endmodule


module mainfor2(
	input [7:0]a,
	input [7:0]b,
	input [7:0]c,
	input [7:0]W,
	output [7:0]a_out,
	output [7:0]b_out,
	output [7:0]c_out
	
);

	wire [7:0] x;
	
	assign x = a | b;

	assign a_out = b ^ c;
	assign b_out = c<<4;
	assign c_out = x + 8'ha1 + W;
    

endmodule