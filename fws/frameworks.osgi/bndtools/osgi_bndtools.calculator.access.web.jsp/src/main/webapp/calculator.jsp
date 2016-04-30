<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>osgi_bndtools.calculator.access.web.jsp</title>
</head>
<body>

	<%@ page import="java.util.Locale"%>
	<%@ page import="java.util.Set"%>

	<%@ page import="java.math.BigDecimal"%>

	<%@ page import="java.text.DecimalFormatSymbols"%>

	<%@ page
		import="osgi_bndtools.calculator.access.web.type.EMathOperation"%>
	<%@ page
		import="osgi_bndtools.calculator.access.web.CalculatorViewController"%>

	<%!;
	private final static String PARAM_NAME_NUMBER_BUTTON = "num";
	private final static String PARAM_NAME_COMMA_BUTTON = "comma";
	private final static String PARAM_NAME_OPERATION_BUTTON = "op";

	private final static String PARAM_VALUE_OPERATION_ADD = EMathOperation.ADD.name();
	private final static String PARAM_VALUE_OPERATION_DIV = EMathOperation.DIVIDE.name();
	private final static String PARAM_VALUE_OPERATION_MUL = EMathOperation.MULTIPLY.name();
	private final static String PARAM_VALUE_OPERATION_NEG = EMathOperation.NEGATE.name();
	private final static String PARAM_VALUE_OPERATION_SUB = EMathOperation.SUBTRACT.name();

	private final static String PARAM_VALUE_OPERATION_CANCEL = "cancel";
	private final static String PARAM_VALUE_OPERATION_DELETE = "delete";

	private final static String PARAM_VALUE_OPERATION_CALCULATE = "calculate";

	// ...

	private CalculatorViewController calculatorController = new CalculatorViewController();%>

	<%
		final Set<String> parameterNames = request.getParameterMap().keySet();

		if (parameterNames.contains(PARAM_NAME_OPERATION_BUTTON)) {

			// ... OPERATIONAL BUTTON CLICKED

			final String opParamValue = request.getParameter(PARAM_NAME_OPERATION_BUTTON);

			if (opParamValue.equals(PARAM_VALUE_OPERATION_CALCULATE)) {

				// ... OPERATIONAL BUTTON CLICKED: CALCULATE

				calculatorController.calculate();

			} else if (opParamValue.equals(PARAM_VALUE_OPERATION_CANCEL)) {

				// ... OPERATIONAL BUTTON CLICKED: CANCEL

				calculatorController.cancelInput();

			} else if (opParamValue.equals(PARAM_VALUE_OPERATION_DELETE)) {

				// ... OPERATIONAL BUTTON CLICKED: CANCEL

				calculatorController.deleteLastInputSign();

			} else {

				// ... OPERATIONAL BUTTON CLICKED: MATH OPERATION

				final EMathOperation mathOperation = EMathOperation.valueOf(opParamValue);
				calculatorController.selectMathOperation(mathOperation);
			}
		} else {

			// ... INPUT BUTTON CLICKED

			if (parameterNames.contains(PARAM_NAME_NUMBER_BUTTON)) {

				// ... INPUT BUTTON CLICKED: NUMBER

				final String numParamValue = request.getParameter(PARAM_NAME_NUMBER_BUTTON);
				final byte numberValue = Byte.valueOf(numParamValue);

				calculatorController.putInDigitSign(numberValue);

			} else if (parameterNames.contains(PARAM_NAME_COMMA_BUTTON)) {

				// ... INPUT BUTTON CLICKED: COMMA

				calculatorController.putInCommaSign();
			}
		}
	%>

	<form action="">

		<input type="text" value="<%=calculatorController.getDisplayValue()%>" />

		<table>
			<tr>
				<td><button type="submit" name="num" value="7">7</button></td>
				<td><button type="submit" name="num" value="8">8</button></td>
				<td><button type="submit" name="num" value="9">9</button></td>
				<td><button type="submit" name="op"
						value="<%=PARAM_VALUE_OPERATION_DIV%>">/</button></td>
				<td><button type="submit" name="op"
						value="<%=PARAM_VALUE_OPERATION_CANCEL%>">C</button></td>
			</tr>
			<tr>
				<td><button type="submit" name="num" value="4">4</button></td>
				<td><button type="submit" name="num" value="5">5</button></td>
				<td><button type="submit" name="num" value="6">6</button></td>
				<td><button type="submit" name="op"
						value="<%=PARAM_VALUE_OPERATION_MUL%>">*</button></td>
				<td><button type="submit" name="op"
						value="<%=PARAM_VALUE_OPERATION_DELETE%>">&lt;=</button></td>
			</tr>
			<tr>
				<td><button type="submit" name="num" value="1">1</button></td>
				<td><button type="submit" name="num" value="2">2</button></td>
				<td><button type="submit" name="num" value="3">3</button></td>
				<td><button type="submit" name="op"
						value="<%=PARAM_VALUE_OPERATION_SUB%>">-</button></td>
				<td rowspan="2"><button type="submit" name="op"
						value="<%=PARAM_VALUE_OPERATION_CALCULATE%>">=</button></td>
			</tr>
			<tr>
				<td><button type="submit" name="num" value="0">0</button></td>
				<td><button type="submit" name="comma"><%=calculatorController.getDecimalSeparator()%></button></td>
				<td><button type="submit" name="op"
						value="<%=PARAM_VALUE_OPERATION_NEG%>">&plusmn;</button></td>
				<td><button type="submit" name="op"
						value="<%=PARAM_VALUE_OPERATION_ADD%>">+</button></td>
			</tr>
		</table>

	</form>
</body>
</html>