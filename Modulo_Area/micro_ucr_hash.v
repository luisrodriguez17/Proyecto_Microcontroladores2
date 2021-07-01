`include "mainfor.v"


module micro_ucr_hash(
	input [95:0] bloque_bytes,
	input [31:0] nonce,
	input clk,
	input reset,
	output [23:0] hash

);

	wire [7:0] W [31:0];
	wire [7:0] a [31:0];
	wire [7:0] b [31:0];
	wire [7:0] c [31:0];


	parameter H0 =8'h1;
	parameter H1 =8'h89;
	parameter H2 =8'hfe;
	parameter k1 = 8'h99;
	parameter k2 = 8'ha1;
	genvar i,j;
	
	generate
		for(i = 0; i< 12; i = i+1) begin
			assign W[i] = bloque_bytes[(11-i)*8+:8];
		end
		for(i = 12; i< 16; i = i+1) begin
			assign W[i] = nonce[(3-(i-12))*8+:8];
		end

		for (i = 16;i< 32; i = i+1)begin
			assign W[i] = (W[i-3] | W[i-9] ^ W[i-14]);
		end
	endgenerate



	mainfor1 mainfor0(H0, H1, H2, W[0], a[0], b[0],c[0]);
	generate 
		

		for(j = 1; j < 17; j = j+1) begin
			mainfor1 mainfor11(a[j-1],b[j-1],c[j-1],W[j], a[j], b[j],c[j]);
		end
		for(j = 17; j < 32; j = j+1) begin
			mainfor2 mainfor22(a[j-1],b[j-1],c[j-1],W[j], a[j], b[j],c[j]);
		end
	endgenerate
	
	assign hash[23:16] = H0 + a[31];
	assign hash[15:8] = H1 + b[31];
	assign hash[7:0] = H2 + c[31];
	
endmodule