`include "micro_ucr_hash.v"
`include "entrada_hash.v"

module modulo_area(
	input inicio,
	input [95:0] bloque_bytes,
	input clk,
	input reset,
	input [7:0] target,
	output reg terminado,
	output reg [23:0] hash

);
	wire [31:0] nonce;
	wire [23:0] p_hash;
	entrada_hash entrada_hash1(inicio, terminado, clk, reset,  nonce);
	micro_ucr_hash micro_ucr_hash1(bloque_bytes, nonce, clk, reset, p_hash);

	always @(posedge terminado) begin
		hash <= p_hash;
	end

	
	always @(posedge clk) begin
		if(reset == 0)begin
			terminado <= 0;
			hash<=0;
		end
		else begin
			if(p_hash[23:16] < target & p_hash[15:8] < target | terminado == 1)begin
				terminado<=1;		
				
			end
			else begin
				terminado <= 0;
				// hash <= 0;
			end
		end
	end


endmodule