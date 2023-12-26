<%@page import="org.apache.catalina.filters.SetCharacterEncodingFilter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); 
		String id=request.getParameter("id"); 
		String pw=request.getParameter("pw"); 
	%>
	<%
	//id:jsp pw:1234 
	// 맞을경우 "환영합니다", 아이디 맞는데 비밀번호 틀릴경우 "비밀번호가 틀립니다", 아이디가 안맞을 경우 "사용할 수 없는 아이디" 출력
	if(id.equals("jsp")){
		if(pw.equals("1234")){
			out.print("환영합니다");
		} else {
			out.print("비밀번호가 틀렸습니다");
		}
	} else {
		out.print("사용할 수 없는 아이디입니다.");
	}
	%>
</body>
</html>