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
 	wire[6:0] CSS_UNKNOWN = 7'd0;
    wire[6:0] CSS_NUMBER = 7'd1;
    wire[6:0] CSS_PERCENTAGE = 7'd2;
    wire[6:0] CSS_EMS = 7'd3;
    wire[6:0] CSS_EXS = 7'd4;
    wire[6:0] CSS_PX = 7'd5;
    wire[6:0] CSS_CM = 7'd6;
    wire[6:0] CSS_MM = 7'd7;
    wire[6:0] CSS_IN = 7'd8;
    wire[6:0] CSS_PT = 7'd9;
    wire[6:0] CSS_PC = 7'd10;
    wire[6:0] CSS_DEG = 7'd11;
    wire[6:0] CSS_RAD = 7'd12;
    wire[6:0] CSS_GRAD = 7'd13;
    wire[6:0] CSS_MS = 7'd14;
    wire[6:0] CSS_S = 7'd15;
    wire[6:0] CSS_HZ = 7'd16;
    wire[6:0] CSS_KHZ = 7'd17;
    wire[6:0] CSS_DIMENSION = 7'd18;
    wire[6:0] CSS_STRING = 7'd19;
    wire[6:0] CSS_URI = 7'd20;
    wire[6:0] CSS_IDENT = 7'd21;
    wire[6:0] CSS_ATTR = 7'd22;
    wire[6:0] CSS_COUNTER = 7'd23;
    wire[6:0] CSS_RECT = 7'd24;
    wire[6:0] CSS_RGBCOLOR = 7'd25;
    wire[6:0] CSS_VW = 7'd26;
    wire[6:0] CSS_VH = 7'd27;
    wire[6:0] CSS_VMIN = 7'd28;
    wire[6:0] CSS_VMAX = 7'd29;
    wire[6:0] CSS_DPPX = 7'd30;
    wire[6:0] CSS_DPI = 7'd31;
    wire[6:0] CSS_DPCM = 7'd32;
    wire[6:0] CSS_PAIR = 7'd33;
    wire[6:0] CSS_UNICODE_RANGE = 7'd34;
    wire[6:0] CSS_PARSER_OPERATOR = 7'd35;
    wire[6:0] CSS_PARSER_INTEGER = 7'd36;
    wire[6:0] CSS_PARSER_HEXCOLOR = 7'd37;
    wire[6:0] CSS_PARSER_IDENTIFIER = 7'd38;
    wire[6:0] CSS_TURN = 7'd39;
    wire[6:0] CSS_REMS = 7'd40;
    wire[6:0] CSS_CHS = 7'd41;
	wire[6:0] CSS_COUNTER_NAME = 7'd42;
    wire[6:0] CSS_SHAPE = 7'd43;
    wire[6:0] CSS_QUAD = 7'd44;
    wire[6:0] CSS_CALC = 7'd45;
    wire[6:0] CSS_CALC_PERCENTAGE_WITH_NUMBER = 7'd46;
    wire[6:0] CSS_CALC_PERCENTAGE_WITH_LENGTH = 7'd47;
    wire[6:0] CSS_VARIABLE_NAME = 7'd48;
	// enum consts for CalculationCategory in css/CSSCalculationValue.h
	wire[2:0] CalcNumber = 3'd0;
    wire[2:0] CalcLength = 3'd1;
    wire[2:0] CalcPercent = 3'd2;
    wire[2:0] CalcPercentNumber = 3'd3;
    wire[2:0] CalcPercentLength = 3'd4;
    wire[2:0] CalcVariable = 3'd5;
    wire[2:0] CalcOther = 3'd6;
	// consts defined in css/CSSPrimitiveValue.cpp
	wire[31:0] maxValueForCssLength = 32'd33554429; // INT_MAX / kFixedPointDenominator - 2;
	wire[31:0] minValueForCssLength = 32'd4261412866; // INT_MIN / kFixedPointDenominator + 2; This is negative number
	// const defined in css/CSSHelper.h
	wire[31:0] cssPixelsPerInch = 96; // float cssPixelsPerInch = 96;
	// enum consts for LengthType in platform/Length.h
	wire[4:0] Auto = 5'd0;
	wire[4:0] Relative = 5'd1;
	wire[4:0] Percent = 5'd2;
	wire[4:0] Fixed = 5'd3;
	wire[4:0] Intrinsic = 5'd4;
	wire[4:0] MinIntrinsic = 5'd5;
	wire[4:0] MinContent = 5'd6;
	wire[4:0] MaxContent = 5'd7;
	wire[4:0] FillAvailable = 5'd8;
	wire[4:0] FitContent = 5'd9;
	wire[4:0] Calculated = 5'd10;
	wire[4:0] ViewportPercentageWidth = 5'd12;
	wire[4:0] ViewportPercentageHeight = 5'd13;
	wire[4:0] ViewportPercentageMin = 5'd14;
	wire[4:0] ViewportPercentageMax = 5'd15;
	wire[4:0] Undefined = 5'd16;

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
		m_value_ident = 32'h12345678;
		m_state_applyPropertyToRegularStyle = 1'b1;
		m_applyPropertyToVisitedLinkStyle = 1'b1;
		parent_color_isvalid = 1'b1;
		is_link_element = 1'b1;
		parent_color = CSSValueLimegreen;
		parent_invalid_color = 32'd0;
		document_text_color = CSSValueLimegreen;
		document_visitedLink_color = CSSValueYellow;
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

