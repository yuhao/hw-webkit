module TOP();

	// input
	reg clk, reset;
	reg[5:0] class_type;
	reg[4:0] display;
	reg element_valid;
	reg[31:0] node_flag;
	reg InheritFromParent;
	reg[6:0] m_primitiveUnitType;
	reg[31:0] m_value_ident;
	reg m_state_applyPropertyToRegularStyle;
	reg m_applyPropertyToVisitedLinkStyle;
	reg parent_color_isvalid;
	reg is_link_element;
	reg[31:0] parent_color;
	reg[31:0] parent_invalid_color;
	reg[31:0] document_text_color;
	reg[31:0] document_visitedLink_color;
	reg[31:0] document_link_color;
	reg[31:0] document_activeLink_color;
	reg[31:0] m_value_rgbcolor;
	// output
	wire[58:0] noninherited_flags;
	wire[31:0] inherited_color;
	wire[31:0] inherited_visited_color;

	// enum consts for ClassType in css/CSSValue.h
	wire[5:0] PrimitiveClass = 6'd0;
	// enum consts for EDisplay in rendering/style/RenderStyleConstants.h
	wire[4:0] NONE = 5'd0;
	wire[4:0] INLINE = 5'd1;
	wire[4:0] BLOCK = 5'd2;
	// enum consts for PseudoId in rendering/style/RenderStyleConstants.h
	wire[5:0] NOPSEUDO = 6'd0;
	// generated enum consts in obj/gen/webkit/CSSValueKeywords.h
	wire[9:0] CSSValueMenu = 10'd15;
	wire[9:0] CSSValueAqua = 10'd72;
	wire[9:0] CSSValueBlack = 10'd73;
	wire[9:0] CSSValueBlue = 10'd74;
	wire[9:0] CSSValueFuchsia = 10'd75;
	wire[9:0] CSSValueGray = 10'd76;
	wire[9:0] CSSValueGreen = 10'd77;
	wire[9:0] CSSValueLime = 10'd78;
	wire[9:0] CSSValueMaroon = 10'd79;
	wire[9:0] CSSValueNavy = 10'd80;
	wire[9:0] CSSValueOlive = 10'd81;
	wire[9:0] CSSValueOrange = 10'd82;
	wire[9:0] CSSValuePurple = 10'd83;
	wire[9:0] CSSValueRed = 10'd84;
	wire[9:0] CSSValueSilver = 10'd85;
	wire[9:0] CSSValueTeal = 10'd86;
	wire[9:0] CSSValueWhite = 10'd87;
	wire[9:0] CSSValueYellow = 10'd88;
	wire[9:0] CSSValueTransparent = 10'd89;
    wire[9:0] CSSValueWebkitLink = 10'd90;
    wire[9:0] CSSValueWebkitActivelink = 10'd91;
	wire[9:0] CSSValueActiveborder = 10'd92;
	wire[9:0] CSSValueActivecaption = 10'd93;
	wire[9:0] CSSValueAppworkspace = 10'd94;
	wire[9:0] CSSValueBackground = 10'd95;
	wire[9:0] CSSValueButtonface = 10'd96;
	wire[9:0] CSSValueButtonhighlight = 10'd97;
	wire[9:0] CSSValueButtonshadow = 10'd98;
	wire[9:0] CSSValueButtontext = 10'd99;
	wire[9:0] CSSValueCaptiontext = 10'd100;
	wire[9:0] CSSValueGraytext = 10'd101;
	wire[9:0] CSSValueHighlight = 10'd102;
	wire[9:0] CSSValueHighlighttext = 10'd103;
	wire[9:0] CSSValueInactiveborder = 10'd104;
	wire[9:0] CSSValueInactivecaption = 10'd105;
	wire[9:0] CSSValueInactivecaptiontext = 10'd106;
	wire[9:0] CSSValueInfobackground = 10'd107;
	wire[9:0] CSSValueInfotext = 10'd108;
	wire[9:0] CSSValueMenutext = 10'd109;
    wire[9:0] CSSValueWebkitFocusRingColor = 10'd119;
    wire[9:0] CSSValueCurrentcolor = 10'd120;
	wire[9:0] CSSValueGrey = 10'd121;
    wire[9:0] CSSValueWebkitText = 10'd122;
	wire[9:0] CSSValueMenulist = 10'd448;
	wire[9:0] CSSValueMenulistButton = 10'd449;
	wire[9:0] CSSValueMenulistText = 10'd450;
	wire[9:0] CSSValueMenulistTextfield = 10'd451;
	wire[9:0] CSSValueAquamarine = 10'd595;
	wire[9:0] CSSValueBlueviolet = 10'd600;
	wire[9:0] CSSValueGreenyellow = 10'd642;
	wire[9:0] CSSValueLimegreen = 10'd668;
	wire[9:0] CSSValueOlivedrab = 10'd687;
	wire[9:0] CSSValueOrangered = 10'd688;
	wire[9:0] CSSValueWhitesmoke = 10'd721;
	wire[9:0] CSSValueYellowgreen = 10'd722;
	// enum consts for UnitTypes in css/CSSPrimitiveValue.h
	wire[6:0] CSS_IDENT = 7'd21;
	wire[6:0] CSS_RGBCOLOR = 7'd25;

	display$ display_logic( clk,
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

	color$ color_logic( clk,
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
						PrimitiveClass,
						CSS_IDENT,
						CSS_RGBCOLOR,
						inherited_color,
						inherited_visited_color);

	initial
	begin
		clk = 1'b0;
		reset = 1'b0;

		// Display
		class_type = 6'b0;
		display = 5'b10;
		element_valid = 1'b1;
		node_flag = 32'b100000;

		// Color
		InheritFromParent = 1'b1;
		m_primitiveUnitType = 7'd21; // make it match CSS_IDENT
		m_value_ident = CSSValueWebkitLink;
		m_state_applyPropertyToRegularStyle = 1'b1;
		m_applyPropertyToVisitedLinkStyle = 1'b1;
		parent_color_isvalid = 1'b1;
		is_link_element = 1'b0;
		parent_color = CSSValueLimegreen;
		parent_invalid_color = 32'd0;
		document_text_color = CSSValueLimegreen;
		document_visitedLink_color = CSSValueLimegreen;
		document_link_color = CSSValueLimegreen;
		document_activeLink_color = CSSValueLimegreen;
		m_value_rgbcolor = 32'h1234ABCD;

		#1
		reset = 1'b1;
		#1
		reset = 1'b0;
		#18
		clk = 1'b1;
		#20
		clk = 1'b0;
		#1
		$display(noninherited_flags, inherited_color, inherited_visited_color);
	end

	initial #1000 $finish;

	initial
	begin
		$dumpfile("sru.vcd");
		$dumpvars(0, TOP);
	end

endmodule

