module DMux4(in,sel,clk,a,b,c,d);
	input in,clk;
	input [1:0] sel;
	//Assuming that sel[2] is the MSB, and sel[0] is the LSB
	output reg a,b,c,d;
	reg p1,p2,p3,p4;
	
	always @(posedge(clk))
	begin
	if(sel==2'b00)
	begin
		a<=in;
		b=0;c=0;d=0;
	end
	if(sel==2'b01)
	begin
		b=in;
		a=0;c=0;d=0;
	end
	if(sel==2'b10)
	begin
		c=in;
		b=0;a=0;d=0;
	end
	if(sel==2'b11)
	begin
		d=in;
		b=0;c=0;a=0;
	end	
	
	end
	
endmodule



module DMux(in,sel,clk,p,q);
	input in,sel,clk;
	output reg p,q;

	initial begin p=0;q=0; end
	always @(posedge(clk))
	begin
		p=(sel)?0:in;
		q=(sel)?in:0;
	end
endmodule

module stimulus();
	reg in,clk;
	reg [1:0] sel;
	wire a,b,c,d;

	//Instantiation
	DMux4 tester(in,sel,clk,a,b,c,d);

	initial
	begin
		$dumpfile("DMux4.vcd");
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
		in=1;sel=2'b00;
		#10 in=0;sel=2'b00;
		#10 in=1;sel=2'b01;
		#10 in=0;sel=2'b01;
		#10 in=1;sel=2'b10;
		#10 in=0;sel=2'b10;
		#10 in=1;sel=2'b11;
		#10 in=0;sel=2'b11;
		#10 $finish;
	end
endmodule