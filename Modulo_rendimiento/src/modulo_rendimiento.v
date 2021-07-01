module modulo_rendimiento(
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

	// always @(posedge terminado) begin
	// 	hash <= p_hash;
	// end

	
	always @(posedge clk) begin

        if((p_hash[23:16] < target & p_hash[15:8] < target | terminado == 1) & reset == 1)begin
            terminado<=1;	
            hash <= p_hash;	

            if (terminado == 0)begin
                hash <= p_hash;	
            end
            else begin
                hash <= hash;
            end
            
        end
        else begin
            terminado <= 0;
            hash <= 0;
        end
	end


endmodule

module micro_ucr_hash(
	input [95:0] bloque_bytes,
	input [31:0] nonce,
	input clk,
	input reset,
	output reg [23:0] hash

);

	wire [7:0] W [31:0];
	// reg [7:0] W2 [31:0];

	wire [7:0] a [31:0];
	wire [7:0] b [31:0];
	wire [7:0] c [31:0];


	parameter H0 = 8'h1;
	parameter H1 = 8'h89;
	parameter H2 = 8'hfe;
	parameter k1 = 8'h99;
	parameter k2 = 8'ha1;
	genvar i,j;
	
	// Parte combinacional 

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

	//Parte secuencial

    integer k;
	always @(posedge clk) begin
		// for (k = 0; k<32; k=k+1) begin
        //     W2[k] <= W1[k];
        // end

		// Calculo de resultado
		hash[23:16] <= H0 + a[31];
		hash[15:8] <= H1 + b[31];
		hash[7:0] <= H2 + c[31];
	end
	
	
	
endmodule


module entrada_hash(
	input inicio,
	input terminado,
	input clk,
	input reset,
	output reg [31:0] nonce
);

	reg [31:0] contadores;

	always @(posedge clk) begin
		if(reset == 0)begin
			contadores <= 0;
			nonce <= 0;
		end
		else begin
            if(inicio == 1 & terminado == 0)begin 
                contadores <= contadores + 1;
                nonce <= contadores;
            end
            else begin
                contadores <= contadores;
                nonce <= contadores;
            end
        end 
	end
	
endmodule


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