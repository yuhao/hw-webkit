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

module primitiveType$ (primary_type, m_value_calc_category, m_primitiveUnitType, CSS_CALC, CSS_NUMBER, CSS_PERCENTAGE, CSS_PX, CSS_CALC_PERCENTAGE_WITH_NUMBER, CSS_CALC_PERCENTAGE_WITH_LENGTH, CSS_UNKNOWN, CalcNumber, CalcPercent, CalcLength, CalcPercentNumber, CalcPercentLength, CalcVariable, CalcOther);

	input[6:0] m_primitiveUnitType;
	input[2:0] m_value_calc_category;
	input[6:0] CSS_CALC;
	input[6:0] CSS_PX;
	input[6:0] CSS_CALC_PERCENTAGE_WITH_LENGTH;
	input[6:0] CSS_CALC_PERCENTAGE_WITH_NUMBER;
	input[6:0] CSS_NUMBER;
	input[6:0] CSS_PERCENTAGE;
	input[6:0] CSS_UNKNOWN;
	input[2:0] CalcNumber;
    input[2:0] CalcLength;
    input[2:0] CalcPercent;
    input[2:0] CalcPercentNumber;
    input[2:0] CalcPercentLength;
    input[2:0] CalcVariable;
    input[2:0] CalcOther;
	output[6:0] primary_type;

	reg[6:0] temp_value;
	wire temp_sel;

	comp2_7to1$ comp1(temp_sel, m_primitiveUnitType, CSS_CALC);
	mux2_7 mux1(primary_type, m_primitiveUnitType, temp_value, temp_sel);

	always @*
	begin
		case(m_value_calc_category)
			CalcNumber: temp_value = CSS_NUMBER;
			CalcPercent: temp_value = CSS_PERCENTAGE;
			CalcLength: temp_value = CSS_PX;
			CalcPercentNumber: temp_value = CSS_CALC_PERCENTAGE_WITH_NUMBER;
			CalcPercentLength: temp_value = CSS_CALC_PERCENTAGE_WITH_LENGTH;
			CalcVariable: temp_value = CSS_UNKNOWN;
			CalcOther: temp_value = CSS_UNKNOWN;
			default: temp_value = CSS_UNKNOWN;
		endcase
	end

endmodule

module getDoubleValue$(doubleValue, m_primitiveUnitType, CSS_CALC, m_value_calc_doublevalue, m_value_num); // CSSPrimitiveValue::getDoubleValue()

	input[31:0] m_value_calc_doublevalue, m_value_num; // double
	input[6:0] m_primitiveUnitType;
	input[6:0] CSS_CALC;
	output[31:0] doubleValue;

	wire sel;

	comp2_7to1$ comp1(sel, m_primitiveUnitType, CSS_CALC);
	mux2_32$ mux1(doubleValue, m_value_num, m_value_calc_doublevalue, sel);

endmodule

module isFontRelativeLength$(is_fontrelativelength, m_primitiveUnitType, CSS_EMS, CSS_EXS, CSS_REMS, CSS_CHS);

	input[6:0] m_primitiveUnitType;
	input[6:0] CSS_EMS;
	input[6:0] CSS_EXS;
	input[6:0] CSS_REMS;
	input[6:0] CSS_CHS;
	output is_fontrelativelength;

	wire match1, match2, match3, match4;

	comp2_7to1$ comp1(match1, m_primitiveUnitType, CSS_EMS);
	comp2_7to1$ comp2(match2, m_primitiveUnitType, CSS_EXS);
	comp2_7to1$ comp3(match3, m_primitiveUnitType, CSS_REMS);
	comp2_7to1$ comp4(match4, m_primitiveUnitType, CSS_CHS);

	assign is_fontrelativelength = match1 | match2 | match3 | match4;
	
endmodule

module clampTo$(compute_length_float, compute_length_double, maxValueForCssLength, minValueForCssLength);

	input[31:0] compute_length_double;
	input[31:0] maxValueForCssLength, minValueForCssLength;
	output[31:0] compute_length_float;

	assign compute_length_float = compute_length_double; // just do this as of now..

endmodule

`define LENGTH_TYPE_SIZE 42
module makeLength$(compute_length, compute_length_float, type, quirk, is_float);

	parameter Length_size = LENGTH_TYPE_SIZE;

	input[31:0] compute_length_float,
	input[7:0] type;
	input quirk, is_float;
	output[Length_size - 1:0] compute_length;

	assign compute_length = {compute_length_float, type, quirk, is_float};

endmodule

/* used in FontSize */
module computeLength();
	// implements: Length CSSPrimitiveValue::computeLength(RenderStyle* style, RenderStyle* rootStyle, float multiplier, bool computingFontSize)
	// we don't do this part: if (m_primitiveUnitType == CSS_CALC) return m_value.calc->computeLengthPx(style, rootStyle, multiplier, computingFontSize);

	parameter Length_size = LENGTH_TYPE_SIZE;

	input[31:0] multipler; // float
	input computingFontSize;
	input has_rootstyle; // rootStyle
	input[6:0] m_primitiveUnitType;
	input[6:0] CSS_CALC;
	input[6:0] CSS_EMS;
	input[6:0] CSS_EXS;
	input[6:0] CSS_REMS;
	input[6:0] CSS_CHS;
	input[6:0] CSS_PX;
	input[6:0] CSS_CM;
	input[6:0] CSS_MM;
	input[6:0] CSS_IN;
	input[6:0] CSS_PT;
	input[6:0] CSS_PC;
	input[6:0] CSS_CALC_PERCENTAGE_WITH_LENGTH;
	input[6:0] CSS_CALC_PERCENTAGE_WITH_NUMBER;
	input[6:0] CSS_NUMBER;
	input[6:0] CSS_PERCENTAGE;
	input[6:0] CSS_UNKONWN;
	input[2:0] CalcNumber;
    input[2:0] CalcLength;
    input[2:0] CalcPercent;
    input[2:0] CalcPercentNumber;
    input[2:0] CalcPercentLength;
    input[2:0] CalcVariable;
    input[2:0] CalcOther;
	input[31:0] m_specifiedSize; // float, style->fontDescription().specifiedSize()
	input[31:0] m_computedSize; // float, style->fontDescription().computedSize()
	input[31:0] m_root_specifiedSize; // float, rootStyle->fontDescription().specifiedSize()
	input[31:0] m_root_computedSize; // float, rootStyle->fontDescription().computedSize()
	input m_fontmetrics_hasXHeight; // style->fontMetrics().hasXHeight()
	input[31:0] m_fontmetrics_XHeight; // style->fontMetrics().xHeight()
	input[31:0] m_fontmetrics_zeroWidth; // style->fontMetrics().zeroWidth()
	input[31:0] cssPixelsPerInch; // float
	input[2:0] m_value_calc_category; // m_value.calc->category()
	input[31:0] m_value_calc_doublevalue; // double, m_value.calc->doubleValue()
	input[31:0] m_value_num; // double, m_value.num
	input[31:0] minValueForCssLength; // minValueForCssLength;
	input[31:0] maxValueForCssLength; // maxValueForCssLength
	input[4:0] Fixed;
	output[Length_size - 1:0] compute_length;

	reg[31:0] factor; // float
	reg[31:0] result; // double
	reg[31:0] scaled_result; // double

	wire[6:0] primary_type;
	wire[31:0] doubleValue;
	wire is_fontrelativelength;
	wire[31:0] compute_length_double; // double
	wire[31:0] compute_length_float; // float 

	always @*
	begin
		case(primary_type)
			CSS_EMS: factor = computingFontSize ? m_specifiedSize : m_computedSize;
        	CSS_EXS:
        	    if(m_fontmetrics_XHeight) begin factor = m_fontmetrics_XHeight; end
        	    else begin factor = (computingFontSize ? m_specifiedSize : m_computedSize) / 2.0; end
        	CSS_REMS:
        	   	if(rootStyle) begin factor = computingFontSize ? m_root_specifiedSize : m_root_computedSize; end
        	    else begin factor = 1.0; end
        	CSS_CHS: factor = m_fontmetrics_zeroWidth;
        	CSS_PX: factor = 1.0;
        	CSS_CM: factor = cssPixelsPerInch / 2.54; // (2.54 cm/in)
        	CSS_MM: factor = cssPixelsPerInch / 25.4;
        	CSS_IN: factor = cssPixelsPerInch;
        	CSS_PT: factor = cssPixelsPerInch / 72.0;
        	CSS_PC: factor = cssPixelsPerInch * 12.0 / 72.0; // 1 pc == 12 pt
			// not reachable
        	CSS_CALC_PERCENTAGE_WITH_LENGTH: factor = 32'hFFFFFFFF;
        	CSS_CALC_PERCENTAGE_WITH_NUMBER: factor = 32'hFFFFFFFF;
        	default: factor = 32'hFFFFFFFF;
		endcase
	end

	always @*
	begin
		result <= doubleValue * factor;
		scaled_result <= result * multipler;
	end

	primitiveType$ logic1(primary_type, m_value_calc_category, m_primitiveUnitType, CSS_CALC, CSS_NUMBER, CSS_PERCENTAGE, CSS_PX, CSS_CALC_PERCENTAGE_WITH_NUMBER, CSS_CALC_PERCENTAGE_WITH_LENGTH, CSS_UNKNOWN, CalcNumber, CalcPercent, CalcLength, CalcPercentNumber, CalcPercentLength, CalcVariable, CalcOther);
	getDoubleValue$ logic2(doubleValue, m_primitiveUnitType, CSS_CALC, m_value_calc_doublevalue, m_value_num); // CSSPrimitiveValue::getDoubleValue()
	isFontRelativeLength$ logic3(is_fontrelativelength, m_primitiveUnitType, CSS_EMS, CSS_EXS, CSS_REMS, CSS_CHS); // bool isFontRelativeLength()
	mux2_32$ mux1(compute_length_double, scaled_result, result, computingFontSize | is_fontrelativelength);
	clampTo$ clamp1(compute_length_float, compute_length_double, maxValueForCssLength, minValueForCssLength); // template<typename T> inline T clampTo(double value, T min = defaultMinimumForClamp<T>(), T max = defaultMaximumForClamp<T>()) in wtf/MathExtras.h
	makeLength$ length1(compute_length, compute_length_float, {3'b0, Fixed}, 1'b0, 1'b1);

endmodule

//module useFixedDefaultSize$(shouldUseFixedDefaultSize, m_genericFamily, MonospaceFamily, font_family, monospaceFamily);
//	(font_family == monospaceFamily); // this is actually a complex point chasing function (refer to platform/graphics/FontFamily.cpp where "==" is overloaded).  We simplify it here.
//endmodule

//module viewportPercentageLength$(viewport_percentage_length, length_type, m_primitiveUnitType, primitive_doublevalue, CSS_VW, CSS_VH, CSS_VMIN, CSS_VMAX);
//// this function returns a Length type (defined in platform/Length.h), where m_type and m_floatValue are needed here
//endmodule
