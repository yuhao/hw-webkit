// assume float, double, string are all 32-bit wide
module fontsize();
	// implements: setPropertyHandler(CSSPropertyFontSize, ApplyPropertyFontSize::createHandler());

	input clk;
	input[5:0] class_type; // m_classType
	input[31:0] parent_size; // styleResolver->parentStyle()->fontDescription().specifiedSize()
	input parent_isAbsoluteSize; // styleResolver->parentStyle()->fontDescription().isAbsoluteSize()
	input[6:0] m_primitiveUnitType;
	input[31:0] m_value_ident; // m_value.ident
	input has_parent_style;
	input m_genericFamily; // genericFamily() called by useFixedDefaultSize()
	input has_family_next; // family().next() called by useFixedDefaultSize()
	input[31:0] font_family; // fake the string here. family().family() called by useFixedDefaultSize()
	input document_has_settings; // document->settings() in styleResolver->fontSizeForKeyword()
	input quirksMode; // document->inQuirksMode() in styleResolver->fontSizeForKeyword()
	input[31:0] default_fixed_fontsize; // settings->defaultFixedFontSize() called by styleResolver->fontSizeForKeyword()
	input[31:0] default_fontsize; // settings->defaultFontSize() called by styleResolver->fontSizeForKeyword()
	input[31:0] minimumLogicalFontSize; // settings->minimumLogicalFontSize() called by styleResolver->fontSizeForKeyword()
	input[31:0] m_value_num; // m_value.num
	input[31:0] m_value_calc_d; // m_value.calc->doubleValue()
	input[31:0] m_value_calc; // primitiveValue->cssCalcValue()->toCalcValue(styleResolver->parentStyle(), styleResolver->rootElementStyle())->evaluate(parentSize); very complex..., we just assume the outcome is m_value_calc, and treat it as an input..
	input has_renderview; // styleResolver->document()->renderView()

	// enum consts for UnitTypes in css/CSSPrimitiveValue.h
	wire[6:0] CSS_IDENT = 7'd21;
	wire[6:0] CSS_EMS = 7'd3;
	wire[6:0] CSS_EXS = 7'd4;
	wire[6:0] CSS_PC = 7'd10;
	wire[6:0] CSS_VW = 7'd26;
	wire[6:0] CSS_VH = 7'd27;
	wire[6:0] CSS_VMIN = 7'd28;
	wire[6:0] CSS_VMAX = 7'd29;
	wire[6:0] CSS_REMS = 7'd40; // defined as 108 but in fact just 40th
	wire[6:0] CSS_CHS = 7'd41; // defined as 109 but in fact just 41th
	wire[6:0] CSS_CALC = 7'd45; // defined as 113 but in fact just 45th
	wire[6:0] CSS_CALC_PERCENTAGE_WITH_LENGTH = 7'd47; // defined as 115 but in fact just 47th

	// enum consts for GenericFamilyType in platform/graphics/FontDescription.h
	wire[2:0] MonospaceFamily = 3'd4;

	// generated consts
	wire[31:0] monospaceFamily = 32'hFFFFFFFF; // this is actually a string, fake it here

	// consts defined in css/StyleResolver.cpp
	wire[3:0] fontSizeTableMin = 4'd9;
	wire[4:0] fontSizeTableMax = 5'd10;

	// generated enum consts in obj/gen/webkit/CSSValueKeywords.h
	wire[9:0] CSSValueXxSmall = 10'd45;

	// enum consts for LengthType in platform/Length.h
	wire[3:0] ViewportPercentageWidth = 4'd12;
	wire[3:0] ViewportPercentageHeight = 4'd13;
	wire[3:0] ViewportPercentageMin = 4'd14
	wire[3:0] ViewportPercentageMax = 4'd15;

	// consts defined in rendering/style/RenderStyleConstants.h
	wire[31:0] maximumAllowedFontSize = 32'hFFFFFFFF; // this is actually a floating point, should have stored in floating point format...

	wire is_primitive_value;
	wire[9:0] ident; // in fact, 10 bits is enough since it's compared with CSSValueID
	wire shouldUseFixedDefaultSize;
	wire is_percentage;
	wire ls_length;
	wire is_calculatedPercentageWithLength;
	wire[31:0] primitive_floatvalue;
	wire[31:0] primitive_doublevalue;
	wire[31:0] viewport_percentage_length;
	wire[31:0] size1, size2, size3, size4, size5, size6, size7, size8, size;

	comp2_6to1$ comp1(is_primitive_value, class_type, PrimitiveClass);

	getIdent$ logic1(ident, m_primitiveUnitType, CSS_IDENT, m_value_ident);
	useFixedDefaultSize$ logic2(shouldUseFixedDefaultSize, m_genericFamily, MonospaceFamily, font_family, monospaceFamily);
	isPercentage$ logic3(is_percentage, primitive_type, CSS_PERCENTAGE, CSS_EMS, CSS_EXS, CSS_REMS, CSS_CHS);
	isLength$ logic4(is_length, primitive_type, CSS_EMS, CSS_PC, CSS_REMS, CSS_CHS);
	isCalculatedPercentageWithLength$ logic5(is_calculatedPercentageWithLength, primitive_type, CSS_CALC_PERCENTAGE_WITH_LENGTH);
	isViewportPercentageLength$ logic6(is_viewportPercentageLength, primitive_type, CSS_VW, CSS_VMAX);
	getFloatValue$ logic7(primitiveValue_floatvalue, m_primitiveUnitType, CSS_CALC, m_value_num, primitive_doublevalue); // primitiveValue->getFloatValue()
	getDoubleValue$ logic8(primitive_doublevalue, m_value_calc_d); // CSSPrimitiveValue::getDoubleValue()
	viewportPercentageLength$ logic9(viewport_percentage_length, length_type, m_primitiveUnitType, primitive_doublevalue, CSS_VW, CSS_VH, CSS_VMIN, CSS_VMAX); // CSSPrimitiveValue::viewportPercentageLength(), which returns a Length type, in which both the raw value and length type are used later in valueForLength();

	fontSizeForKeyword$ size_logic1(size1, ident, shouldUseFixedDefaultSize, document_has_settings, quirksMode, default_fixed_fontsize, default_fontsize, minimumLogicalFontSize, fontSizeTableMin, fontSizeTableMax, CSSValueXxSmall)
	largeFontSize$ size_logic2(size2, parent_size);
	smallFontSize$ size_logic3(size3, parent_size);
	computeLength$ size_logic4(size4);
	calFloatValue$ size_logic5(size5, primitiveValue_floatvalue, parent_size); // size = (primitiveValue->getFloatValue() * parentSize) / 100.0f;
	cssCalcValue$ size_logic6(size6, m_value_calc);
	valueForLength$ size_logic7(size7, viewport_percentage_length, length_type, has_renderview); // valueForLength(primitiveValue->viewportPercentageLength(), 0, styleResolver->document()->renderView()), which is implemented in css/LengthFunctions.cpp
	finalSize$ size_logic9(size, size1, size2, size3, size4, size5, size6, size7, size8);

	setKeywordSize$ set_keyword_logic1(keyword_size1, ident, CSSValueXxSmall);

	setIsAbsoluteSize1$ set_isabs_size_logic1(parent_isAbsoluteSize, ident, CSSValueLarger, CSSValueSmaller);
	setIsAbsoluteSize2$ set_isabs_size_logic2(parent_isAbsoluteSize, is_percentage);

	setFontSize$ set_font_size_logic1(size);
	setFontDescription$ set_font_desc_logic1();

endmodule
