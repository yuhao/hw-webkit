module dff_59$(d, q, clock, enable);

	input[58:0] d;
	input clock;
	input enable;

	output[58:0] q;

	reg[58:0] q;

	always @ (posedge clock) begin if (enable) q = d; end

endmodule

module and2_1$(ld_en_display, is_primitive_value, is_valid_display_value);
	input is_primitive_value, is_valid_display_value;
	output ld_en_display;

	assign ld_en_display = is_primitive_value & is_valid_display_value;
endmodule

