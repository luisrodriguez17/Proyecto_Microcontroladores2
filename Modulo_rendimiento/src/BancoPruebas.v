`timescale 	1ns	/ 100ps
// `include "cmos_cells.v"

module BancoPruebas;

/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire [95:0]		bloque_bytes;		// From test_b of probador.v
wire			clk;			// From test_b of probador.v
wire [23:0]		hash;			// From Modelo_area of modulo_area.v
wire			inicio;			// From test_b of probador.v
wire			reset;			// From test_b of probador.v
wire [7:0]		target;			// From test_b of probador.v
wire			terminado;		// From Modelo_area of modulo_area.v
// End of automatics

modulo_rendimiento Modelo_rendimiento(/*AUTOINST*/
			// Outputs
			.terminado	(terminado),
			.hash		(hash[23:0]),
			// Inputs
			.inicio		(inicio),
			.bloque_bytes	(bloque_bytes[95:0]),
			.clk		(clk),
			.reset		(reset),
			.target		(target[7:0]));

probador test_b(/*AUTOINST*/
		// Outputs
		.inicio			(inicio),
		.bloque_bytes		(bloque_bytes[95:0]),
		.clk			(clk),
		.reset			(reset),
		.target			(target[7:0]),
		// Inputs
		.terminado		(terminado),
		.hash			(hash[23:0]));


endmodule
