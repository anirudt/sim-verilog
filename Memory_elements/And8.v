module And8(a,b,out);
	input [7:0] a;
	input [7:0] b;
	output [7:0] out;
	/*
	begin
		out[0] <= a[0]&b[0];
		out[1] <= a[1]&b[1];
		out[2] <= a[2]&b[2];
		out[3] <= a[3]&b[3];
		out[4] <= a[4]&b[4];
		out[5] <= a[5]&b[5];
		out[6] <= a[6]&b[6];
		out[7] <= a[7]&b[7];

	end
	*/
	assign out = a&b;

endmodule

module tester();
	reg [7:0] a = 8'b00001100;
	reg [7:0] b = 8'b11110011;
	reg out;
	initial 
		begin
			$dumpfile("And8.vcd");
			$dumpvars;
			assign out = a&b;
			$display("A is %b, B is %b and the output is %b", a, b, out);
			#50 a = 8'b11110011;
			#50 $finish;
		end
	
endmodule

module testbench;
	wire [7:0] a,b,out;
	tester test();
	And8 and1(a,b,out);
endmodule








	
