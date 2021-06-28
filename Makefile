########Includes#######
INCLUDE := ./probador.v ./BancoPruebas.v ./micro_ucr_hash.v ./entrada_hash.v  ./modulo_area.v

##### Sintesis, Compilacion y Simulacion de los modulo Multiplexores #####
Compilar:
	@mkdir -p salidas/
	@mkdir -p bin/

#Compilacion y Simulacion
	@echo "\nCompilacion y simulacion\n"
	@iverilog $(INCLUDE)  -o testbench
	@vvp testbench

ver_graficos:
	@nohup gtkwave dump.vcd &
	@rm -f nohup.out
	@echo ""


AUTOINST:
	@emacs --batch $(INCLUDE) -f verilog-batch-auto


#### clean ###
clean:
	@rm -f ./src/*synth.v
	@rm -rfv salidas/
	@rm -rfv bin/