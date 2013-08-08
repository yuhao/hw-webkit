module TOP();

	reg clk;
	reg[5:0] class_type;
	reg[4:0] display;
	reg element_valid;
	reg[31:0] node_flag;
	reg[58:0] noninherited_flags;
	wire[58:0] output_noninherited_flags;

	display$ display1(clk, class_type, display, element_valid, node_flag, noninherited_flags, output_noninherited_flags);

	initial
	begin
		clk = 1'b0;
		class_type = 6'b0;
		display = 5'b10;
		element_valid = 1'b1;
		node_flag = 32'b100000;
		noninherited_flags = 59'b0;

		#20
		clk = 1'b1;
		#20
		clk = 1'b0;
		#1
		$display(output_noninherited_flags);
	end

	initial #1000 $finish;

	initial
	begin
		$dumpfile("sru.dump");
		$dumpvars(0, TOP);
	end

endmodule

