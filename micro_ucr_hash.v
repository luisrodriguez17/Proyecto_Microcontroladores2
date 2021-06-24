module modulo_area(
	input [95:0] bloque_bytes,
	input [31:0] nonce,
	input clk,
	input reset,
	output [23:0] hash

);

	wire [7:0] W [31:0];
	wire [7:0] a [31:0] ;
	wire [7:0] b [31:0];
	wire [7:0] c [31:0];
	wire [7:0] k;
	integer i;
	parameter H0 ='h1;
	parameter H1 ='h89;
	parameter H2 ='hfe;
	parameter k1 = 'h99;
	parameter k2 = 'ha1;
	genvar j;
	
	always @(*) begin
		if(reset == 1)begin
			k =1;
			x =1;
			
			
			for(i = 0; i< 12; i = i+1) begin
				W[i] = bloque_bytes[i*8+:8];
			end
			for(i = 12; i< 16; i = i+1) begin
				W[i] = nonce[i*8+:8];
			end
		
			for (i = 16;i< 32; i = i+1)begin
				W[i] = (W[i-3] | W[i-9] ^ W[i-14]);
			end
			
		end
		
	end
	generate
		mainfor mainfor0(H0, H1, H2, k1, W[0], a[0], b[0],c[0]);
		for(j = 1; j < 17; j = j+1)
			mainfor mainfor1(a[j-1],b[j-1],c[j-1],k1,W[j], a[j], b[j],c[j]);
		end
		for(j = 17; j < 32; j = j+1)
			mainfor mainfor1(a[j-1],b[j-1],c[j-1],k2,W[j], a[j], b[j],c[j]);
		end
	endgenerate
	
	assign hash[23:16] = H0 + a[31];
	assign hash[15:8] = H1 + b[31];
	assign hash[7:0] = H2 + c[31];
	
	





endmodule

module mainfor(
	input [7:0]a,
	input [7:0]b,
	input [7:0]c,
	input [7:0]k,
	input [7:0]W,
	output [7:0]a_out,
	output [7:0]b_out,
	output [7:0]c_out
	
);

	wire [7:0]x;
	
	generate
		if(k == 'h99)begin
			assign x = (a ^ b);
		end
		else begin
			assign x = (a | b);
		end
	endgenerate
	
	assign  a_out = (b ^ c);
	assign b_out = (c<<4);
	assign c_out = (x + k + W);

	


endmodule




