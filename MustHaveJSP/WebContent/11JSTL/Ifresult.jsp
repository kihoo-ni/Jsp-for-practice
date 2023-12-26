<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%
		
		int num=Integer.parseInt(request.getParameter("num"));
		
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <c:set var="num" value="<%=num %>"/> --%>
	<c:set var="num" value='<%=request.getParameter("num") %>'/>
	
	<c:if test="${num mod 3 eq 0 }" var="result1">
	 ${num }은 3의배수 입니다.<br>
	 </c:if>
	 result : ${result1 }<br>
	 
	<c:if test="${not result}" var="result2">
	 ${num }은 3의배수가 아닙니다.<br>
	 </c:if>
	 result : ${result2 }<br>
	
</body>
</html>