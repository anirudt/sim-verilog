// This is a mod 16 ripple counter made with a test bench, testing 
// till about 200 seconds. This is made out of composite blocks 
// such as D and T flipflops. If an output is to be given as a parameter
// for another composite system, indicate it as an output only. 
// Otherwise, for the bottom most subsystem, indicate it as a output reg.
// Do the initializing for the subsystem block. 

// This is the BOTTOM UP Procedure.


module ripplec(q,clk,reset);
	input clk,reset;
	output [3:0] q;
	
	
	tff1 tf0(q[0],clk,reset);
	tff1 tf1(q[1],q[0],reset);
	tff1 tf2(q[2],q[1],reset);
	tff1 tf3(q[3],q[2],reset);
endmodule

module tff1(q,clk,reset);
	output q;
	input clk,reset;
	wire d;
	

	dff1 dff0(q,d,clk,reset);
	not n1(d,q);

endmodule

module dff1(q,d,clk,reset);
	input reset,d,clk;
	output reg q;

	initial begin q=0; end
	
	always @(posedge reset or negedge clk)
	begin
	if(reset)
	begin
		q=1'b0;
	end
	
	else 
	begin
		q=d;	
	end	
	end
endmodule

module stimulus;
	reg clk;
	reg reset;
	wire [3:0] q;

	initial 
	begin
		$dumpfile("ripplec.vcd");
		$dumpvars;
	end
		


	//instantiate the main block first, which further contains the sub blocks

	ripplec tst(q,clk,reset);
	//setting the clock reference
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
		reset=1'b1;
		#15 reset=1'b0;
		#180 reset=1'b1;
		#10 reset=1'b0;
		#20 $finish;
		//This terminates the simulation
	end

	//For monitoring the outputs
	initial 
	$monitor($time, "Output q=%b%b%b%b", q[3],q[2],q[1],q[0]);

endmodule	
	


