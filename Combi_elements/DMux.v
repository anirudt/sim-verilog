module DMux(in,sel,clk,a,b);
	input in,sel,clk;
	output reg a,b;

	always @(posedge(clk))
	begin
		a=(sel)?0:in;
		b=(sel)?in:0;
	end
endmodule

module stimulus();
	reg in,sel,clk;
	wire a,b;

	//Instantiate the object
	DMux t1(in,sel,clk,a,b);

	initial 
	begin
		$dumpfile("DMux.vcd");
		$dumpvars();
	end

	initial 
	begin
		clk=1'b0;
	end
	always
	begin
		#5 clk=~clk;
	end
	
	initial 
	begin
		in=0;sel=0;
		#40 in=0;sel=1;
		#40 in=1;sel=1;
		#40 in=1;sel=0;
		$finish;
	end

endmodule


