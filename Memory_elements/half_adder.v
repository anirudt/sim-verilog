module half_adder(a,b,c_in,clk,sum,c_out);
	input a,b,c_in;
	input clk;
	output reg sum,c_out;

	always @(negedge(clk))
	begin
		sum = (a^b)^c_in;
		c_out=(a&b)|(b&c_in)|(a&c_in);

	end

endmodule

module stimulus();

	reg a,b,c_in,clk;
	wire sum, c_out;

	initial 
	begin
		$dumpfile("half_adder.vcd");
		$dumpvars;
	end

	//Instantiate the object

	half_adder test(a,b,c_in,clk,sum,c_out);

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
		a=0;
		b=0;
		c_in=1;

		#5 a=1;b=0;c_in=0;

		#20 a=0;b=1;c_in=0;

		#40 a=1;b=1;c_in=0;

		#60 a=1;b=1;c_in=1;
		$finish;
	end

	initial
	begin
		$monitor($time, "The sum is %b and the carry is %b", sum, c_out);

	end

endmodule
