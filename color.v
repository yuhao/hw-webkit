module color$(  clk,
				reset,
				class_type,
				InheritFromParent,
				m_primitiveUnitType,
				m_value_ident,
				m_state_applyPropertyToRegularStyle,
				m_applyPropertyToVisitedLinkStyle,
				parent_color_isvalid,
				is_link_element,
				parent_color,
				parent_invalid_color,
				document_text_color,
				document_visitedLink_color,
				document_link_color,
				document_activeLink_color,
				m_value_rgbcolor,
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
    			CSSValueWebkitFocusRingColor,
    			CSSValueCurrentcolor,
				CSSValueGrey,
    			CSSValueWebkitText,
				PrimitiveClass,
				CSS_IDENT,
				CSS_RGBCOLOR,
				inherited_color,
				inherited_visited_color);
	//implement: setPropertyHandler(CSSPropertyColor, ApplyPropertyColor<InheritFromParent, &RenderStyle::color, &RenderStyle::setColor, &RenderStyle::setVisitedLinkColor, &RenderStyle::invalidColor, RenderStyle::initialColor>::createHandler());
	// Color is really just RGBA, each takes 8 bits (256 color), and they sit side by side in the final 32-bit wide value

	// io signals
	input clk, reset;
	input[5:0] class_type; // m_classType
	input InheritFromParent; // enum type ColorInherit defined in css/StyleBuilder.cpp, always 1 in CSSPropertyColor
	input[6:0] m_primitiveUnitType;
	input[31:0] m_value_ident; // m_value.ident
	input m_state_applyPropertyToRegularStyle; // m_state.applyPropertyToRegularStyle
	input m_applyPropertyToVisitedLinkStyle; // m_applyPropertyToVisitedLinkStyle
	input parent_color_isvalid; // ((styleResolver->parentStyle()->*getterFunction)()).isValid()
	input is_link_element; // state.element()->isLink()
	input[31:0] parent_color; // (styleResolver->parentStyle()->*getterFunction)()
	input[31:0] parent_invalid_color; // (styleResolver->parentStyle()->*defaultFunction)(), in which defaultFunction is RenderStyle::invalidColor here..
	input[31:0] document_text_color; // state.document()->textColor()
	input[31:0] document_visitedLink_color; // state.document()->visitedLinkColor()
	input[31:0] document_link_color; // state.document()->linkColor()
	input[31:0] document_activeLink_color; // state.document()->activeLinkColor();
	input[31:0] m_value_rgbcolor; // m_value.rgbcolor
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
    input[9:0] CSSValueWebkitFocusRingColor;
    input[9:0] CSSValueCurrentcolor;
	input[9:0] CSSValueGrey;
    input[9:0] CSSValueWebkitText;
	input[6:0] CSS_IDENT;
	input[6:0] CSS_RGBCOLOR;
	input[5:0] PrimitiveClass;
	output[31:0] inherited_color; // inherited->color, where inherited is of type DataRef<StyleInheritedData>
	output[31:0] inherited_visited_color; // inherited->visitedLinkcolor, where inherited is of type DataRef<StyleInheritedData>

	wire is_primitive_value;
	wire ld_en_color, ld_en_visited_color;
	wire sel_color_2apply, sel_visited_color_2apply;
	wire is_csscurrentcolor;
	wire has_to_inherit; // implements: if (inheritColorFromParent && primitiveValue->getIdent() == CSSValueCurrentcolor)
	wire[31:0] ident; // only 10 bits is enough when it's compared with CSSValueID
	wire[31:0] inherit_color_2apply, color_FromPrimitiveValue, visited_color_FromPrimitiveValue;
	wire[31:0] color_2apply, visited_color_2apply;

	assign ld_en_color = is_primitive_value & m_state_applyPropertyToRegularStyle;
	assign ld_en_visited_color = is_primitive_value & m_applyPropertyToVisitedLinkStyle;
	assign has_to_inherit = InheritFromParent & is_csscurrentcolor;
	assign sel_color_2apply = has_to_inherit;
	assign sel_visited_color_2apply = has_to_inherit;

	comp2_6to1$ comp1(is_primitive_value,
					  class_type,
					  PrimitiveClass);
	comp2_10to1$ comp2(is_csscurrentcolor,
					   ident[9:0],
					   CSSValueCurrentcolor);

	mux2_32$ mux1(inherit_color_2apply,
				  parent_color,
				  parent_invalid_color,
				  parent_color_isvalid);
	mux2_32$ mux2(color_2apply,
				  color_FromPrimitiveValue,
				  inherit_color_2apply,
				  sel_color_2apply);
	mux2_32$ mux3(visited_color_2apply,
				  visited_color_FromPrimitiveValue,
				  inherit_color_2apply,
				  sel_visited_color_2apply);

	getIdent$ logic1(ident,
					 m_primitiveUnitType,
					 CSS_IDENT,
					 m_value_ident);
	colorFromPrimitiveValue$ logic2(color_FromPrimitiveValue,
									ident,
									1'b0,
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
    						    	CSSValueWebkitFocusRingColor,
    						    	CSSValueCurrentcolor,
							    	CSSValueGrey,
    						    	CSSValueWebkitText,
									CSS_RGBCOLOR); // colorFromPrimitiveValue(primitiveValue)
	colorFromPrimitiveValue$ logic3(visited_color_FromPrimitiveValue,
									ident,
									1'b1,
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
    						    	CSSValueWebkitFocusRingColor,
    						    	CSSValueCurrentcolor,
							    	CSSValueGrey,
    						    	CSSValueWebkitText,
									CSS_RGBCOLOR); // colorFromPrimitiveValue(primitiveValue, true)

	dff_32$ dff1(color_2apply,
				 inherited_color,
				 reset,
				 clk,
				 ld_en_color); // void RenderStyle::setColor(const Color& v) { SET_VAR(inherited, color, v); }
	dff_32$ dff2(visited_color_2apply,
				 inherited_visited_color,
				 reset,
				 clk,
				 ld_en_visited_color); // void RenderStyle::setVisitedLinkColor(const Color& v) { SET_VAR(inherited, visitedLinkColor, v); }

endmodule

