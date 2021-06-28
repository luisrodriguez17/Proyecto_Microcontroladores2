
module probador (
	output reg  inicio,
	output reg [95:0] bloque_bytes,
	output reg clk,
	output reg reset,
	output reg [7:0] target,
	input terminado,
	input [23:0] hash
    );
    

initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    reset<=0;
    inicio<=0;
    target<='h10;
    bloque_bytes <= {8'h73, 8'ha9, 8'hde, 8'hbe, 8'h6a, 8'hf9, 8'hc9, 8'h5e, 8'h9f, 8'h05, 8'h2d, 8'h59};
    repeat (15) begin
    @(posedge clk); 
    end
    reset<=1;
	repeat (15) begin
    @(posedge clk); 
    end
    inicio<=1;
   
    // repeat (1500) begin
    // @(posedge clk); 
    // end
    
   
end

always@(posedge clk)begin
	if(terminado == 1'b1)begin
		$finish;
	end  	
end


initial clk <= 0; 
always #1 clk <= ~clk;

endmodule
