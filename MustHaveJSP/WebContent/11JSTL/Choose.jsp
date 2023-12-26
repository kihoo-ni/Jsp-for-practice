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
	<c:set var="number" value="100"/>
	
	<h3>choose태그로 홀-짝 판단출력</h3>
	<c:choose>
		<c:when test="${number % 2 ==0 }">
			${number }는 짝수.			
		</c:when>
		<c:otherwise>
			${number }는 홀수.					
		</c:otherwise>
	</c:choose>
</body>
</html>