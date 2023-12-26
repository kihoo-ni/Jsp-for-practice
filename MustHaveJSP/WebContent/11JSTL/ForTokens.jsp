<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>forTokens 태그 사용</h4>
	<%
		String  rgba="red, green, blue, black";
	%>
	<c:forTokens items="<%=rgba %>" delims="," var="color">
		<span style="color:${color };">${color } <br></span>
	</c:forTokens>
	
	
</body>
</html>