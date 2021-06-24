
module probador (
	output inicio,
	output [95:0] bloque_bytes,
	output clk,
	output reset,
	output [7:0] target,
	input terminado,
	input [23:0] hash
    );
    

initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    reset<=0;
    inicio<=0;
    target<=;
    bloque_bytes<=;
    repeat (15) begin
    @(posedge clk); 
    end
    reset<=1;
	repeat (15) begin
    @(posedge clk); 
    end
    inicio<=1;
   
    
    
   
end

always@(posedge clk)begin
	if(terminado == 1)begin
		$finish;
	end  	
end


initial clk <= 0; 
always #1 clk <= ~clk;

endmodule
