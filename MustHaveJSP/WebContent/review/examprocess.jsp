<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("name");
	String password=request.getParameter("password");
	
	if(password.equals("1234")){
		response.sendRedirect("result.jsp");
	} else {
		request.getRequestDispatcher("exam1.jsp?pwErr=1").forward(request,response);
	}
%>
</body>
</html>