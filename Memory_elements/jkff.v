//jkff modules represents a JK type flip-flop
module jkff(j,k,clk,q,qn);
	input j,k,clk;
	output q,qn;
	reg q,qn;

	//Initialize flip-flop outputs
	initial begin q=0; qn=1; end

	//Change output on positive clock edge
	always @(posedge clk) 
	begin
		q <= (j&qn)|((!k)&q);
		qn <= (!j|q)&(k|qn);
	end
endmodule


module tester(q,qn,clk,j,k);
	input q,qn;
	output clk,j,k;
	reg clk,j,k;

	//Run the test once
	initial
	begin
		clk=0;
		//Dump results of the simulation to ff.cvd
		$dumpfile("jkff.vcd");
		$dumpvars;
		//Generate input signal j,k
		   j=0;k=0; #9 j=1;k=0; #1 j=0;k=1; #1 j=1;k=1; #2 j=0;k=0; #1 j=1;k=0; #12 j=0;k=1;
		#1 j=1;k=0; #2 j=0;k=0; #1 j=1;k=1; #1 j=0;k=0; #1 j=1;k=1; #1 j=0;k=1; #7 j=1;k=0;
		#8 $finish;
	end

	//Generate periodic clock signal
	always
	begin
		#4 clk=!clk;
	end
endmodule


module testbench;
	wire clk,j,k,q,qn;
	jkff ff1(j,k,clk,q,qn);//creating an instance of the module
	tester tst1(q,qn,clk,j,k);//creating an instance of the module
endmodule
