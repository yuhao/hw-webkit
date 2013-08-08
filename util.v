module comp2_6to1$(is_primitive_value, class_type, PrimitiveClass);
	input[5:0] class_type, PrimitiveClass;
	output is_primitive_value;

	assign is_primitive_value = (class_type == PrimitiveClass);
endmodule

module comp_logic$(is_valid_display_value, element_valid, is_svg_element, style_type, NOPSEUDO, display, NONE, INLINE, BLOCK);
	input element_valid, is_svg_element;
	input[5:0] style_type, NOPSEUDO;
	input[4:0] display, NONE, INLINE, BLOCK;
	output is_valid_display_value;

	assign is_valid_display_value = element_valid && is_svg_element && (style_type == NOPSEUDO) && ((display == INLINE) || (display == BLOCK) || (display == NONE));
endmodule

