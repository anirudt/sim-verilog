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

module tester();
	reg clk,reset,load;
	reg [3:0] in;
	wire [3:0] out;

	initial
	begin
		$dumpfile("reg4.vcd");
		$dumpvars;
	end

	reg4 t1(in,load,clk,reset,out);

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
	initial
	begin
		in=4'b0000;load=0;
		in=4'b0000;load=1;
		
		#5 in=4'b0010;load=0;
		#5 in=4'b0010;load=1;

		#20 in=4'b0100;load=0;

		#40 in=4'b0000;load=1;
		#60 in=4'b0001;load=1;
		
	end

endmodule
