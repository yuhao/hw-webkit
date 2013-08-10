module comp2_10to1$(out, a, b);
	input[9:0] a, b;
	output out;

	assign out = (a == b);
endmodule

module comp2_7to1$(out, a, b);
	input[6:0] a, b;
	output out;

	assign out = (a == b);
endmodule

module comp2_6to1$(out, a, b);
	input[5:0] a, b;
	output out;

	assign out = (a == b);
endmodule

/* used in Display */
module isValidDisplayValue$(is_valid_display_value,
							element_valid,
							is_svg_element,
							style_type,
							NOPSEUDO,
							display,
							NONE,
							INLINE,
							BLOCK);

	input element_valid, is_svg_element;
	input[5:0] style_type, NOPSEUDO;
	input[4:0] display, NONE, INLINE, BLOCK;
	output is_valid_display_value;

	assign is_valid_display_value = element_valid && is_svg_element && (style_type == NOPSEUDO) && ((display == INLINE) || (display == BLOCK) || (display == NONE));

endmodule

/* used in color */
module getIdent$(ident,
				 m_primitiveUnitType,
				 CSS_IDENT,
				 m_value_ident);

	input[6:0] m_primitiveUnitType;
	input[6:0] CSS_IDENT;
	input[31:0] m_value_ident; // in fact, only 10 lsb can be valid since ident is 10-bit wide
	output[31:0] ident;

	wire is_css_ident;

	comp2_7to1$ comp1(is_css_ident,
					  m_primitiveUnitType,
					  CSS_IDENT);
	mux2_32$ mux1(ident,
				  32'b0,
				  m_value_ident,
				  is_css_ident);

endmodule

module colorForCSSValue$(color_for_value,
						 CSSValueMenu,
						 CSSValueAqua,
						 CSSValueBlack,
						 CSSValueBlue,
						 CSSValueFuchsia,
						 CSSValueGray,
						 CSSValueGreen,
						 CSSValueLime,
						 CSSValueMaroon,
						 CSSValueNavy,
						 CSSValueOlive,
						 CSSValueOrange,
						 CSSValuePurple,
						 CSSValueRed,
						 CSSValueSilver,
						 CSSValueTeal,
						 CSSValueWhite,
						 CSSValueYellow,
						 CSSValueTransparent,
						 CSSValueActiveborder,
						 CSSValueActivecaption,
						 CSSValueAppworkspace,
						 CSSValueBackground,
						 CSSValueButtonface,
						 CSSValueButtonhighlight,
						 CSSValueButtonshadow,
						 CSSValueButtontext,
						 CSSValueCaptiontext,
						 CSSValueGraytext,
						 CSSValueHighlight,
						 CSSValueHighlighttext,
						 CSSValueInactiveborder,
						 CSSValueInactivecaption,
						 CSSValueInactivecaptiontext,
						 CSSValueInfobackground,
						 CSSValueInfotext,
						 CSSValueMenutext,
						 CSSValueGrey,
						 CSSValueMenulist,
						 CSSValueMenulistButton,
						 CSSValueMenulistText,
						 CSSValueMenulistTextfield,
						 CSSValueAquamarine,
						 CSSValueBlueviolet,
						 CSSValueGreenyellow,
						 CSSValueLimegreen,
						 CSSValueOlivedrab,
						 CSSValueOrangered,
						 CSSValueWhitesmoke,
						 CSSValueYellowgreen,
						 ident);
	input[31:0] ident;
	input[9:0] CSSValueMenu;
	input[9:0] CSSValueAqua;
	input[9:0] CSSValueBlack;
	input[9:0] CSSValueBlue;
	input[9:0] CSSValueFuchsia;
	input[9:0] CSSValueGray;
	input[9:0] CSSValueGreen;
	input[9:0] CSSValueLime;
	input[9:0] CSSValueMaroon;
	input[9:0] CSSValueNavy;
	input[9:0] CSSValueOlive;
	input[9:0] CSSValueOrange;
	input[9:0] CSSValuePurple;
	input[9:0] CSSValueRed;
	input[9:0] CSSValueSilver;
	input[9:0] CSSValueTeal;
	input[9:0] CSSValueWhite;
	input[9:0] CSSValueYellow;
	input[9:0] CSSValueTransparent;
	input[9:0] CSSValueActiveborder;
	input[9:0] CSSValueActivecaption;
	input[9:0] CSSValueAppworkspace;
	input[9:0] CSSValueBackground;
	input[9:0] CSSValueButtonface;
	input[9:0] CSSValueButtonhighlight;
	input[9:0] CSSValueButtonshadow;
	input[9:0] CSSValueButtontext;
	input[9:0] CSSValueCaptiontext;
	input[9:0] CSSValueGraytext;
	input[9:0] CSSValueHighlight;
	input[9:0] CSSValueHighlighttext;
	input[9:0] CSSValueInactiveborder;
	input[9:0] CSSValueInactivecaption;
	input[9:0] CSSValueInactivecaptiontext;
	input[9:0] CSSValueInfobackground;
	input[9:0] CSSValueInfotext;
	input[9:0] CSSValueMenutext;
	input[9:0] CSSValueGrey;
	input[9:0] CSSValueMenulist;
	input[9:0] CSSValueMenulistButton;
	input[9:0] CSSValueMenulistText;
	input[9:0] CSSValueMenulistTextfield;
	input[9:0] CSSValueAquamarine;
	input[9:0] CSSValueBlueviolet;
	input[9:0] CSSValueGreenyellow;
	input[9:0] CSSValueLimegreen;
	input[9:0] CSSValueOlivedrab;
	input[9:0] CSSValueOrangered;
	input[9:0] CSSValueWhitesmoke;
	input[9:0] CSSValueYellowgreen;
	output[31:0] color_for_value;

	reg[31:0] color_for_value;

	always @(ident)
	begin
		case(ident[9:0])
			CSSValueAqua:  assign color_for_value = 32'hFF00FFFF;
			CSSValueBlack: assign color_for_value = 32'hFF000000;
			CSSValueBlue: assign color_for_value = 32'hFF0000FF;
			CSSValueFuchsia: assign color_for_value = 32'hFFFF00FF;
			CSSValueGray: assign color_for_value = 32'hFF808080;
			CSSValueGreen: assign color_for_value = 32'hFF008000;
			CSSValueGrey: assign color_for_value = 32'hFF808080;
			CSSValueLime: assign color_for_value = 32'hFF00FF00;
			CSSValueMaroon: assign color_for_value = 32'hFF800000;
			CSSValueNavy: assign color_for_value = 32'hFF000080;
			CSSValueOlive: assign color_for_value = 32'hFF808000;
			CSSValueOrange: assign color_for_value = 32'hFFFFA500;
			CSSValuePurple: assign color_for_value = 32'hFF800080;
			CSSValueRed: assign color_for_value = 32'hFFFF0000;
			CSSValueSilver: assign color_for_value = 32'hFFC0C0C0;
			CSSValueTeal: assign color_for_value = 32'hFF008080;
			CSSValueTransparent: assign color_for_value = 32'h00000000;
			CSSValueWhite: assign color_for_value = 32'hFFFFFFFF;
			CSSValueYellow: assign color_for_value = 32'hFFFFFF00;
			// the following implements: RenderTheme::defaultTheme()->systemColor(cssValueId);
			CSSValueActiveborder: assign color_for_value = 32'hFFFFFFFF;
			CSSValueActivecaption: assign color_for_value = 32'hFFCCCCCC;
			CSSValueAppworkspace: assign color_for_value = 32'hFFFFFFFF;
			CSSValueBackground: assign color_for_value = 32'hFF6363CE;
			CSSValueButtonface: assign color_for_value = 32'hFFC0C0C0;
			CSSValueButtonhighlight: assign color_for_value = 32'hFFDDDDDD;
			CSSValueButtonshadow: assign color_for_value = 32'hFF888888;
			CSSValueButtontext: assign color_for_value = 32'hFF000000;
			CSSValueCaptiontext: assign color_for_value = 32'hFF000000;
			CSSValueGraytext: assign color_for_value = 32'hFF808080;
			CSSValueHighlight: assign color_for_value = 32'hFFB5D5FF;
			CSSValueHighlighttext: assign color_for_value = 32'hFF000000;
			CSSValueInactiveborder: assign color_for_value = 32'hFFFFFFFF;
			CSSValueInactivecaption: assign color_for_value = 32'hFFFFFFFF;
			CSSValueInactivecaptiontext: assign color_for_value = 32'hFF7F7F7F;
			CSSValueInfobackground: assign color_for_value = 32'hFFFBFCC5;
			CSSValueInfotext: assign color_for_value = 32'hFF000000;
			CSSValueMenu: assign color_for_value = 32'hFFC0C0C0;
			default: assign color_for_value = 32'h0;
		endcase
	end
endmodule

module colorFromPrimitiveValue$(color_FromPrimitiveValue,
								ident,
								for_visitedLink,
								is_link_element,
								document_text_color,
								document_visitedLink_color,
								document_link_color,
								document_activeLink_color,
								inherited_color,
								m_value_rgbcolor,
								m_primitiveUnitType,
							    CSSValueMenu,
							    CSSValueAqua,
							    CSSValueBlack,
							    CSSValueBlue,
							    CSSValueFuchsia,
							    CSSValueGray,
							    CSSValueGreen,
							    CSSValueLime,
							    CSSValueMaroon,
							    CSSValueNavy,
							    CSSValueOlive,
							    CSSValueOrange,
							    CSSValuePurple,
							    CSSValueRed,
							    CSSValueSilver,
							    CSSValueTeal,
							    CSSValueWhite,
							    CSSValueYellow,
							    CSSValueTransparent,
    						    CSSValueWebkitLink,
    						    CSSValueWebkitActivelink,
							    CSSValueActiveborder,
							    CSSValueActivecaption,
							    CSSValueAppworkspace,
							    CSSValueBackground,
							    CSSValueButtonface,
							    CSSValueButtonhighlight,
							    CSSValueButtonshadow,
							    CSSValueButtontext,
							    CSSValueCaptiontext,
							    CSSValueGraytext,
							    CSSValueHighlight,
							    CSSValueHighlighttext,
							    CSSValueInactiveborder,
							    CSSValueInactivecaption,
							    CSSValueInactivecaptiontext,
							    CSSValueInfobackground,
							    CSSValueInfotext,
							    CSSValueMenutext,
    						    CSSValueWebkitFocusRingColor,
    						    CSSValueCurrentcolor,
							    CSSValueGrey,
    						    CSSValueWebkitText,
							    CSSValueMenulist,
							    CSSValueMenulistButton,
							    CSSValueMenulistText,
							    CSSValueMenulistTextfield,
							    CSSValueAquamarine,
							    CSSValueBlueviolet,
							    CSSValueGreenyellow,
							    CSSValueLimegreen,
							    CSSValueOlivedrab,
							    CSSValueOrangered,
							    CSSValueWhitesmoke,
							    CSSValueYellowgreen,
								CSS_RGBCOLOR);

	input[31:0] ident;
	input for_visitedLink;
	input is_link_element;
	input[31:0] document_text_color;
	input[31:0] document_visitedLink_color;
	input[31:0] document_link_color;
	input[31:0] document_activeLink_color;
	input[31:0] inherited_color;
	input[31:0] m_value_rgbcolor;
	input[6:0] m_primitiveUnitType;
	input[9:0] CSSValueMenu;
	input[9:0] CSSValueAqua;
	input[9:0] CSSValueBlack;
	input[9:0] CSSValueBlue;
	input[9:0] CSSValueFuchsia;
	input[9:0] CSSValueGray;
	input[9:0] CSSValueGreen;
	input[9:0] CSSValueLime;
	input[9:0] CSSValueMaroon;
	input[9:0] CSSValueNavy;
	input[9:0] CSSValueOlive;
	input[9:0] CSSValueOrange;
	input[9:0] CSSValuePurple;
	input[9:0] CSSValueRed;
	input[9:0] CSSValueSilver;
	input[9:0] CSSValueTeal;
	input[9:0] CSSValueWhite;
	input[9:0] CSSValueYellow;
	input[9:0] CSSValueTransparent;
    input[9:0] CSSValueWebkitLink;
    input[9:0] CSSValueWebkitActivelink;
	input[9:0] CSSValueActiveborder;
	input[9:0] CSSValueActivecaption;
	input[9:0] CSSValueAppworkspace;
	input[9:0] CSSValueBackground;
	input[9:0] CSSValueButtonface;
	input[9:0] CSSValueButtonhighlight;
	input[9:0] CSSValueButtonshadow;
	input[9:0] CSSValueButtontext;
	input[9:0] CSSValueCaptiontext;
	input[9:0] CSSValueGraytext;
	input[9:0] CSSValueHighlight;
	input[9:0] CSSValueHighlighttext;
	input[9:0] CSSValueInactiveborder;
	input[9:0] CSSValueInactivecaption;
	input[9:0] CSSValueInactivecaptiontext;
	input[9:0] CSSValueInfobackground;
	input[9:0] CSSValueInfotext;
	input[9:0] CSSValueMenutext;
    input[9:0] CSSValueWebkitFocusRingColor;
    input[9:0] CSSValueCurrentcolor;
	input[9:0] CSSValueGrey;
    input[9:0] CSSValueWebkitText;
	input[9:0] CSSValueMenulist;
	input[9:0] CSSValueMenulistButton;
	input[9:0] CSSValueMenulistText;
	input[9:0] CSSValueMenulistTextfield;
	input[9:0] CSSValueAquamarine;
	input[9:0] CSSValueBlueviolet;
	input[9:0] CSSValueGreenyellow;
	input[9:0] CSSValueLimegreen;
	input[9:0] CSSValueOlivedrab;
	input[9:0] CSSValueOrangered;
	input[9:0] CSSValueWhitesmoke;
	input[9:0] CSSValueYellowgreen;
	input[6:0] CSS_RGBCOLOR;
	output[31:0] color_FromPrimitiveValue;

	reg[31:0] non_specific_RGB;

	wire[31:0] document_final_link_color;
	wire[31:0] focus_ring_color;
	wire[31:0] color_for_value;
	wire[31:0] RGB_color;
	wire is_RGBColor;

	mux2_32$ mux1(document_final_link_color,
					document_link_color,
					document_visitedLink_color,
					is_link_element & for_visitedLink);

	colorForCSSValue$ logic2(color_for_value,
							 CSSValueMenu,
							 CSSValueAqua,
							 CSSValueBlack,
							 CSSValueBlue,
							 CSSValueFuchsia,
							 CSSValueGray,
							 CSSValueGreen,
							 CSSValueLime,
							 CSSValueMaroon,
							 CSSValueNavy,
							 CSSValueOlive,
							 CSSValueOrange,
							 CSSValuePurple,
							 CSSValueRed,
							 CSSValueSilver,
							 CSSValueTeal,
							 CSSValueWhite,
							 CSSValueYellow,
							 CSSValueTransparent,
							 CSSValueActiveborder,
							 CSSValueActivecaption,
							 CSSValueAppworkspace,
							 CSSValueBackground,
							 CSSValueButtonface,
							 CSSValueButtonhighlight,
							 CSSValueButtonshadow,
							 CSSValueButtontext,
							 CSSValueCaptiontext,
							 CSSValueGraytext,
							 CSSValueHighlight,
							 CSSValueHighlighttext,
							 CSSValueInactiveborder,
							 CSSValueInactivecaption,
							 CSSValueInactivecaptiontext,
							 CSSValueInfobackground,
							 CSSValueInfotext,
							 CSSValueMenutext,
							 CSSValueGrey,
							 CSSValueMenulist,
							 CSSValueMenulistButton,
							 CSSValueMenulistText,
							 CSSValueMenulistTextfield,
							 CSSValueAquamarine,
							 CSSValueBlueviolet,
							 CSSValueGreenyellow,
							 CSSValueLimegreen,
							 CSSValueOlivedrab,
							 CSSValueOrangered,
							 CSSValueWhitesmoke,
							 CSSValueYellowgreen,
							 ident); // static Color colorForCSSValue(int cssValueId)

	assign focus_ring_color = 32'hFFFFFFFF; // RenderTheme::focusRingColor(); as per the code, either need to new one Color or assign with a platform-dependent const; simply intantiate it here 

	always @(ident)
	begin
		case(ident[9:0])
			0: assign non_specific_RGB = 32'b0;
			CSSValueWebkitText: assign non_specific_RGB = document_text_color;
			CSSValueWebkitLink: assign non_specific_RGB = document_final_link_color;
			CSSValueWebkitActivelink: assign non_specific_RGB = document_activeLink_color;
			CSSValueWebkitFocusRingColor: assign non_specific_RGB = focus_ring_color;
			CSSValueCurrentcolor: assign non_specific_RGB = inherited_color;
			default: assign non_specific_RGB = color_for_value;
		endcase
	end

	comp2_7to1$ comp1(is_RGBColor,
					  m_primitiveUnitType,
					  CSS_RGBCOLOR);
	assign RGB_color = m_value_rgbcolor; // Color(value->getRGBA32Value())
	mux2_32$ mux2(color_FromPrimitiveValue,
				  non_specific_RGB,
				  RGB_color,
				  is_RGBColor);

endmodule

/* used in FontSize */
//module useFixedDefaultSize$(shouldUseFixedDefaultSize, m_genericFamily, MonospaceFamily, font_family, monospaceFamily);
//	(font_family == monospaceFamily); // this is actually a complex point chasing function (refer to platform/graphics/FontFamily.cpp where "==" is overloaded).  We simplify it here.
//endmodule

//module viewportPercentageLength$(viewport_percentage_length, length_type, m_primitiveUnitType, primitive_doublevalue, CSS_VW, CSS_VH, CSS_VMIN, CSS_VMAX);
//// this function returns a Length type (defined in platform/Length.h), where m_type and m_floatValue are needed here
//endmodule
