module dff_59$(d, q, reset, clock, enable);

	input[58:0] d;
	input clock, reset, enable;
	output[58:0] q;

	reg[58:0] q;

	always @(posedge clock) begin if(enable) q = d; end
	always @(reset) begin if(reset) q = 0; end

endmodule

module dff_32$(d, q, reset, clock, enable);

	input[31:0] d;
	input clock, reset, enable;
	output[31:0] q;

	reg[31:0] q;

	always @(posedge clock) begin if(enable) q = d; end
	always @(reset) begin if(reset) q = 0; end

endmodule

module and2_1$(ld_en_display, is_primitive_value, is_valid_display_value);
	input is_primitive_value, is_valid_display_value;
	output ld_en_display;

	assign ld_en_display = is_primitive_value & is_valid_display_value;
endmodule

module mux2_1$ (out, a, b, s);
	input a, b, s;
	output out;

	assign out = (s) ? a : b;
endmodule

module mux2_32$ (out, a, b, s);
	input[31:0] a, b;
	input s;
	output[31:0] out;

	assign out = (s) ? a : b;
endmodule

