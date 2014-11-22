module mux(a,b,sel,clk,y);
	input a,b,sel,clk;
	output y;
	reg y;

	initial begin y=0; end

	always @(posedge clk) 
	begin
		y = (!sel&a)|(sel&b);
	end
endmodule


module tester(y,clk,sel,a,b);
	input y;
	output a,b,sel,clk;
	reg a,b,sel,clk;
	initial
	begin
		clk=0;
		//Dump results of the simulation to ff.cvd
		$dumpfile("mux.vcd");
		$dumpvars;
		//Generate input signal j,k
		   a=0;b=0;sel=0; #9 a=1;b=0;sel=1; #1 a=0;b=1;sel=0; #1 a=1;b=1;sel=0; #2 a=0;b=0;sel=1; #1 a=1;b=0;sel=0; #12 a=0;b=1;sel=0;
		#1 a=1;b=0; #2 a=0;b=0;sel=0; #1 a=1;b=1;sel=1; #1 a=0;b=0;sel=0; #1 a=1;b=1;sel=1; #1 a=0;b=1;sel=0; #7 a=1;b=0;sel=0;
		#8 $finish;
	end

	//Generate periodic clock signal
	always
	begin
		#4 clk=!clk;
	end
endmodule

module testbench;
	wire clk,a,b,sel,y;
	mux ff1(a,b,sel,clk,y);//creating an instance of the module
	tester tst1(y,clk,sel,a,b);//creating an instance of the module
endmodule
