<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	아이디 : <%=request.getAttribute("id") %><br>
	비밀번호 : <%=request.getAttribute("pw") %><br>
	<a href="./login.do">아이디/ 비밀번호 확인 </a><br>
</body>
</html>