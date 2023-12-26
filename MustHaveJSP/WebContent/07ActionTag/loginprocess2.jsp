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
		out.print(request.getAttribute("id")+ "<br>");
		out.print(pageContext.getAttribute("pw"));
	
		String id=(String)request.getAttribute("id");
		String pw=(String)pageContext.getAttribute("pw");
	%>
	
	<h2><%=id %></h2>
	<h2><%=pw %></h2>
</body>
</html>