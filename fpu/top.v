module TOP();
	reg			clk;
	reg[1:0]	rmode;
	reg[2:0]	fpu_op;
	reg[31:0]	opa, opb;
	wire[31:0]	ans;
	wire		inf, snan, qnan;
	wire		ine;
	wire		overflow, underflow;
	wire		zero;
	wire		div_by_zero;

	fpu fpu1(clk, rmode, fpu_op, opa, opb, ans, inf, snan, qnan, ine, overflow, underflow, zero, div_by_zero);

	initial
	begin
		clk = 0;
		rmode = 2'b0;
		fpu_op = 3'b0;
		opa = 32'b0;
		opb = 32'b0;
	 
		#1
		rmode = 2'b1;
		fpu_op = 3'b1;
		opa = 32'h23;
		opb = 32'hF3491230;
	end

    always #20 clk = ~clk;

	// Run simulation for 15 ns.  
	initial #200 $finish;

	initial
	begin
		$dumpfile ("fpu.vcd");
		$dumpvars (0, TOP);
	end

endmodule 
