<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
	<ul>
		<li>전송값1 : <%=request.getParameter("eng")  %></li>	
		<li>전송값2 : <%=request.getParameter("han")  %></li>	
		<li>데이터 전송 방식 : <%=request.getMethod()  %></li>	
		<li>URL : <%=request.getRequestURL()  %></li>	
		<li>URI : <%=request.getRequestURI()  %></li>	
	</ul>
</body>
</html>