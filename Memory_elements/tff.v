module tff(t,clk,q,qn);
	input t,clk;
	output q,qn;
	reg q,qn;

	initial begin q=0;qn=1; end

	always @(posedge clk)
	begin
		q <= (t^q);
		qn <= (t~^q);
	end
endmodule

module tester(q,qn,clk,t);
	input q,qn;
	output clk,t;
	reg clk,t;

	//Run the test once
	initial
	begin
		clk=0;
		//Dump results of the simulation to ff.cvd
		$dumpfile("tff.vcd");
		$dumpvars;
		//Generate input signal t
		   t=0; #9 t=1; #1 t=0; #1 t=1; #2 t=0; #1 t=1; #12 t=0;
		#1 t=1; #2 t=0; #1 t=1; #1 t=0; #1 t=1; #1 t=0; # 7 t=1;
		#8 $finish;
	end

	//Generate periodic clock signal
	always
	begin
		#4 clk=!clk;
	end
endmodule


module testbench;
	wire clk,t,q,qn;
	tff ff1(t,clk,q,qn);
	tester tst1(q,qn,clk,t);
endmodule

	

