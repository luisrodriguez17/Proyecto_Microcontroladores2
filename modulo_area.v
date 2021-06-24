module modulo_area(
	input inicio,
	input [95:0] bloque_bytes,
	input clk,
	input reset,
	input [7:0] target,
	output terminado,
	output [23:0] hash

);
	wire [31:0] nonce;

	entrada_hash entrada_hash1(inicio, terminado, clk, reset,  nonce);
	micro_ucr_hash micro_ucr_hash1(bloque_bytes, nonce, clk, reset, hash);
	
	always @(*) begin
		if(reset == 0)begin
			terminado = 0;
		end
		else begin
			if(hash[23:16] < target & hash[15:8] < target)begin
				terminado = 1;
			end
			else begin
				terminado = 0;
			end
		end
	end





endmodule


