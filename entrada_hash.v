module entrada_hash(
	input inicio,
	input terminado,
	input clk,
	input reset,
	output [31:0] nonce
);

	reg [31:0] contadores;

	always @(posedge clk) begin
		if(reset == 0)begin
			contadores <= 0;
			nonce <= 0;
		end
		else if(inicio == 1 & terminado == 0)begin 
			contadores <= contadores +1;
			nonce <= contadores;
		end
		else
			contadores <= contadores;
			nonce <= contadores;
		end
	end
	
endmodule
