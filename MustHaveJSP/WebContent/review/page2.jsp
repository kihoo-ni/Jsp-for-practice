<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="page.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		response.setIntHeader("Refresh", 1);
		out.println("<br>");
		String nowTime=hour+":"+minute+":"+second;
		out.println("현재 접속 시간"+nowTime);
	%>
</body>
</html>