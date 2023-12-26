<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String pwErr=request.getParameter("pwErr");
	if(pwErr!=null){
		out.print("비밀번호가 틀렸습니다");
	}
%>
<form action="examprocess.jsp" method="get">
	이름<input type="text" name="name"><br>
	비밀번호<input type="text" name="password"><br>
	<input type="submit" value="제출">
</form>
</body>
</html>