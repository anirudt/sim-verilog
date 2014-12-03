module comp(a,b,clk,g,e,l);
	input a,b;
	input clk;
	output reg g,e,l;

	always @(posedge(clk))
	begin
		g<=(a)&(~b);
		e<=(a&b)|((~a)&(~b));
		l<=(~a&b);
	end
endmodule


module stimulus();
	reg a,b,clk;
	wire g,e,l;

	initial
	begin
		$dumpfile("comp.vcd");
		$dumpvars;
	end

	comp tester(a,b,clk,g,e,l);

	initial
	begin
		clk=1'b0;	
	end
	always
	begin
		#5 clk=~clk;
	end

	initial begin
		a=1;b=0;
		#20 a=0;b=0;
		#20 a=0;b=1;
		#20 a=1;b=1;
		$finish;
	end
endmodule
