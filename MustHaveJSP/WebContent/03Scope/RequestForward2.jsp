<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>포워드로 전달된 페이지</h2>
	<% 
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("name");
	%>
	<h2><%=name %></h2>
	<li> Integer 객체 : <%=request.getAttribute("requestInteger")  %></li>
</body>
</html>