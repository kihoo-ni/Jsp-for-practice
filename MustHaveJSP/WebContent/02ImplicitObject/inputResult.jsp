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
		int num1=Integer.parseInt(request.getParameter("num1"));
		int num2=Integer.parseInt(request.getParameter("num2"));
		int result=0;
		for(int i=num1; i<=num2; i++){
			result+=i;}
		%>
		<h1> 시작숫자는 <%=num1%>, 끝 숫자는 <%=num2%> <br><%=num1%>부터 <%=num2%>까지의 합계는 <%=result%>이다.</h1>
</body>
</html>