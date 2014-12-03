module full_adder(a,b,clk,sum,c_out);
	input [3:0] a;
	input [3:0] b;
	input clk;
	output [3:0] sum;
	output c_out;
	wire p,q,r,s,g,h,j,k;

	

	half_adder t1(a[0],b[0],1'b0,clk,sum[0],q);
	half_adder t2(a[1],b[1],q,clk,sum[1],r);
	half_adder t3(a[2],b[2],r,clk,sum[2],s);
	half_adder t4(a[3],b[3],s,clk,sum[3],c_out);
	

endmodule

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

	reg [3:0] a;
	reg [3:0] b;
	reg clk;
	wire [3:0] sum;
	wire c_out;

	initial
	begin
		$dumpfile("full_adder.vcd");
		$dumpvars;
	end

	full_adder test(a,b,clk,sum,c_out);

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
		a=4'b0000;
		b=4'b0001;
		

		#5 a=4'b0010;b=4'b0011;

		#20 a=4'b0100;b=4'b0111;

		#40 a=4'b0000;b=4'b1111;

		#60 a=4'b0001;b=4'b1110;
		$finish;
	end

	initial
	begin
		$monitor($time, "The sum is %b and the carry is %b", sum, c_out);

	end



endmodule