module display$(clk,
				reset,
				class_type,
				display,
				element_valid,
				node_flag,
				PrimitiveClass,
				NONE,
				INLINE,
				BLOCK,
				NOPSEUDO,
				noninherited_flags);
	//implements: setPropertyHandler(CSSPropertyDisplay, ApplyPropertyDisplay::createHandler());

	// io signals
	input clk, reset;
	input[5:0] class_type; // m_classType
	input[4:0] display; // EDisplay is defined in rendering/style/RenderStyleConstants.h
	input element_valid; // styleResolver->element()
	input[31:0] node_flag; // NodeFlags (defined in dom/Node.h) for styleResolver->element()->isSVGElement(), which in fact only needs 1 bit
	input[5:0] PrimitiveClass;
	input[4:0] NONE;
	input[4:0] INLINE;
	input[4:0] BLOCK;
	input[5:0] NOPSEUDO;
	output[58:0] noninherited_flags; // defined in rendering/style/RenderStyle.h

	wire is_primitive_value;
	wire is_valid_display_value;
	wire ld_en_display;
	wire is_svg_element;
	wire[5:0] style_type; //styleResolver->style()->styleType() reads _styleType
	wire[53:0] other_flags;

	// logics
	assign is_svg_element = node_flag[5];
	assign style_type = noninherited_flags[41:36];
	assign other_flags = noninherited_flags[58:5];

	comp2_6to1$ comp1(is_primitive_value, class_type, PrimitiveClass);
	isValidDisplayValue$ logic1(is_valid_display_value, element_valid, is_svg_element, style_type, NOPSEUDO, display, NONE, INLINE, BLOCK); // isValidDisplayValue(styleResolver, display)
	and2_1$ and1(ld_en_display, is_primitive_value, is_valid_display_value);
	dff_59$ dff1({other_flags, display}, noninherited_flags, reset, clk, ld_en_display); //styleResolver->style()->setDisplay(display) sets _effectiveDisplay

endmodule

