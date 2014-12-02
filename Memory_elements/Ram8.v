module Ram8(in,add,load,reset,clk,out);
	input load,clk,reset;
	input [3:0] in;
	input [2:0] add;
	output [3:0] out;

	wire loada,loadb,loadc,loadd,loade,loadf,loadg,loadh;

	DMux8 t1(load,add,clk,loada,loadb,loadc,loadd,loade,loadf,loadg,loadh);
	reg4 t2(in,loada,clk,reset,out);
	reg4 t3(in,loadb,clk,reset,out);
	reg4 t4(in,loadc,clk,reset,out);
	reg4 t5(in,loadd,clk,reset,out);
	reg4 t6(in,loade,clk,reset,out);
	reg4 t7(in,loadf,clk,reset,out);
	reg4 t8(in,loadg,clk,reset,out);
	reg4 t9(in,loadh,clk,reset,out);
endmodule

module reg4(in,load,clk,reset,out);
	input load,reset,clk;
	input [3:0] in;
	output [3:0] out;
	reg [3:0] buff;
	
	dff1 t1(out[0],in[0],clk,reset);
	dff1 t2(out[1],in[1],clk,reset);
	dff1 t3(out[2],in[2],clk,reset);
	dff1 t4(out[3],in[3],clk,reset);
	always @(posedge clk)
	begin
		buff=out;
		if(load)
		begin
			
		end
		else begin
			
		end
	end
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

module DMux8(in,sel,clk,a,b,c,d,e,f,g,h);
	input in,clk;
	input [2:0] sel;
	output reg a,b,c,d,e,f,g,h;
	reg p1;

	initial begin p1=sel[2]?1:0; end
	always @(posedge(clk))
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

//Have to add the stimulus workbench

module stimulus();
	reg load,reset,clk;
	reg [3:0] in;
	reg [2:0] add;
	wire [3:0] out;

	Ram8 t1(in,add,load,reset,clk,out);

	initial
	begin
		$dumpfile("Ram8.vcd");
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
		reset=1'b1;
		#15 reset=1'b0;
		#180 reset=1'b1;
		#10 reset=1'b0;
		
		//This terminates the simulation
	end

	initial
	begin
		#20 in=4'b1100;add=3'b000;load=1;
		#20 in=4'b1110;add=3'b000;load=0;
		#20 in=4'b1111;add=3'b001;load=1;
		#20 in=4'b1101;add=3'b001;load=0;
		#20 in=4'b1100;add=3'b010;load=1;
		#20 in=4'b1100;add=3'b010;load=0;
		#20 in=4'b1000;add=3'b011;load=1;
		#20 in=4'b1000;add=3'b011;load=0;
		#20 in=4'b0011;add=3'b100;load=1;
		#20 in=4'b0001;add=3'b101;load=1;
		#20 in=4'b0010;add=3'b110;load=1;
		#20 in=4'b0101;add=3'b111;load=1;
		#20 $finish;
	end

	initial begin
		$display($time,"Value at address %b is %b",add,out);
	end
endmodule

	
