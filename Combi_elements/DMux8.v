module DMux8(in,sel,clk,a,b,c,d,e,f,g,h);
	input in,clk;
	input [2:0] sel;
	output reg a,b,c,d,e,f,g,h;
	reg p1;

	initial begin p1=sel[2]?1:0; end
	always @(negedge(clk))
	begin
	if(sel==3'b000)
	begin
		a=in;
		b=0;c=0;d=0;e=0;f=0;g=0;h=0;
	end
	if(sel==3'b001)
	begin
		a=0;
		b=in;c=0;d=0;e=0;f=0;g=0;h=0;
	end
	if(sel==3'b010)
	begin
		a=0;
		b=0;c=in;d=0;e=0;f=0;g=0;h=0;
	end
	if(sel==3'b011)
	begin
		a=0;
		b=0;c=0;d=in;e=0;f=0;g=0;h=0;
	end
	if(sel==3'b100)
	begin
		a=0;
		b=0;c=0;d=0;e=in;f=0;g=0;h=0;
	end
	if(sel==3'b101)
	begin
		a=0;
		b=0;c=0;d=0;e=0;f=in;g=0;h=0;
	end
	if(sel==3'b110)
	begin
		a=0;
		b=0;c=0;d=0;e=0;f=0;g=in;h=0;
	end
	if(sel==3'b111)
	begin
		a=0;
		b=0;c=0;d=0;e=0;f=0;g=0;h=in;
	end
	end
endmodule

module DMux4(in,sel,clk,a,b,c,d);
	input in,clk;
	input [1:0] sel; 
	//Assuming that sel[1] is the MSB, and sel[0] is the LSB
	output reg a,b,c,d;
	reg p1,p2,p3,p4;
	
	always @(negedge(clk))
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

module stimulus();
	reg in,clk;
	reg [2:0] sel;
	wire a,b,c,d,e,f,g,h;

	//Instantiate the object
	DMux8 tester(in,sel,clk,a,b,c,d,e,f,g,h);

	initial
	begin
		$dumpfile("DMux8.vcd");
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
		
		#10 in=1;sel=3'b000;
		#10 in=1;sel=3'b001;
		#10 in=1;sel=3'b010;
		#10 in=1;sel=3'b011;
		#10 in=1;sel=3'b100;
		#10 in=1;sel=3'b101;
		#10 in=1;sel=3'b110;
		#10 in=1;sel=3'b111;
		#10 $finish;
	end
	

	initial
	begin
		$monitor($time, "sel[2]=%b",sel[2]);
	end

	endmodule