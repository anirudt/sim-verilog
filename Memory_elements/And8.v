module And8(a,b,out);
	input [7:0] a;
	input [7:0] b;
	output [7:0] out;
	
	
		assign out[0] = a[0]&b[0];
		assign out[1] = a[1]&b[1];
		assign out[2] = a[2]&b[2];
		assign out[3] = a[3]&b[3];
		assign out[4] = a[4]&b[4];
		assign out[5] = a[5]&b[5];
		assign out[6] = a[6]&b[6];
		assign out[7] = a[7]&b[7];

	
	
	
endmodule








	
