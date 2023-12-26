<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>숫자 포맷 설정</h4>
	<c:set var="number1" value="12345"/> <!-- 값넣을때 기호넣으면 문자로인식함 -->
	콤마 0 : <fmt:formatNumber value="${number1 }"/><br>
	콤마 x : <fmt:formatNumber value="${number1 }" groupingUsed="false"/><br>
	<fmt:formatNumber value="${number1}" type="currency" var="printNum1"/>
	통화기호 : ${printNum1 }<br>
	<fmt:formatNumber value="0.03" type="percent" var="printNum2"/>
	통화기호 : ${printNum2 }<br>
	
	<h4>숫자 형변환</h4>
	<c:set var="number2" value="6,789.01"/>
	<fmt:parseNumber value="${number2 }" pattern="0,000.00" var="printNum3"/>
	소숫점까지 : ${printNum3 }<br>
	<fmt:parseNumber value="${number2 }" integerOnly="true" var="printNum4"/>
	정수부분만 : ${printNum4 }<br>
	
	
</body>
</html>