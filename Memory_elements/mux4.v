module mux8(a,b,sel,clk,y);
	input [3:0] a;
	input [3:0] b;
	input clk,sel;
	output [3:0] y;

	mux t1(a[0],b[0],sel,clk,y[0]);
	mux t2(a[1],b[1],sel,clk,y[1]);
	mux t3(a[2],b[2],sel,clk,y[2]);
	mux t4(a[3],b[3],sel,clk,y[3]);

endmodule

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

module stimulus();
	reg [3:0] a;
	reg [3:0] b;
	reg clk,sel;
	wire [3:0] y;

	mux8 test(a,b,sel,clk,y);

	initial
	begin
		$dumpfile("mux4.vcd");
		$dumpvars;
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
		a=4'b0000;
		b=4'b0001;
		

		#5 a=4'b0010;b=4'b0011;sel=0;
		#5 a=4'b0010;b=4'b0011;sel=1;

		#20 a=4'b0100;b=4'b0111;sel=0;

		#20 a=4'b0100;b=4'b0111;sel=1;

		#40 a=4'b0000;b=4'b1111;sel=0;
		#40 a=4'b0000;b=4'b1111;sel=1;

		#60 a=4'b0001;b=4'b1110;sel=0;
		#60 a=4'b0001;b=4'b1110;sel=1;
		$finish;
	end

	initial
	begin
		$monitor($time, "The output is %b", y);

	end

endmodule