<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="car" class="common.Car" scope="request"></jsp:useBean>
	<ul>
		
		<li> 회사 <jsp:getProperty property="carName" name="car"/> </li>
		<li> 가격 <jsp:getProperty property="carPrice" name="car"/> </li>
		<li> 컬러 <jsp:getProperty property="carColor" name="car"/> </li>
		<li>자동차의 최고 속도는 <%=request.getParameter("maxSpeed") %></li>
		<li> 연식 <%=request.getParameter("연식") %></li>
	</ul>
	
</body>
</html>