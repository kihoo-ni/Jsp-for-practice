<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String carName=request.getParameter("carName");
		int carPrice=Integer.parseInt(request.getParameter("carPrice"));
		String carColor=request.getParameter("carColor");
		
	%>
	<h1>1. 자바빈즈 생성</h1>
		<jsp:useBean id="car" class="common.Car" scope="request"/>
		
		
	<h1>2. 자바빈즈 값 세팅</h1>
		<jsp:setProperty property="carName" name="car" value="<%=carName %>"/>
		<jsp:setProperty property="carPrice" name="car" value="<%=carPrice %>"/>
		<jsp:setProperty property="carColor" name="car" value="<%=carColor %>"/>
		
	<h1>3. 자바빈즈로 생성된 값 출력</h1>
		<h3>자동차 이름 : <jsp:getProperty property="carName" name="car"/></h3>
		<h3>자동차 가격 : <jsp:getProperty property="carPrice" name="car"/></h3>
		<h3>자동차 색깔 : <jsp:getProperty property="carColor" name="car"/></h3>
</body>
</html>