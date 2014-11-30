module And8_tb();
	wire [7:0] t_y;
	reg [7:0] t_a, t_b;
	And8 my_gate( .a(t_a), .b(t_a), .out(t_y));

	initial 
	begin
		$monitor(t_a, t_b, t_y);
		t_a = 8'b00001100;
		t_b = 8'b11110011;

		#5
		t_a = 8'b11111111;
		t_b = 8'b10001000;

	end
	endmodule
