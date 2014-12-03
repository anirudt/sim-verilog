module comp4(a,b,clk,g,e,l);
	input [3:0] a,b;
	input clk;
	output reg g,e,l;
	wire g1,g2,g3,g4,e1,e2,e3,e4,gl1,l2,l3,l4;

	initial begin g<=0;e=1;l=0; end

	comp t1(a[0],b[0],clk,g1,e1,l1);
	comp t2(a[1],b[1],clk,g2,e2,l2);
	comp t3(a[2],b[2],clk,g3,e3,l3);
	comp t4(a[3],b[3],clk,g4,e4,l4);

	always @(posedge(clk))
	begin
		g<=g4|(e4&g3)|(e4&e3&g2)|(e4&e3&e2&g1);
		l<=l4|(e4&l3)|(e4&e3&l2)|(e4&e3&e2&l1);
		e<=(e4&e3&e2&e1);	
	end
endmodule

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
	reg [3:0] a,b;
	reg clk;
	wire g,e,l;

	comp4 tester(a,b,clk,g,e,l);

	initial begin
		$dumpfile("comp4.vcd");
		$dumpvars;

	end

	initial begin
		clk=1'b0;
	end
	always
	begin
		#5 clk=~clk;
	end

	initial begin
		a=4'b0000;
		b=4'b0001;
		

		#5 a=4'b0010;b=4'b0011;

		#20 b=4'b0100;a=4'b0111;

		#40 a=4'b0000;b=4'b1111;

		#60 a=4'b0001;b=4'b0001;
		#20 $finish;
	end
	endmodule
