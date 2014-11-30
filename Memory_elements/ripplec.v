module ripplec(q,clk,reset)
	input clk,reset;
	output [3:0] q;
	wire set;
	wire a,b,c,d;
	set = 1'b1;
	tff1 tf0(q[0],clk,reset);
	tff1 tf1(q[1],q[0],b);
	tff1 tf2(q[2],q[1],b);
	tff1 tf3(q[3],q[2],b);
endmodule

module tff1(q,clk,reset);
	output q;
	input clk,reset;
	wire d;

	dff1 dff0(q,d,clk,reset);
	not n1(d,q);

endmodule

module dff1(q,d,clk,reset)
	input eset;
	output q;

	always @(posedge reset negedge clk)
	if(reset)
	begin
		q=1'b0;
	end
	
	else 
	begin
		q=d;	
	end	
	
endmodule

